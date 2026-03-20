# /todo - Todo Management

Manage personal and project todo items

## Usage

```
/todo                      # View all todos
/todo add [content]        # Add todo
/todo done [ID]            # Complete todo
/todo project [project]    # View project todos
```

## Todo Format

```markdown
# Todo Items

## Personal Tasks
- [ ] #P001 [task] - Due: [date]
- [x] #P002 [completed task] - Completed: [date]

## Project: [project name]
- [ ] #T001 [task] - Assignee: [person] - Due: [date]
- [ ] #T002 [task] - Assignee: [person] - Due: [date]

## Today's Priorities
1. [most important task]
2. [second most important task]
```

## Priority Markers

| Marker | Meaning |
|--------|---------|
| 🔴 | Urgent & Important |
| 🟡 | Important but Not Urgent |
| 🔵 | Urgent but Not Important |
| ⚪ | Not Urgent & Not Important |

## View Todos

```markdown
# Todo Items - YYYY-MM-DD

## Today's Todos (X items)
- [ ] 🔴 #P001 [urgent task]
- [ ] 🟡 #T003 [important task]

## This Week's Todos (X items)
- [ ] #T004 [task] - Due: Friday

## Overdue (X items)
- [ ] ⚠️ #T002 [overdue task] - Originally due: [date]
```

## Storage Location

Todo items are stored to `../shared/tasks/todos.md`
