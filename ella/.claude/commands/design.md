# /design - UI Design

Design user interface based on PRD requirements

## Usage

```
/design [PRD file or feature description]
/design login page
/design ../shared/docs/xxx.md
```

## Execution Steps

### 1. Understand Requirements
- Read PRD document or user description
- Extract key functional points and user flows
- Confirm design scope (mobile/PC)

### 2. Confirm Design Direction
Ask user:
- Are there any reference designs?
- Should we follow existing design specifications?
- Any special style requirements?

### 3. Output Design Mockup

```markdown
# UI Design - [Feature Name]

## Design Information
Designer: Ella
Date: YYYY-MM-DD
PRD Source: [source]

## Design Specifications

### Colors
| Name | Hex Value | Usage |
|------|------|------|
| Primary | #1890FF | Buttons, links |
| Background | #F5F5F5 | Page background |
| Text | #333333 | Main text |

### Typography
| Type | Size | Weight | Color |
|------|------|------|------|
| Large Title | 24px | 600 | #333 |
| Title | 18px | 500 | #333 |
| Body Text | 14px | 400 | #666 |

### Spacing
| Type | Value |
|------|------|
| Page Margin | 16px |
| Module Spacing | 24px |
| Element Spacing | 12px |

## Page Layout

### [Page Name]

+----------------------------------+
|           Header 44px            |
+----------------------------------+
|                                  |
|      [Content Area Description]  |
|                                  |
+----------------------------------+
|           Footer 50px            |
+----------------------------------+

### Component Description
[Detailed description of each component]

## Interaction Instructions
[User operation flows and feedback]
```

### 4. Store Design Mockup
Save to `../shared/designs/[feature-name]-ui.md`

### 5. Ask for Next Steps
- Need any adjustments?
- Should I notify Jarvis to start development?

## Example

**Input**: /design reception filing page

**Output**: Complete UI design mockup including layout, specifications, and interaction instructions
