# Notification Caching Mechanism - Practical Demonstration

**Scenario**: Showcase complete notification sending, checking, and reading workflow
**Demo Date**: 2026-02-13

---

## Scenario 1: Max Assigns Task to Jarvis

### Step 1: Max Sends Notification

**Operation**: Edit `notifications.json`, add new notification

```json
{
  "id": "notif_20260213_005",
  "timestamp": "2026-02-13T21:00:00Z",
  "priority": "high",
  "type": "task_assignment",
  "from": "max",
  "to": "jarvis",
  "subject": "Optimize Database Query Performance",
  "content": {
    "task_id": "perf_20260213_001",
    "file": "backend/api/users.js",
    "issue": "getUserList API response time exceeds 3 seconds",
    "current_behavior": "Each query performs full table scan, causing slow response",
    "expected_behavior": "Response time should be within 500ms",
    "hint": "Recommend adding indexes on user_id and created_at fields"
  },
  "actions": [
    {
      "label": "View Code",
      "action": "read_file",
      "target": "backend/api/users.js"
    },
    {
      "label": "Confirm Receipt",
      "action": "update_status",
      "target": "../shared/status.json"
    }
  ],
  "read_by": [],
  "acknowledged_by": [],
  "expires_at": "2026-03-15T21:00:00Z"
}
```

**Result**:
- `notifications.json` mtime automatically updates
- Next time Jarvis starts a session, changes will be detected

---

### Step 2: Jarvis Starts Session and Checks

**Execute Script**:
```bash
/Users/yuhao/Desktop/yezannnnn/aiGroup/shared/scripts/check_notifications_simple.sh jarvis
```

**Output**:
```
[INFO] AI Notification Check - jarvis
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[INFO] Notification file last modified: 2026-02-13 21:00:15
[INFO] Last check time: 2026-02-13 12:00:00

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  📬 Notification file update detected!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[✓] Recommend reading notification file: /Users/yuhao/Desktop/yezannnnn/aiGroup/shared/notifications.json

[INFO] Cache updated
```

**Script Returns**: Exit code 1 (new notifications available)

---

### Step 3: Jarvis Reads and Processes Notification

**Using Read Tool**:
```
Read /Users/yuhao/Desktop/yezannnnn/aiGroup/shared/notifications.json
```

**Filtering Logic** (processed internally by AI):
```javascript
// Pseudo code
notifications.filter(n =>
  (n.to === "jarvis" || n.to === "all") &&  // Target is self or all
  !n.read_by.includes("jarvis") &&          // Unread
  new Date(n.expires_at) > new Date()       // Not expired
)
```

**Found Notification**:
```
【HIGH】Optimize Database Query Performance
  Sender: max
  Time: 2026-02-13T21:00:00Z
  Type: task_assignment
  ID: notif_20260213_005

Content:
  Task ID: perf_20260213_001
  File: backend/api/users.js
  Issue: getUserList API response time exceeds 3 seconds
  Expected: Response time should be within 500ms
  Hint: Recommend adding indexes on user_id and created_at fields
```

---

### Step 4: Jarvis Marks as Read (Optional)

**Using Edit Tool to Update `notifications.json`**:

Find notification with ID `notif_20260213_005`, modify:
```json
"read_by": ["jarvis"]
```

**Or use jq command** (if needed):
```bash
jq '(.notifications[] |
     select(.id == "notif_20260213_005").read_by) += ["jarvis"]' \
   notifications.json > notifications.json.tmp && \
   mv notifications.json.tmp notifications.json
```

---

### Step 5: Jarvis Confirms After Task Completion

**Update notification's `acknowledged_by` field**:
```json
"acknowledged_by": ["jarvis"]
```

**Simultaneously update `status.json`**:
```json
{
  "current_task": "Optimize Database Query Performance - In Progress",
  "last_updated": "2026-02-13T21:30:00Z"
}
```

---

## Scenario 2: Max Sends Team-wide Notification

### Step 1: Max Sends Meeting Notification

```json
{
  "id": "notif_20260213_006",
  "timestamp": "2026-02-13T22:00:00Z",
  "priority": "normal",
  "type": "information",
  "from": "max",
  "to": "all",
  "subject": "Weekly Project Progress Meeting",
  "content": {
    "meeting_time": "2026-02-14T15:00:00Z",
    "agenda": [
      "Design Progress Review - Ella",
      "Development Progress Review - Jarvis",
      "Testing Status Report - Kyle",
      "Next Week Planning - Max"
    ],
    "location": "Online Meeting Room",
    "preparation": "Please prepare a 5-minute work summary in advance"
  },
  "read_by": [],
  "acknowledged_by": [],
  "expires_at": "2026-02-14T15:00:00Z"
}
```

---

### Step 2: Each AI Checks

**Ella Checks**:
```bash
./check_notifications_simple.sh ella
# Output: Notification file update detected
# Exit code: 1
```

**Jarvis Checks**:
```bash
./check_notifications_simple.sh jarvis
# Output: Notification file update detected (relative to Jarvis's last check time)
# Exit code: 1
```

**Kyle Checks**:
```bash
./check_notifications_simple.sh kyle
# Output: Notification file update detected
# Exit code: 1
```

**All AIs will receive this notification** (because `to: "all"`)

---

### Step 3: Each AI Confirms Attendance

After each AI reads the notification, update `acknowledged_by`:

```json
"acknowledged_by": ["ella", "jarvis", "kyle"]
```

Max can view which members have confirmed meeting attendance.

---

## Scenario 3: Cache Mechanism Effect Verification

### Step 1: Multiple Consecutive Checks (No New Notifications)

**First Check** (Jarvis):
```bash
./check_notifications_simple.sh jarvis
# Output: Notification file update detected
# Exit code: 1
# Token consumption: ~150 tokens
```

**Second Check** (Jarvis, 5 minutes later):
```bash
./check_notifications_simple.sh jarvis
# Output: No new notifications (file not modified)
# Exit code: 0
# Token consumption: ~150 tokens (but no file reading needed, only script execution)
```

**Third Check** (Jarvis, 10 minutes later):
```bash
./check_notifications_simple.sh jarvis
# Output: No new notifications (file not modified)
# Exit code: 0
# Token consumption: ~150 tokens (check only, no reading)
```

**Effect**:
- Traditional method: Read file every time → 3 times × 4500 tokens = 13,500 tokens
- Cache method: Only first read → 1 read (1500 tokens) + 2 checks (300 tokens) = 1,800 tokens
- **Savings rate: 87%**

---

### Step 2: Performance When New Notifications Exist

**Max Adds Urgent Notification**:
```bash
# Edit notifications.json, add new notification
# File mtime automatically updates
```

**Jarvis Fourth Check**:
```bash
./check_notifications_simple.sh jarvis
# Output: Notification file update detected
# Exit code: 1
# Triggers reading notifications.json
```

**Key Point**: Only read when file actually changes, avoiding meaningless repeated reading.

---

## Scenario 4: Multiple AIs Independent Checking (No Conflicts)

### At the Same Moment, 4 AIs Check Simultaneously

**Max**:
```bash
./check_notifications_simple.sh max
# Read cache: .cache/max_last_check.txt
# Write cache: .cache/max_last_check.txt
```

**Ella**:
```bash
./check_notifications_simple.sh ella
# Read cache: .cache/ella_last_check.txt
# Write cache: .cache/ella_last_check.txt
```

**Jarvis**:
```bash
./check_notifications_simple.sh jarvis
# Read cache: .cache/jarvis_last_check.txt
# Write cache: .cache/jarvis_last_check.txt
```

**Kyle**:
```bash
./check_notifications_simple.sh kyle
# Read cache: .cache/kyle_last_check.txt
# Write cache: .cache/kyle_last_check.txt
```

**Result**:
- Each AI has independent cache files
- No file lock conflicts
- Can execute in parallel

---

## Scenario 5: Notification Expiration and Cleanup

### Max Regularly Cleans Expired Notifications

**Execute Cleanup Script** (requires jq):
```bash
CURRENT_ISO=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

jq --arg now "$CURRENT_ISO" \
   '.notifications = [.notifications[] | select(.expires_at > $now)] |
    .notification_stats.total_sent = (.notifications | length)' \
   notifications.json > notifications.json.tmp && \
   mv notifications.json.tmp notifications.json

echo "Expired notifications cleaned"
```

**Effect**:
- Automatically delete notifications where `expires_at < current time`
- Keep file size small
- Improve reading speed

---

## Performance Comparison Summary

### Weekly Usage Statistics (Real-world Scenario)

**Assumptions**:
- 4 AIs, each starting 3 sessions daily
- Average 10 new notifications sent per week
- Total 84 session checks per week (4×3×7)

**Traditional Method**:
```
84 sessions × 4500 tokens/session = 378,000 tokens/week
Approximately $5.67/week (at Sonnet pricing)
```

**Cache Optimized Method**:
```
10 times with new notifications × 1650 tokens = 16,500 tokens
74 times without new notifications × 150 tokens = 11,100 tokens
Total: 27,600 tokens/week
Approximately $0.41/week (at Sonnet pricing)
```

**Weekly Savings**: $5.26 (93% savings rate)
**Monthly Savings**: $20+
**Annual Savings**: $240+

---

## Best Practice Recommendations

### For AI Members

1. **Execute check script on every session startup**
2. **Only read notification file when exit code=1**
3. **Recommend marking as read after reading** (avoid duplicate processing)
4. **Acknowledge important notifications for confirmation**

### For Max (Notification Manager)

1. **Ensure unique and incremental IDs when sending notifications**
2. **Set reasonable expiration times** (usually 30 days)
3. **Use priority: "high" for high-priority tasks**
4. **Execute expired notification cleanup monthly**

### For System Maintenance

1. **Regularly backup notifications.json**
2. **Monitor cache directory size** (should be small)
3. **Delete cache and force rebuild if anomalies occur**

---

## Failure Drill

### Issue 1: Cache Invalid, Always Shows New Notifications

**Diagnosis**:
```bash
# Check cache file
cat .cache/jarvis_last_check.txt
# Output: 1707825600

# Check notifications.json mtime
stat -f %m notifications.json  # macOS
# Output: 1707825600

# If both are equal but still shows updates, cache file may be corrupted
```

**Solution**:
```bash
# Delete cache, reinitialize
rm .cache/jarvis_last_check.txt

# Next check will automatically create new cache
./check_notifications_simple.sh jarvis
```

---

### Issue 2: Script Lacks Execute Permission

**Diagnosis**:
```bash
ls -l scripts/check_notifications_simple.sh
# Output: -rw-r--r-- (no x permission)
```

**Solution**:
```bash
chmod +x scripts/check_notifications_simple.sh
```

---

### Issue 3: File Path Error

**Phenomenon**: Script error "Notification file does not exist"

**Diagnosis**:
```bash
# Check if file exists
ls -l /Users/yuhao/Desktop/yezannnnn/aiGroup/shared/notifications.json

# Check path configuration in script
head -20 scripts/check_notifications_simple.sh | grep NOTIFICATION_FILE
```

**Solution**: Modify path configuration in script or move file to correct location

---

## Extended Demo: Batch File Monitoring

### Monitor Multiple File Changes

Create batch check script `check_all_files.sh`:

```bash
#!/bin/bash

AI_NAME="${1:-max}"
SHARED_DIR="/Users/yuhao/Desktop/yezannnnn/aiGroup/shared"

# Define monitored file list
FILES=(
  "notifications.json"
  "status.json"
  "tasks/todos.md"
  "tasks/meetings.md"
)

echo "Check all file updates - $AI_NAME"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

HAS_UPDATE=false

for file in "${FILES[@]}"; do
  FULL_PATH="$SHARED_DIR/$file"
  CACHE_FILE=".cache/${AI_NAME}_${file//\//_}_mtime.txt"

  if [ ! -f "$FULL_PATH" ]; then
    continue
  fi

  CURRENT_MTIME=$(stat -f %m "$FULL_PATH" 2>/dev/null || stat -c %Y "$FULL_PATH")
  CACHED_MTIME=$(cat "$CACHE_FILE" 2>/dev/null || echo "0")

  if [ "$CURRENT_MTIME" -gt "$CACHED_MTIME" ]; then
    echo "✓ $file has updates"
    echo "$CURRENT_MTIME" > "$CACHE_FILE"
    HAS_UPDATE=true
  else
    echo "✗ $file no changes"
  fi
done

if [ "$HAS_UPDATE" = true ]; then
  echo ""
  echo "File updates detected, recommend reading changed content"
  exit 1
else
  echo ""
  echo "All files unchanged"
  exit 0
fi
```

**Usage Effect**:
- Check multiple important files at once
- Further improve Token efficiency
- Suitable for comprehensive status check at project startup

---

**Demo Complete**

This demonstration showcases the complete usage workflow and significant optimization effects of the notification caching mechanism in real-world scenarios.

**Next Steps**:
1. Integrate check script into your CLAUDE.md
2. Conduct actual testing and verification
3. Observe Token consumption changes

**Documentation**:
- Quick Start: `NOTIFICATION_QUICK_START.md`
- Complete Implementation: `NOTIFICATION_CACHE_IMPLEMENTATION.md`
