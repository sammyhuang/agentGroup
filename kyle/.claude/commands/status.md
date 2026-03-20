# /status - View Shared Status

View shared status and notifications

## Usage
/status

## Execution Steps

1. Read `../shared/status.json`

2. Display current status:
   - Current tasks
   - Unread notifications (sent to me)
   - Last update time

3. If there are unread notifications, display details:
   - If it's a review request, ask whether to start review
   - If it's other messages, display content

4. Mark read notifications as `read: true`
