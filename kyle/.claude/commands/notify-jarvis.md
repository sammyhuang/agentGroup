# /notify-jarvis - Notify Jarvis

Send notification to Jarvis (requires user confirmation)

## Usage
/notify-jarvis [message content]

## Execution Steps

1. First ask user for confirmation: "Are you sure you want to notify Jarvis?"

2. After user confirmation, update `../shared/status.json`:
```json
{
  "notifications": [
    {
      "from": "kyle",
      "to": "jarvis",
      "type": "review_result|bug_report|message",
      "task": "task name",
      "files": ["review report path"],
      "message": "message content",
      "timestamp": "ISO timestamp",
      "read": false
    }
  ],
  "current_task": "current task",
  "last_updated": "ISO timestamp"
}
```

3. Inform user: "Jarvis has been notified, please ask him to check /status"
