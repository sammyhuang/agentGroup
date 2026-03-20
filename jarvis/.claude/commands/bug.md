# /bug - Record Bug

Record bug to `../shared/tasks/bugs.md`

## Usage
/bug [bug description]

## Execution Steps

1. Parse bug information

2. Generate bug ID: BUG-YYYYMMDD-number

3. Append to `../shared/tasks/bugs.md` with format:
```markdown
## BUG-XXXXXX-XX

- **Description**: xxx
- **Discovery Time**: YYYY-MM-DD HH:mm
- **Severity**: High/Medium/Low
- **Status**: Pending fix
- **Related Files**: xxx
- **Reproduction Steps**:
  1. xxx
- **Fix Records**:
```

4. Confirm record and ask if immediate processing is needed
