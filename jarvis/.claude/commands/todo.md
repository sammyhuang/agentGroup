# /todo - Todo Management

Manage personal todo items

## Usage

```
/todo                        # View all todos
/todo add [content]          # Add todo
/todo done [number]          # Complete todo
/todo del [number]           # Delete todo
/todo remind [number] [minutes ahead]  # Set system reminder for todo
```

## Execution Steps

### View Todos (/todo)
1. Read `./todos.md`
2. Display grouped by priority and status:
   - 🔴 Urgent
   - 🟡 Normal
   - ✅ Completed (latest 3)

### Add Todo (/todo add)
1. Parse content, identify priority markers (!urgent)
2. Append to `./todos.md`
3. Confirm successful addition

### Complete Todo (/todo done)
1. Mark specified todo as completed
2. Record completion time
3. Ask if there are follow-up tasks

### Delete Todo (/todo del)
1. Confirm deletion
2. Remove from list

### Set Reminder (/todo remind)
1. Parse todo number and advance reminder time (default 5 minutes)
2. Extract time information from todo
3. Calculate reminder time (todo time - advance minutes)
4. Use macOS Reminders App to add system reminder:
   ```bash
   osascript <<'EOF'
   tell application "Reminders"
       set theDate to current date
       set hours of theDate to [reminder hour]
       set minutes of theDate to [reminder minute]
       set seconds of theDate to 0
       tell default list
           make new reminder with properties {name:"[todo title]", body:"[original time] start", due date:theDate, remind me date:theDate}
       end tell
   end tell
   EOF
   ```
5. Confirm reminder setting successful

### Quick Set Reminder When Adding Todo
When using `/todo add`, if content contains specific time, ask user if system reminder is needed
