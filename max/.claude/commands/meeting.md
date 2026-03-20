# /meeting - Meeting Management

Record and manage meetings

## Usage

```
/meeting new [time] [topic]    # Create new meeting
/meeting list                  # View meeting list
/meeting note [meeting ID]     # Record meeting minutes
```

## Create New Meeting

```markdown
# Meeting Arrangement

- **Time**: YYYY-MM-DD HH:MM
- **Topic**: [topic]
- **Participants**: [to be confirmed]
- **Meeting ID**: MTG-YYYYMMDD-01

Added to meeting list. Would you like me to remind you in advance?
```

## Meeting Minutes Template

```markdown
# Meeting Minutes - MTG-YYYYMMDD-XX

## Basic Information
- **Time**: YYYY-MM-DD HH:MM
- **Participants**: [list]
- **Recorder**: Max

## Topic Discussion

### Topic 1: [title]
**Discussion Content**:
[key points recorded]

**Conclusion**:
[decisions made]

**Action Items**:
- [ ] [item] - [responsible person] - [deadline]

### Topic 2: [title]
...

## Decision Summary
| Decision | Responsible Person | Deadline |
|----------|-------------------|----------|
| [decision] | [person] | [time] |

## Next Meeting
- **Time**: [to be determined]
- **Scheduled Topics**: [topics]
```

## Storage Location

Meeting records are stored to `../shared/tasks/meetings.md`
