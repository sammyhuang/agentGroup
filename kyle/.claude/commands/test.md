# /test - Execute Tests

Perform testing and verification of functionality

## Usage
/test [feature name or test scope]

## Execution Steps

1. Confirm test targets and scope

2. Design test cases:

### Normal Flow Testing
- Whether main functionality works properly
- Whether expected output is correct

### Boundary Testing
- Empty input
- Extremely long input
- Special characters
- Limit values

### Exception Testing
- Network exceptions
- Data exceptions
- Permission exceptions
- Concurrent scenarios

### Security Testing
- XSS attempts
- SQL injection attempts
- Unauthorized access
- Sensitive information leakage

3. Execute tests and record results

4. Output test report:
```markdown
# Test Report - [feature name]

## Test Overview
| Item | Value |
|------|-------|
| Total Cases | X |
| Passed | X |
| Failed | X |
| Pass Rate | X% |

## Failed Test Case Details
...

## Issues Found
...
```

5. Store to `../shared/reviews/` and ask whether to notify Jarvis
