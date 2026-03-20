# Intelligent Notification Caching Mechanism Based on File Timestamps

**Version**: v1.0.0
**Creation Date**: 2026-02-13
**Author**: Max
**Scope**: All AI members of aiGroup team

---

## I. Core Design Philosophy

### Problem Background
Traditional notification systems require complete reading of notification files every session, leading to:
- Repeated reading of already processed notifications (Token waste)
- Inability to distinguish between "new notifications" and "read notifications"
- Lack of persistent tracking of notification status

### Solution
Intelligent caching mechanism based on file modification timestamps (mtime):
- Only re-read when file has changes
- Persist each AI's check status
- Zero additional storage cost (utilizing filesystem native mtime)

---

## II. File Structure Description

### 2.1 `.notification_cache.json` (Cache File)

**Location**: `/Users/yuhao/Desktop/yezannnnn/aiGroup/shared/.notification_cache.json`

**Core Field Description**:

```json
{
  "ai_agents": {
    "max": {
      "last_check_timestamp": "Session startup time (ISO 8601)",
      "last_notification_mtime": "mtime of notifications.json during last check (Unix timestamp)",
      "unread_count": "Number of unread notifications",
      "last_read_notification_id": "Last read notification ID"
    }
  },
  "file_mtimes": {
    "notifications.json": "Last recorded mtime",
    "status.json": "Last recorded mtime",
    "tasks/todos.md": "Last recorded mtime"
  }
}
```

**Field Purposes**:
- `last_check_timestamp`: Session-level timestamp, used to determine if full check is needed
- `last_notification_mtime`: File-level mtime, used to determine if file is modified
- `unread_count`: Quick determination if new notifications exist, without reading complete file
- `last_read_notification_id`: For incremental reading, process only new notifications

### 2.2 `notifications.json` (Notification File)

**Location**: `/Users/yuhao/Desktop/yezannnnn/aiGroup/shared/notifications.json`

**Notification Structure**:

```json
{
  "notifications": [
    {
      "id": "Unique identifier (notif_YYYYMMDD_number)",
      "timestamp": "Creation time (ISO 8601)",
      "priority": "Priority (high/normal/low)",
      "type": "Notification type (task_assignment/review_request/information/alert)",
      "from": "Sender (AI name or system)",
      "to": "Recipient (AI name or all)",
      "subject": "Notification title",
      "content": {
        "Custom content structure, varies by type"
      },
      "actions": [
        {
          "label": "Action button text",
          "action": "Action type",
          "target": "Action target"
        }
      ],
      "read_by": ["List of AIs that have read"],
      "acknowledged_by": ["List of AIs that have acknowledged"],
      "expires_at": "Expiration time (ISO 8601)"
    }
  ]
}
```

**Notification Type Definitions**:

| type | Description | Typical Use Case | priority Suggestion |
|------|-------------|------------------|-------------------|
| `task_assignment` | Task assignment | Max assigns tasks to members | high/normal |
| `review_request` | Review request | Jarvis requests Kyle to test | normal |
| `information` | Information notification | Meeting reminders, status updates | low |
| `alert` | Alert reminder | Token limit exceeded, system errors | high |

---

## III. Timestamp Check Implementation (Core)

### 3.1 Bash Commands to Get File mtime

#### macOS/BSD Systems
```bash
stat -f %m /path/to/file
```

**Output**: Unix timestamp (second precision, e.g.: 1707825600)

#### Linux Systems
```bash
stat -c %Y /path/to/file
```

**Output**: Unix timestamp (second precision)

#### Cross-platform Compatible Solution (Recommended)
```bash
# Detect system type and use corresponding command
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  FILE_MTIME=$(stat -f %m "/path/to/file")
else
  # Linux
  FILE_MTIME=$(stat -c %Y "/path/to/file")
fi

echo "$FILE_MTIME"
```

### 3.2 Complete Check Flow Bash Script

#### Scenario 1: Notification Check at AI Session Startup

```bash
#!/bin/bash

# Configuration
AI_NAME="max"  # Current AI name (max/ella/jarvis/kyle)
SHARED_DIR="/Users/yuhao/Desktop/yezannnnn/aiGroup/shared"
CACHE_FILE="$SHARED_DIR/.notification_cache.json"
NOTIFICATION_FILE="$SHARED_DIR/notifications.json"

# 1. Get current notifications.json mtime
if [[ "$OSTYPE" == "darwin"* ]]; then
  CURRENT_MTIME=$(stat -f %m "$NOTIFICATION_FILE")
else
  CURRENT_MTIME=$(stat -c %Y "$NOTIFICATION_FILE")
fi

# 2. Read last_notification_mtime from cache (requires jq tool)
CACHED_MTIME=$(jq -r ".ai_agents.$AI_NAME.last_notification_mtime" "$CACHE_FILE")

# 3. Compare timestamps
if [ "$CURRENT_MTIME" -gt "$CACHED_MTIME" ]; then
  echo "New notifications detected! File has been modified"
  echo "Cached mtime: $CACHED_MTIME"
  echo "Current mtime: $CURRENT_MTIME"

  # Mark: need to read notifications.json
  NEED_READ=true
else
  echo "No new notifications, skip reading"
  NEED_READ=false
fi

# 4. If reading needed, update cache
if [ "$NEED_READ" = true ]; then
  # Read notification content (using Read tool)
  # [Execute in actual AI code]

  # Update cache (using jq to update JSON)
  CURRENT_TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
  jq ".ai_agents.$AI_NAME.last_check_timestamp = \"$CURRENT_TIMESTAMP\" | \
      .ai_agents.$AI_NAME.last_notification_mtime = $CURRENT_MTIME | \
      .file_mtimes.\"notifications.json\" = $CURRENT_MTIME" \
      "$CACHE_FILE" > "$CACHE_FILE.tmp" && mv "$CACHE_FILE.tmp" "$CACHE_FILE"

  echo "Cache updated"
fi
```

#### Scenario 2: Batch Check Multiple Files

```bash
#!/bin/bash

AI_NAME="max"
SHARED_DIR="/Users/yuhao/Desktop/yezannnnn/aiGroup/shared"
CACHE_FILE="$SHARED_DIR/.notification_cache.json"

# Define list of files to monitor
declare -A FILES=(
  ["notifications.json"]="$SHARED_DIR/notifications.json"
  ["status.json"]="$SHARED_DIR/status.json"
  ["tasks/todos.md"]="$SHARED_DIR/tasks/todos.md"
  ["tasks/meetings.md"]="$SHARED_DIR/tasks/meetings.md"
)

# Detect system type
if [[ "$OSTYPE" == "darwin"* ]]; then
  STAT_CMD="stat -f %m"
else
  STAT_CMD="stat -c %Y"
fi

# Iterate and check
for FILE_KEY in "${!FILES[@]}"; do
  FILE_PATH="${FILES[$FILE_KEY]}"

  # File existence check
  if [ ! -f "$FILE_PATH" ]; then
    echo "Warning: $FILE_KEY does not exist, skipping"
    continue
  fi

  # Get current mtime
  CURRENT_MTIME=$($STAT_CMD "$FILE_PATH")

  # Read cached mtime
  CACHED_MTIME=$(jq -r ".file_mtimes.\"$FILE_KEY\"" "$CACHE_FILE")

  # Compare
  if [ "$CURRENT_MTIME" -gt "$CACHED_MTIME" ]; then
    echo "✓ $FILE_KEY has updates (mtime: $CACHED_MTIME → $CURRENT_MTIME)"
    # Trigger read logic here
  else
    echo "✗ $FILE_KEY no changes"
  fi
done
```

#### Scenario 3: Check if Full Refresh Needed (24-hour Check)

```bash
#!/bin/bash

AI_NAME="max"
CACHE_FILE="/Users/yuhao/Desktop/yezannnnn/aiGroup/shared/.notification_cache.json"

# Read last check time
LAST_CHECK=$(jq -r ".ai_agents.$AI_NAME.last_check_timestamp" "$CACHE_FILE")

# Convert to Unix timestamp
if [[ "$OSTYPE" == "darwin"* ]]; then
  LAST_CHECK_EPOCH=$(date -j -f "%Y-%m-%dT%H:%M:%SZ" "$LAST_CHECK" +%s 2>/dev/null || echo 0)
else
  LAST_CHECK_EPOCH=$(date -d "$LAST_CHECK" +%s 2>/dev/null || echo 0)
fi

CURRENT_EPOCH=$(date +%s)
DIFF_HOURS=$(( (CURRENT_EPOCH - LAST_CHECK_EPOCH) / 3600 ))

# Determine if exceeds 24 hours
FULL_CHECK_INTERVAL=24
if [ "$DIFF_HOURS" -ge "$FULL_CHECK_INTERVAL" ]; then
  echo "$DIFF_HOURS hours since last full check, executing full refresh"
  NEED_FULL_CHECK=true
else
  echo "Last check was $DIFF_HOURS hours ago, using quick check"
  NEED_FULL_CHECK=false
fi
```

---

## IV. AI Integration Implementation Flow

### 4.1 Session Initialization Check (Mandatory Execution)

Each AI must execute the following steps at session startup:

```
Step 1: Execute Timestamp Check
├─ Use Bash tool to run check script
├─ Get NEED_READ flag
└─ Determine if file reading is needed

Step 2: Conditional Reading
├─ If NEED_READ=true
│   ├─ Use Read tool to read notifications.json
│   ├─ Filter notifications with to="current AI" or to="all"
│   ├─ Filter out notifications with read_by containing current AI
│   └─ Output unread notification summary
└─ If NEED_READ=false
    └─ Output "No new notifications"

Step 3: Update Cache
├─ Use jq to update .notification_cache.json
├─ Update last_check_timestamp to current time
├─ Update last_notification_mtime to file's current mtime
└─ Update unread_count
```

### 4.2 Simplified Implementation (Recommended for Actual Integration)

Add to initialization steps in CLAUDE.md:

```markdown
## Initialization Steps (Must Execute)

1. **Read Persona File** `./PERSONA.md`
2. **Read Shared Status** `../shared/status.json`
3. **[NEW] Check Notification Updates**:
   ```bash
   # Quick check for new notifications
   AI_NAME="max"  # Replace with actual AI name
   NOTIFICATION_FILE="../shared/notifications.json"
   CACHE_FILE="../shared/.notification_cache.json"

   # Get mtime
   CURRENT_MTIME=$(stat -f %m "$NOTIFICATION_FILE" 2>/dev/null || stat -c %Y "$NOTIFICATION_FILE")
   CACHED_MTIME=$(jq -r ".ai_agents.$AI_NAME.last_notification_mtime" "$CACHE_FILE")

   # Read if there are updates
   if [ "$CURRENT_MTIME" -gt "$CACHED_MTIME" ]; then
     # Read notifications.json and filter
     # Update cache
   fi
   ```
4. **Check Meeting Records** `../shared/tasks/meetings.md` (if exists)
5. **Check Todo Items** `../shared/tasks/todos.md` (if exists)
```

---

## V. Advanced Feature Design

### 5.1 Incremental Reading Optimization

**Scenario**: When notifications array is very large (100+ entries), avoid reading all every time.

**Implementation Solution**:
1. Record `last_read_notification_id` in cache
2. Use jq filtering when reading:
   ```bash
   jq '[.notifications[] | select(.id > "notif_last_id")] |
       [.[] | select(.to == "max" or .to == "all") |
       select(.read_by | contains(["max"]) | not)]' \
       notifications.json
   ```
3. Only process new notifications with IDs greater than last ID

### 5.2 Automatic Notification Expiration Cleanup

**Bash Scheduled Task** (optional, executed by Max):

```bash
#!/bin/bash

NOTIFICATION_FILE="/Users/yuhao/Desktop/yezannnnn/aiGroup/shared/notifications.json"
CURRENT_TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Use jq to filter out expired notifications
jq --arg now "$CURRENT_TIMESTAMP" \
   '.notifications = [.notifications[] | select(.expires_at > $now)]' \
   "$NOTIFICATION_FILE" > "$NOTIFICATION_FILE.tmp" && \
   mv "$NOTIFICATION_FILE.tmp" "$NOTIFICATION_FILE"

echo "Expired notifications cleaned"
```

### 5.3 Notification Statistics Dashboard

**Quick Generation of Statistical Reports**:

```bash
#!/bin/bash

CACHE_FILE="/Users/yuhao/Desktop/yezannnnn/aiGroup/shared/.notification_cache.json"

echo "=== Notification System Status ==="
echo ""

# Unread count for each AI
echo "Unread notification statistics:"
for AI in max ella jarvis kyle; do
  UNREAD=$(jq -r ".ai_agents.$AI.unread_count" "$CACHE_FILE")
  echo "  $AI: $UNREAD items"
done

echo ""

# File update times
echo "Last file modifications:"
jq -r '.file_mtimes | to_entries[] | "  \(.key): \(.value)"' "$CACHE_FILE" | \
  while read line; do
    FILE=$(echo "$line" | cut -d: -f1)
    MTIME=$(echo "$line" | cut -d: -f2 | xargs)
    DATE=$(date -r "$MTIME" "+%Y-%m-%d %H:%M:%S" 2>/dev/null || echo "Unknown")
    echo "$FILE: $DATE"
  done
```

---

## VI. Token Optimization Effect Analysis

### Traditional Method (Every Session)
```
Step 1: Read notifications.json (1500 tokens)
Step 2: Read all notification content (3000 tokens)
Step 3: Filter and process (500 tokens)
Total: 5000 tokens/session
```

### Cache Optimized Method
```
Step 1: Execute mtime check script (200 tokens)
Step 2: If no update, skip reading (0 tokens)
Step 3: If updated, read notifications.json (1500 tokens)
Step 4: Read only new notifications (incremental) (800 tokens)
Total (no update): 200 tokens/session (96% savings)
Total (with update): 2500 tokens/session (50% savings)
```

### Actual Usage Scenario Estimation
Assuming 4 AIs each start 3 sessions daily (total 12 sessions):
- 10 times no new notifications (using 200 tokens)
- 2 times with new notifications (using 2500 tokens)

**Daily Token Consumption**:
- Traditional method: 12 × 5000 = 60,000 tokens
- Optimized method: 10 × 200 + 2 × 2500 = 7,000 tokens
- **Savings rate: 88%**

**Monthly Token Savings** (calculated for 30 days):
- Savings: (60,000 - 7,000) × 30 = 1,590,000 tokens
- **Approximately $23.85 in savings (at Sonnet pricing)**

---

## VII. Fault Handling and Edge Cases

### 7.1 Cache File Corruption

**Problem**: `.notification_cache.json` format error or missing.

**Handling**:
```bash
# Check file validity
if ! jq empty "$CACHE_FILE" 2>/dev/null; then
  echo "Cache file corrupted, reinitializing"
  # Restore from template or rebuild
  cp "$CACHE_FILE.template" "$CACHE_FILE"
fi
```

### 7.2 File mtime Anomaly

**Problem**: File modified by external tools, mtime abnormally large.

**Handling**:
- Set maximum time difference threshold (e.g., not exceeding current time)
- Force reset cache and full read when anomalies occur

```bash
CURRENT_EPOCH=$(date +%s)
if [ "$FILE_MTIME" -gt "$CURRENT_EPOCH" ]; then
  echo "Warning: mtime anomaly (future time), forcing reset"
  FILE_MTIME=0
fi
```

### 7.3 Multiple AI Concurrent Writes

**Problem**: Multiple AIs simultaneously updating cache file causing conflicts.

**Solutions**:
1. Use file locking mechanism (flock)
2. Or each AI only writes its own fields (using jq update operations)

```bash
# Using file lock
(
  flock -x 200
  # Execute jq update
  jq "..." "$CACHE_FILE" > "$CACHE_FILE.tmp" && mv "$CACHE_FILE.tmp" "$CACHE_FILE"
) 200>"$CACHE_FILE.lock"
```

---

## VIII. Quick Start Guide

### For AI Developers

**Minimal Implementation (3 Steps)**:

```bash
# Step 1: Add check to AI startup script
AI_NAME="your_ai_name"
SHARED_DIR="/Users/yuhao/Desktop/yezannnnn/aiGroup/shared"
NOTIFICATION_FILE="$SHARED_DIR/notifications.json"
CACHE_FILE="$SHARED_DIR/.notification_cache.json"

# Step 2: Get mtime and compare
CURRENT_MTIME=$(stat -f %m "$NOTIFICATION_FILE" 2>/dev/null || stat -c %Y "$NOTIFICATION_FILE")
CACHED_MTIME=$(jq -r ".ai_agents.$AI_NAME.last_notification_mtime" "$CACHE_FILE")

# Step 3: Conditional reading
if [ "$CURRENT_MTIME" -gt "$CACHED_MTIME" ]; then
  # Use Read tool to read notifications.json
  # Process notifications
  # Update cache
  jq ".ai_agents.$AI_NAME.last_notification_mtime = $CURRENT_MTIME" \
     "$CACHE_FILE" > "$CACHE_FILE.tmp" && mv "$CACHE_FILE.tmp" "$CACHE_FILE"
fi
```

### For Project Manager (Max)

**Standard Notification Sending Process**:

1. Edit `notifications.json`, add new notification
2. Ensure notification ID is unique and incremental (notif_YYYYMMDD_number)
3. Set reasonable `expires_at` (usually 30 days)
4. After file save, mtime automatically updates, triggering AI checks

**Example**:
```bash
# Add new notification
jq '.notifications += [{
  "id": "notif_20260213_004",
  "timestamp": "2026-02-13T16:00:00Z",
  "priority": "high",
  "type": "task_assignment",
  "from": "max",
  "to": "jarvis",
  "subject": "Urgent Task",
  "content": {...},
  "read_by": [],
  "acknowledged_by": [],
  "expires_at": "2026-03-15T16:00:00Z"
}]' notifications.json > notifications.json.tmp && mv notifications.json.tmp notifications.json
```

---

## IX. Extension Possibilities

### 9.1 Desktop Notification Integration

**macOS Notifications**:
```bash
osascript -e 'display notification "You have a new task assignment" with title "AI Team Notification"'
```

### 9.2 Email/Webhook Integration

When high priority notifications are detected:
```bash
if [ "$PRIORITY" = "high" ]; then
  # Send email
  echo "Important notification: $SUBJECT" | mail -s "AI Team Urgent Notification" user@example.com

  # Or call webhook
  curl -X POST https://hooks.example.com/notify \
       -H "Content-Type: application/json" \
       -d "{\"message\": \"$SUBJECT\"}"
fi
```

### 9.3 Statistics Dashboard

Use `jq` to generate team notification efficiency reports:
```bash
# Calculate average response time
jq '[.notifications[] |
    select(.read_by | length > 0) |
    {
      id: .id,
      sent: .timestamp,
      read: .read_by[0].timestamp,
      response_time: (.read_by[0].timestamp - .timestamp)
    }] |
    map(.response_time) |
    add / length' notifications.json
```

---

## X. Summary

### Core Advantages
✅ **Zero Storage Cost** - Utilizing filesystem native mtime
✅ **Efficient Checking** - 200 tokens vs 5000 tokens (96% savings)
✅ **Scalability** - Supports batch file monitoring
✅ **Persistence** - Maintains state between sessions
✅ **Simple Implementation** - 3 lines of Bash for integration

### Applicable Scenarios
- Team collaboration notification systems
- File change monitoring
- Task status synchronization
- Log update tracking

### Maintenance Recommendations
- Clean expired notifications monthly
- Regularly backup cache files
- Monitor mtime anomaly situations
- Collect usage statistics to optimize strategies

---

**Version History**:
- v1.0.0 (2026-02-13): Initial version, complete implementation design

**Related Documentation**:
- `/shared/notifications.json` - Notification data file
- `/shared/.notification_cache.json` - Cache status file
- Each AI's `CLAUDE.md` - Integration configuration

**Contact**: Max - Project Manager
