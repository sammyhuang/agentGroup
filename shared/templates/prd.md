# PRD Structured Template

> Convert product requirement documents to this format

---

## META
```yaml
Name: [Feature name]
Version: v1.0
Author: [PM name]
Date: YYYY-MM-DD
Status: Draft|Under Review|Finalized
Priority: P0|P1|P2
```

## Background
<!-- 1-2 sentences explaining why we're doing this -->
[Problem/opportunity description]

## Objectives
<!-- Quantify with metrics -->
- Objective 1: [Specific metrics]
- Objective 2: [Specific metrics]

## Users
```yaml
Role: [User type]
Scenario: [Use case]
Pain Point: [Core pain point]
```

## Feature List
<!-- Use numbering for tracking -->
| ID | Feature | Priority | Description |
|----|---------|----------|-------------|
| F1 | xxx | P0 | xxx |
| F2 | xxx | P1 | xxx |

## Feature Details

### F1: [Feature Name]
```yaml
Entry: [How to access]
Prerequisites: [Preconditions]
```

**Flow**:
1. User → [Action]
2. System → [Response]
3. User → [Action]

**Rules**:
- R1: [Business rule]
- R2: [Business rule]

**Exceptions**:
- E1: [Exception case] → [Handling method]

---

### F2: [Feature Name]
<!-- Same format as above -->

## Data
```yaml
Input: [Required data]
Output: [Generated data]
Storage: [Storage requirements]
```

## Non-functional
```yaml
Performance: [Response time/concurrency requirements]
Security: [Permission/encryption requirements]
Compatibility: [Browser/device requirements]
```

## Milestones
| Phase | Date | Deliverables |
|-------|------|--------------|
| Development | MM-DD | xxx |
| Testing | MM-DD | xxx |
| Launch | MM-DD | xxx |

## Open Issues
- [ ] Q1: [Question to be confirmed]
- [ ] Q2: [Question to be confirmed]

---

<!--
Conversion guide:
1. Remove all filler words and redundant expressions
2. Convert images to text descriptions of key elements
3. Break long paragraphs into bullet lists
4. Keep repeated content in only one place
-->