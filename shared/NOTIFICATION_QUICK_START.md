# Notification Caching Mechanism - Quick Start Guide

**Version**: v1.0.0
**Target Users**: AI Team Members (Max, Ella, Jarvis, Kyle)

---

## One-Minute Quick Start

### AI Member Usage (Add to CLAUDE.md initialization steps)

```bash
# Execute during session startup
/Users/yuhao/Desktop/yezannnnn/aiGroup/shared/scripts/check_notifications_simple.sh max
```

**Output Interpretation**:
- **Exit code = 1** → New notifications available, need to read `notifications.json`
- **Exit code = 0** → No new notifications, skip reading

---

## Complete Integration Example (Recommended)

Add to each AI's `CLAUDE.md` initialization steps:

```markdown
## Initialization Steps (Must Execute)

1. **Read Persona File** `./PERSONA.md`
2. **Read Shared Status** `../shared/status.json`
3. **[NEW] Check Notification Updates**:
   ```bash
   # Check for new notifications
   ../shared/scripts/check_notifications_simple.sh max  # Replace with corresponding AI name

   # Judge based on exit code
   if [ $? -eq 1 ]; then
     # New notifications available, use Read tool to read
     # File path: ../shared/notifications.json
   fi
   ```
4. **Check Todo Items** `../shared/tasks/todos.md`
```

---

## File Description

### Core Files

| File Path | Purpose | Maintained By |
|---------|---------|---------------|
| `notifications.json` | Store all notifications | Max sends, all AIs read |
| `.notification_cache.json` | Advanced cache (requires jq) | System automatic |
| `.cache/{ai_name}_last_check.txt` | Simplified cache (pure Bash) | System automatic |
| `scripts/check_notifications_simple.sh` | Check script (recommended) | System maintenance |

### Notification Structure Example

```json
{
  "id": "notif_20260213_001",
  "timestamp": "2026-02-13T10:30:00Z",
  "priority": "high",
  "type": "task_assignment",
  "from": "max",
  "to": "jarvis",
  "subject": "Urgent Bug Fix",
  "content": {
    "task_id": "bug_001",
    "file": "frontend/src/App.vue",
    "issue": "Issue description"
  },
  "read_by": [],
  "acknowledged_by": [],
  "expires_at": "2026-03-15T10:30:00Z"
}
```

---

## Usage Scenarios

### Scenario 1: AI Session Startup Check (Most Common)

```bash
# Execute in CLAUDE.md initialization steps
cd /Users/yuhao/Desktop/yezannnnn/aiGroup/shared/scripts
./check_notifications_simple.sh max

# Check return value
if [ $? -eq 1 ]; then
  echo "New notifications available, need to read"
  # Then use Read tool to read ../shared/notifications.json
fi
```

### Scenario 2: Max Sending Notifications

**Method A: Direct JSON File Editing** (Recommended)
```bash
# Use Edit tool to edit notifications.json
# Add new notification object to notifications array

# After file save, mtime automatically updates, triggering other AIs' checks
```

**Method B: Using jq Command** (Advanced)
```bash
jq '.notifications += [{
  "id": "notif_20260213_004",
  "timestamp": "'$(date -u +"%Y-%m-%dT%H:%M:%SZ")'",
  "priority": "normal",
  "type": "information",
  "from": "max",
  "to": "all",
  "subject": "Team Meeting Reminder",
  "content": {"message": "Meeting tomorrow at 15:00"},
  "read_by": [],
  "acknowledged_by": [],
  "expires_at": "'$(date -u -v+30d +"%Y-%m-%dT%H:%M:%SZ")'"
}]' notifications.json > notifications.json.tmp && \
mv notifications.json.tmp notifications.json
```

### Scenario 3: Mark Notification as Read

```bash
# After reading notification, update read_by field
jq '(.notifications[] | select(.id == "notif_20260213_001").read_by) += ["jarvis"]' \
   notifications.json > notifications.json.tmp && \
   mv notifications.json.tmp notifications.json
```

---

## Token Optimization Effects

### Comparison Data

**Traditional Method** (Read every session):
```
Step 1: Read notifications.json → 1500 tokens
Step 2: Process all notifications → 3000 tokens
Total: 4500 tokens/session
```

**Cache Optimized Method**:
```
Step 1: Execute check script → 150 tokens
Step 2: If no update, skip → 0 tokens
Total (no update): 150 tokens/session (97% savings)
Total (with update): 1650 tokens/session (63% savings)
```

### Actual Benefits (Monthly Estimate)

Assuming each AI starts 3 sessions per day:
- 4 AIs × 3 times/day × 30 days = 360 sessions
- 90% have no new notifications (324 times), 10% have new notifications (36 times)

**Traditional Method Monthly Consumption**:
```
360 times × 4500 tokens = 1,620,000 tokens
Approximately $24.30 (at Sonnet pricing)
```

**Optimized Monthly Consumption**:
```
324 times × 150 tokens + 36 times × 1650 tokens = 108,000 tokens
Approximately $1.62 (at Sonnet pricing)
```

**Monthly Savings**: $22.68 (93% savings rate)

---

## Frequently Asked Questions

### Q1: Is script returning exit code 1 an error?

**A**: Not an error! This is designed behavior:
- Exit code 1 = New notifications detected (need to read)
- Exit code 0 = No new notifications (skip reading)
- Exit code 2 = Actual error (file doesn't exist, etc.)

### Q2: How to test the cache mechanism?

**A**:
```bash
# First run (will detect updates)
./check_notifications_simple.sh max

# Second run (should show no updates)
./check_notifications_simple.sh max

# Modify notifications.json then run again (will detect updates again)
touch ../notifications.json
./check_notifications_simple.sh max
```

### Q3: Where are the cache files?

**A**:
- Simplified cache: `shared/.cache/{ai_name}_last_check.txt`
- Advanced cache: `shared/.notification_cache.json` (requires jq)

These files are automatically managed by the system, no manual editing required.

### Q4: How to clear cache and force re-reading?

**A**:
```bash
# Delete specific AI's cache
rm /Users/yuhao/Desktop/yezannnnn/aiGroup/shared/.cache/max_last_check.txt

# Or delete all AIs' cache
rm -rf /Users/yuhao/Desktop/yezannnnn/aiGroup/shared/.cache/*
```

### Q5: Will multiple AIs checking simultaneously cause conflicts?

**A**: No. Each AI has independent cache files:
- max → `.cache/max_last_check.txt`
- ella → `.cache/ella_last_check.txt`
- jarvis → `.cache/jarvis_last_check.txt`
- kyle → `.cache/kyle_last_check.txt`

---

## Advanced Features

### Batch Check Multiple Files

Edit `check_strategy` configuration:

```json
{
  "check_strategy": {
    "quick_check_files": [
      "notifications.json",
      "status.json"
    ],
    "periodic_check_files": [
      "tasks/todos.md",
      "tasks/meetings.md"
    ]
  }
}
```

### Notification Priority Filtering

Read only high priority notifications (requires jq):

```bash
jq '[.notifications[] |
     select(.priority == "high" and
            .to == "max" and
            (.read_by | contains(["max"]) | not))]' \
     notifications.json
```

### Count Unread Notifications

```bash
jq --arg ai "max" \
   '[.notifications[] |
     select((.to == $ai or .to == "all") and
            (.read_by | contains([$ai]) | not))] |
     length' \
     notifications.json
```

---

## Maintenance Recommendations

### Regular Cleanup (Max's Responsibility)

**Execute monthly**:
```bash
# Delete expired notifications
CURRENT_ISO=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
jq --arg now "$CURRENT_ISO" \
   '.notifications = [.notifications[] | select(.expires_at > $now)]' \
   notifications.json > notifications.json.tmp && \
   mv notifications.json.tmp notifications.json
```

### Backup Notification History

```bash
# Monthly backup
cp notifications.json "notifications_backup_$(date +%Y%m).json"
```

---

## Troubleshooting

### Issue 1: Script lacks execute permission

```bash
chmod +x /Users/yuhao/Desktop/yezannnnn/aiGroup/shared/scripts/check_notifications_simple.sh
```

### Issue 2: Cache invalid, always shows new notifications

```bash
# Check cache file content
cat /Users/yuhao/Desktop/yezannnnn/aiGroup/shared/.cache/max_last_check.txt

# Manually set to current mtime
stat -f %m notifications.json > .cache/max_last_check.txt  # macOS
stat -c %Y notifications.json > .cache/max_last_check.txt  # Linux
```

### Issue 3: File permission error

```bash
# Ensure shared directory and scripts are accessible
chmod -R 755 /Users/yuhao/Desktop/yezannnnn/aiGroup/shared/scripts
```

---

## Next Steps

1. **Immediate Action**: Add check script call to your CLAUDE.md initialization steps
2. **Test Verification**: Run the script once to confirm it detects properly
3. **View Detailed Documentation**: Read `NOTIFICATION_CACHE_IMPLEMENTATION.md` for complete design understanding

---

**Related Documentation**:
- `NOTIFICATION_CACHE_IMPLEMENTATION.md` - Complete implementation documentation
- `notifications.json` - Notification data file
- `scripts/check_notifications_simple.sh` - Check script

**Maintainer**: Max
**Last Updated**: 2026-02-13
