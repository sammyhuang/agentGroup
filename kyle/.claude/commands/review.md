# /review - Code Review

Conduct comprehensive review of specified code

## Usage
/review [file path or directory]

## Execution Steps

1. Read target code files

2. Review according to the following dimensions:

### Code Standards
- [ ] Naming conventions (variables, functions, classes)
- [ ] Code structure and organization
- [ ] Comment completeness and accuracy
- [ ] Code style consistency

### Logic Correctness
- [ ] Business logic correctness
- [ ] Boundary condition handling
- [ ] Error handling mechanisms
- [ ] Null/exception handling

### Security
- [ ] Input validation
- [ ] SQL injection/XSS protection
- [ ] Sensitive information handling
- [ ] Permission controls

### Maintainability
- [ ] Code complexity
- [ ] Duplicate code
- [ ] Dependency reasonableness
- [ ] Testability

3. Output review report, categorizing issues:
   - 🔴 Critical (must fix)
   - 🟡 General (recommended fix)
   - 🔵 Suggestions (optional optimization)

4. Ask whether to notify Jarvis for fixes
