# BUG Structured Template

> Concise and efficient bug reporting format

---

## BUG-[YYYYMMDD]-[Number]

```yaml
Title: [One-line description]
Level: P0 Critical|P1 High|P2 Medium|P3 Low
Status: Pending|Fixing|Testing|Closed
Discovered: [Name] @ YYYY-MM-DD
Assigned: [Developer Name]
```

### Symptoms
<!-- What happened -->
[Brief description of the problem symptoms]

### Reproduction
```
Environment: [Browser/System/Version]
Account: [Test account, if any]
Steps:
1. [Action 1]
2. [Action 2]
3. [Action 3]
Result: [Actual result]
Expected: [Expected result]
```

### Evidence
<!-- Screenshot description or key log lines -->
```
[Error logs/Screenshot description]
```

### Impact
```yaml
Scope: [Affected functions/user groups]
Frequency: Always|Sometimes(X/10)
```

### Fix
<!-- Fill after fixing -->
```yaml
Cause: [Root cause]
Solution: [Fix solution]
Files: [Modified files]
Verification: [How to verify]
```

---

<!--
Template usage:
- P0: Blocks core processes, fix immediately
- P1: Function anomaly, fix same day
- P2: Experience issue, fix this week
- P3: Optimization suggestion, schedule for later
-->