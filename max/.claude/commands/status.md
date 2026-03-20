# /status - Team Status Summary

View work status of all team members

## Usage

```
/status           # View all status
/status design    # View design status
/status dev       # View development status
/status test      # View testing status
```

## Execution Steps

### 1. Read Shared Status
Read `../shared/status.json`

### 2. Summarize Team Member Status

```markdown
# Team Status Summary - YYYY-MM-DD HH:MM

## Design (Ella)
| Task | Status | Last Updated |
|------|--------|-------------|
| [task name] | In Progress/Completed/Pending | [time] |

## Development (Jarvis)
| Task | Status | Last Updated |
|------|--------|-------------|
| [task name] | In Progress/Completed/Pending | [time] |

## Testing (Kyle)
| Task | Status | Last Updated |
|------|--------|-------------|
| [task name] | In Progress/Completed/Pending | [time] |

## Pending Notifications
[list unprocessed notifications]

## Blocking Points
[if any blockages exist, list them and suggest solutions]
```

### 3. Risk Alerts
Proactively remind if the following situations are detected:
- Tasks with no updates for extended periods
- Dependency blockages
- Resource conflicts
