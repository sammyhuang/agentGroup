# /report - Generate Project Report

Generate project progress reports

## Usage

```
/report daily        # Daily report
/report weekly       # Weekly report
/report [project]    # Specific project report
```

## Daily Report Template

```markdown
# Project Daily Report - YYYY-MM-DD

## Today's Completed Tasks
### Design
- [x] [task]

### Development
- [x] [task]

### Testing
- [x] [task]

## In Progress
- [ ] [task] - [responsible person] - [estimated completion time]

## Blocking Issues
| Issue | Impact | Solution | Responsible Person |
|-------|--------|----------|-------------------|
| [issue] | [impact scope] | [solution] | [person] |

## Tomorrow's Plan
1. [plan]
```

## Weekly Report Template

```markdown
# Project Weekly Report - Week X (MM-DD ~ MM-DD)

## This Week Overview
| Type | Planned | Completed | Completion Rate |
|------|---------|-----------|----------------|
| Design | X | X | XX% |
| Development | X | X | XX% |
| Testing | X | X | XX% |

## Milestone Progress
| Milestone | Target Date | Current Status | Risk |
|-----------|-------------|----------------|------|
| [name] | [date] | XX% | Low/Medium/High |

## This Week Highlights
1. [highlight]

## Issues and Risks
| Issue | Status | Impact | Response Measures |
|-------|--------|---------|------------------|
| [issue] | Resolved/In Progress | [impact] | [measures] |

## Next Week Plan
### Design
- [ ] [task]

### Development
- [ ] [task]

### Testing
- [ ] [task]

## Decisions Needed
1. [items requiring user decision]
```

## Storage Location

Reports are stored to `../shared/tasks/reports/`
