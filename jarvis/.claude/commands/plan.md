# /plan - Create Technical Solution

Output technical solution based on PRD or requirements

## Usage
/plan [PRD file path or requirement description]

## Execution Steps

1. Read PRD/requirements, understand functional requirements

2. Analyze technology selection and implementation approach

3. Output technical solution document containing:
```markdown
# Technical Solution - [Feature Name]

## 1. Requirements Overview
Brief description of PRD core requirements

## 2. Technology Selection
- Frontend: xxx
- Backend: xxx
- Database: xxx
- Others: xxx

## 3. Architecture Design
Overall architecture explanation + diagrams (if needed)

## 4. Interface Design
### API List
| Interface | Method | Description |
|-----|------|-----|

### Interface Details
...

## 5. Data Structure
Table structure/model definitions

## 6. Implementation Steps
1. xxx
2. xxx

## 7. Risk Assessment
Potential issues and response plans
```

4. Store to `../shared/tasks/plans/` directory

5. Ask user if adjustments needed or start development
