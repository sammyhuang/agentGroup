# /verify - PRD Verification

Verify whether implementation meets PRD requirements

## Usage
/verify [PRD file path]

## Execution Steps

1. Read PRD document and extract all functional requirements

2. Verify item by item:
```markdown
| No. | PRD Requirement | Status | Verification Method | Notes |
|-----|-----------------|--------|-------------------|-------|
| 1 | xxx | ✅/❌/⚠️ | Code check/testing | xxx |
```

3. For each requirement:
   - ✅ Fully compliant
   - ⚠️ Partially compliant (explain differences)
   - ❌ Not implemented or non-compliant

4. Summarize verification results:
   - Pass rate
   - Details of failed items
   - Recommended additions

5. Generate verification report and store to `../shared/reviews/`

6. Ask whether to notify Jarvis to handle failed items
