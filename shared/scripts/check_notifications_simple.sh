#!/bin/bash

################################################################################
# Notification Check Script - Simplified Version (No jq dependency)
# Purpose: Check for new notifications when AI session starts (only detect mtime changes)
# Usage: ./check_notifications_simple.sh <AI_NAME>
# Example: ./check_notifications_simple.sh max
################################################################################

# Configuration
AI_NAME="${1:-max}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SHARED_DIR="$(dirname "$SCRIPT_DIR")"
NOTIFICATION_FILE="$SHARED_DIR/notifications.json"
CACHE_DIR="$SHARED_DIR/.cache"
CACHE_FILE="$CACHE_DIR/${AI_NAME}_last_check.txt"

# Create cache directory
mkdir -p "$CACHE_DIR"

# Color output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

info() { echo -e "${BLUE}[INFO]${NC} $1"; }
success() { echo -e "${GREEN}[✓]${NC} $1"; }
warning() { echo -e "${YELLOW}[!]${NC} $1"; }
error() { echo -e "${RED}[✗]${NC} $1"; }

# Check notification file existence
if [ ! -f "$NOTIFICATION_FILE" ]; then
    error "Notification file does not exist: $NOTIFICATION_FILE"
    exit 2
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

# Convert mtime to readable time
mtime_to_date() {
    local mtime="$1"
    if [[ "$OSTYPE" == "darwin"* ]]; then
        date -r "$mtime" "+%Y-%m-%d %H:%M:%S" 2>/dev/null || echo "Unknown time"
    else
        date -d "@$mtime" "+%Y-%m-%d %H:%M:%S" 2>/dev/null || echo "Unknown time"
    fi
}

# Main logic
echo ""
info "AI Notification Check - $AI_NAME"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Get current mtime
CURRENT_MTIME=$(get_mtime "$NOTIFICATION_FILE")
CURRENT_DATE=$(mtime_to_date "$CURRENT_MTIME")

info "Notification file last modified: $CURRENT_DATE"

# Read cached mtime
if [ -f "$CACHE_FILE" ]; then
    CACHED_MTIME=$(cat "$CACHE_FILE" 2>/dev/null || echo "0")
    CACHED_DATE=$(mtime_to_date "$CACHED_MTIME")
    info "Last check time: $CACHED_DATE"
else
    CACHED_MTIME=0
    warning "First check, no historical record"
fi

echo ""

# Compare and decide
if [ "$CURRENT_MTIME" -gt "$CACHED_MTIME" ]; then
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo -e "  ${GREEN}📬 Notification file update detected!${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    success "Recommend reading notification file: $NOTIFICATION_FILE"
    echo ""

    # Update cache
    echo "$CURRENT_MTIME" > "$CACHE_FILE"
    info "Cache updated"

    # Return status code 1 for new notifications
    exit 1
else
    success "No new notifications (file not modified)"
    echo ""

    # Return status code 0 for no new notifications
    exit 0
fi
