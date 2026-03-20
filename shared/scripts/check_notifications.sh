#!/bin/bash

################################################################################
# Notification Check Script - Smart Cache Version
# Purpose: Check for new notifications when AI session starts
# Usage: ./check_notifications.sh <AI_NAME>
# Example: ./check_notifications.sh max
################################################################################

# Configuration
AI_NAME="${1:-max}"  # First parameter is AI name, default max
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SHARED_DIR="$(dirname "$SCRIPT_DIR")"
NOTIFICATION_FILE="$SHARED_DIR/notifications.json"
CACHE_FILE="$SHARED_DIR/.notification_cache.json"

# Color output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Output functions
info() { echo -e "${BLUE}[INFO]${NC} $1"; }
success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Check dependencies
if ! command -v jq &> /dev/null; then
    error "jq not installed, please install first: brew install jq"
    exit 1
fi

# Check file existence
if [ ! -f "$NOTIFICATION_FILE" ]; then
    error "Notification file does not exist: $NOTIFICATION_FILE"
    exit 1
fi

if [ ! -f "$CACHE_FILE" ]; then
    warning "Cache file does not exist, creating new cache"
    # Create default cache
    cat > "$CACHE_FILE" <<EOF
{
  "meta": {
    "version": "1.0.0",
    "last_global_update": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
  },
  "ai_agents": {
    "max": {"last_check_timestamp": "1970-01-01T00:00:00Z", "last_notification_mtime": 0, "unread_count": 0},
    "ella": {"last_check_timestamp": "1970-01-01T00:00:00Z", "last_notification_mtime": 0, "unread_count": 0},
    "jarvis": {"last_check_timestamp": "1970-01-01T00:00:00Z", "last_notification_mtime": 0, "unread_count": 0},
    "kyle": {"last_check_timestamp": "1970-01-01T00:00:00Z", "last_notification_mtime": 0, "unread_count": 0}
  },
  "file_mtimes": {}
}
EOF
fi

# Get file mtime (cross-platform)
get_mtime() {
    local file="$1"
    if [[ "$OSTYPE" == "darwin"* ]]; then
        stat -f %m "$file" 2>/dev/null || echo "0"
    else
        stat -c %Y "$file" 2>/dev/null || echo "0"
    fi
}

# Main logic
info "Checking notification updates (AI: $AI_NAME)"
echo ""

# 1. Get current mtime
CURRENT_MTIME=$(get_mtime "$NOTIFICATION_FILE")
info "Current file mtime: $CURRENT_MTIME"

# 2. Read cached mtime
CACHED_MTIME=$(jq -r ".ai_agents.$AI_NAME.last_notification_mtime // 0" "$CACHE_FILE")
info "Cached mtime: $CACHED_MTIME"

# 3. Compare and decide
if [ "$CURRENT_MTIME" -gt "$CACHED_MTIME" ]; then
    success "New notifications detected!"
    echo ""

    # 4. Read and filter notifications
    info "Reading unread notifications..."

    # Filter conditions:
    # - to field is current AI or "all"
    # - read_by array does not contain current AI
    # - Not expired
    CURRENT_ISO=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

    UNREAD_NOTIFICATIONS=$(jq --arg ai "$AI_NAME" --arg now "$CURRENT_ISO" '
        [.notifications[] |
         select((.to == $ai or .to == "all") and
                (.read_by | contains([$ai]) | not) and
                (.expires_at > $now))]
    ' "$NOTIFICATION_FILE")

    UNREAD_COUNT=$(echo "$UNREAD_NOTIFICATIONS" | jq 'length')

    if [ "$UNREAD_COUNT" -gt 0 ]; then
        echo ""
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo "  📬 You have $UNREAD_COUNT unread notifications"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo ""

        # Display notification summary
        echo "$UNREAD_NOTIFICATIONS" | jq -r '.[] |
            "【\(.priority | ascii_upcase)】\(.subject)\n" +
            "  From: \(.from)\n" +
            "  Time: \(.timestamp)\n" +
            "  Type: \(.type)\n" +
            "  ID: \(.id)\n"'

        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo ""
        info "Please use Read tool to view detailed content: $NOTIFICATION_FILE"
    else
        success "No unread notifications (all notifications read or expired)"
    fi

    # 5. Update cache
    info "Updating cache..."
    CURRENT_TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

    jq --arg ai "$AI_NAME" \
       --arg ts "$CURRENT_TIMESTAMP" \
       --argjson mtime "$CURRENT_MTIME" \
       --argjson count "$UNREAD_COUNT" \
       ".ai_agents[\$ai].last_check_timestamp = \$ts |
        .ai_agents[\$ai].last_notification_mtime = \$mtime |
        .ai_agents[\$ai].unread_count = \$count |
        .file_mtimes.\"notifications.json\" = \$mtime" \
       "$CACHE_FILE" > "$CACHE_FILE.tmp" && mv "$CACHE_FILE.tmp" "$CACHE_FILE"

    success "Cache updated"

    # Return status code: 1 indicates new notifications
    exit 1
else
    success "No new notifications (file not modified)"
    echo ""
    info "Last check: $(jq -r ".ai_agents.$AI_NAME.last_check_timestamp" "$CACHE_FILE")"

    # Return status code: 0 indicates no new notifications
    exit 0
fi