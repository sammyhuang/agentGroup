# /report - Generate Review Report

Generate complete review report

## Usage
/report [feature name]

## Execution Steps

1. Summarize all review results for the feature:
   - Code review (/review)
   - PRD verification (/verify)
   - Test results (/test)

2. Generate comprehensive report:
```markdown
# Review Report - [feature name]

**Reviewer**: Kyle
**Date**: YYYY-MM-DD
**Conclusion**: ✅Pass / ⚠️Conditional Pass / ❌Fail

---

## 1. Code Review Results

### Code Standards
...

### Issues Found
| Level | Issue | File | Line | Status |
|-------|-------|------|------|--------|

---

## 2. PRD Verification Results

| PRD Requirement | Status | Notes |
|-----------------|--------|-------|

**Compliance Rate**: X%

---

## 3. Test Results

| Test Type | Pass/Total | Pass Rate |
|-----------|------------|-----------|

### Failed Test Cases
...

---

## 4. Summary

### Must Fix (Blocking Release)
1. ...

### Recommended Fixes
1. ...

### Optimization Suggestions
1. ...

---

**Signature**: Kyle
```

3. Store to `../shared/reviews/report-[feature-name]-[date].md`

4. Ask whether to notify Jarvis for review
