# /convert - Document Structured Conversion

Convert raw documents to AI-friendly structured format while extracting business dictionary

## Usage

```
/convert [document path or content]
/convert prd [document]     # Convert to PRD format
/convert ui [document]      # Convert to UI format
/convert api [document]     # Convert to API format
```

## Output Content

### 1. Structured Document (Main body)
Output according to corresponding template format

### 2. Business Dictionary (Auto-extracted)
Extract business terms and their meanings from documents

## Business Dictionary Extraction Rules

### Extraction Sources
1. **Terminology sections** - Most accurate, priority extraction
2. **First occurrence of proper nouns** - Terms in quotes or bold
3. **Abbreviations and full forms** - e.g. "DMS (Dealer Management System)"
4. **Status/level definitions** - e.g. "H-level leads indicate low intent"
5. **Business entities** - e.g. "Tier 1", "Tier 2", "JiXingYi"

### Extraction Format
```markdown
## Business Dictionary

| Term | Meaning | Source |
|------|------|------|
| JiXingYi | Multi-brand co-operating Tier 2 network mode | Terminology |
| Tier 2 | Secondary dealer network, belongs to Tier 1 | Terminology |
| Tier 1 | Primary dealer (main network) | Context inference |
| H-level leads | Low-intent prospects | Section 4.5 |
```

### Confidence Markers
- ✅ Clearly defined in document
- ⚠️ Context inference (needs manual confirmation)
- ❓ Uncertain (needs manual supplement)

## Execution Steps

### 1. Identify Document Type
Auto-determine based on content or use user-specified type

### 2. Extract Business Dictionary
```
Scan document
    ↓
Find "terminology" sections → Direct extraction
    ↓
Find proper nouns (bold/quotes/first definition) → Extract terms + context
    ↓
Find abbreviation explanations → Extract full forms
    ↓
Find status/level definitions → Extract meanings
    ↓
Generate business dictionary table
```

### 3. Structured Conversion
Convert main content according to template (remove redundancy, extract key points, convert images to text)

### 4. Output Results
```markdown
# [Document Title]

## META
...

## Business Dictionary
| Term | Meaning | Confidence | Source |
|------|------|--------|------|
| xxx | xxx | ✅ | Terminology |
| xxx | xxx | ⚠️ | Context inference |

---

[Structured main content]

---

## AI Development Guidelines
> When developing features from this PRD, note:
> 1. First understand the terms in the business dictionary above
> 2. Keep consistent naming of terms in code
```

## Example

**Input**: G-Assistant-3.3.16-JiXingYi-Support.pdf

**Output**:
```markdown
# PRD: G Assistant 3.3.16

## META
Name: G Assistant 3.3.16 - JiXingYi Support
...

## Business Dictionary

| Term | Meaning | Confidence | Source |
|------|------|--------|------|
| JiXingYi | New sales model Tier 2 network supporting multi-brand co-operation, can bind with multiple Tier 1 dealers (4-5 companies) | ✅ | Terminology |
| Regular Tier 2 | Original normal Tier 2, belongs to only one Tier 1, authorization only from belonging Tier 1 | ✅ | Terminology |
| Tier 1 | Primary dealer network | ⚠️ | Context inference |
| Tier 2 | Secondary dealer network | ⚠️ | Context inference |
| DMS | Dealer Management System, provides authorization data interface | ⚠️ | Section 5.DMS Related Changes |

---

[PRD main content]
```

## Storage Location

Converted documents stored to:
```
../shared/docs/[document-name].md
```

Business dictionary is part of the document, not stored separately.
