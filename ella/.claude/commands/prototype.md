# /prototype - Interactive Prototype

Design user interaction flows and page state changes

## Usage

```
/prototype [feature description]
/prototype login registration flow
/prototype order payment flow
```

## Execution Steps

### 1. Understand User Goals
- What task does the user want to complete?
- What are the key steps?
- What problems might they encounter?

### 2. Draw Flow Diagram

```
User Flow: [Feature Name]

[Start Point]
   ↓
[Step 1] ──Failure──→ [Error Handling]
   ↓ Success              ↓
[Step 2]          [Retry/Return]
   ↓
[Complete]
```

### 3. Define Page States

```markdown
## Page States

### [Page Name]

| State | Trigger Condition | UI Behavior |
|------|----------|----------|
| Initial | First entry | Empty form |
| Loading | Submit data | Button loading |
| Success | Request success | Toast notification |
| Error | Request failed | Error message |
| Empty | No data | Empty state illustration |
```

### 4. Design Interaction Details

```markdown
## Interaction Instructions

### Form Interactions
| Action | Feedback |
|------|------|
| Input | Real-time validation, red border + message on error |
| Focus out | Complete validation |
| Submit | Button loading, prevent duplicate clicks |

### Gesture Interactions (Mobile)
| Gesture | Effect |
|------|------|
| Pull down | Refresh data |
| Swipe up | Load more |
| Swipe left | Delete operation |

### Animation Effects
| Scenario | Animation | Duration |
|------|------|------|
| Page transition | Left-right slide | 300ms |
| Modal appear | Bottom slide up | 250ms |
| Toast | Fade in/out | 200ms |
```

### 5. Exception Handling

```markdown
## Exception States

| Exception | Handling Method |
|------|----------|
| Network error | Toast message "Network error", retry option |
| Server error | Error page, contact support |
| Login expired | Redirect to login page |
| No permission | Show no permission message, return to previous page |
```

### 6. Output Prototype Document

Store to `../shared/designs/[feature-name]-prototype.md`

## Example Output

```markdown
# Interactive Prototype - Login Flow

## User Flow

[Open App]
    ↓
[Login Page] ─Logged in─→ [Home]
    ↓ Not logged in
[Enter Phone Number]
    ↓
[Get Verification Code] ──Failed──→ [Show error, get again]
    ↓ Success
[Enter Verification Code]
    ↓
[Login Verification] ──Failed──→ [Show error, re-enter]
    ↓ Success
[Home]

## Page States
...

## Interaction Details
...
```
