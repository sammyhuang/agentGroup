# /suggest - Product Suggestions

Provide product direction and priority recommendations

## Usage

```
/suggest [requirement or problem description]
/suggest priority [feature list]
/suggest review [PRD file]
```

## Requirement Assessment

```markdown
# Requirement Assessment - [requirement name]

## Requirement Overview
[brief description]

## Assessment Dimensions

### User Value ⭐⭐⭐⭐⭐
[analyze user value]

### Business Value ⭐⭐⭐⭐☆
[analyze business value]

### Implementation Cost ⭐⭐⭐☆☆
[assess development cost]

### Risk Assessment ⭐⭐☆☆☆
[identify potential risks]

## Recommendation
**Priority**: P0/P1/P2/P3
**Suggestion**: [whether to do/how to do/alternative solutions]
**Rationale**: [decision basis]
```

## Priority Ranking

```markdown
# Feature Priority Ranking

## Assessment Matrix

| Feature | User Value | Business Value | Cost | Total Score | Priority |
|---------|------------|----------------|------|-------------|----------|
| [Feature A] | 5 | 4 | 2 | 7 | P0 |
| [Feature B] | 3 | 3 | 4 | 2 | P2 |

Scoring Rules:
- User Value: 1-5 points
- Business Value: 1-5 points
- Cost: 1-5 points (lower is better)
- Total Score = User Value + Business Value - Cost

## Recommended Schedule

### Phase 1 (P0)
1. [Feature A] - Core feature, must do

### Phase 2 (P1)
1. [Feature C] - Important feature, priority

### Subsequent Iterations (P2+)
1. [Feature B] - Can be delayed
```

## PRD Review

```markdown
# PRD Review - [document name]

## Review Conclusion: ✅ Approved / ⚠️ Needs Revision / ❌ Not Approved

## Strengths
1. [commendable aspects]

## Issues and Suggestions

### Issue 1: [issue description]
**Impact**: [impact scope]
**Suggestion**: [revision suggestion]

### Issue 2: [issue description]
...

## Missing Items
- [ ] [content that needs to be added]

## Next Steps
[suggested follow-up actions]
```
