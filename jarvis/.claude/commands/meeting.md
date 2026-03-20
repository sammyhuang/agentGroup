# /meeting - Record Meeting

Record meeting arrangements to `../shared/tasks/meetings.md`

## Usage
/meeting [meeting information]

## Execution Steps

1. Parse meeting information, extract:
   - Time
   - Type/Topic
   - Participants (if any)
   - Location/Link (if any)

2. Append to `../shared/tasks/meetings.md` with format:
```markdown
## YYYY-MM-DD HH:mm - [Meeting Topic]
- **Type**: xxx
- **Participants**: xxx
- **Location**: xxx
- **Notes**: xxx
- **Status**: Pending
```

3. Confirm record and ask if reminder needed
