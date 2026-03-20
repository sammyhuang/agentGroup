# UI Structured Template

> Convert UI design files to this format for frontend development use

---

## META
```yaml
Page: [Page name]
Designer: [Name]
Date: YYYY-MM-DD
Size: [Design width]px
Link: [Figma/LanHu link]
```

## Page Structure
<!-- Use tree structure to describe layout -->
```
Page
├── Header
│   ├── Logo [left, 120x40]
│   ├── Navigation [center, flex]
│   └── User Info [right, 200px]
├── Main
│   ├── Sidebar [left, 240px, fixed]
│   └── Content [right, flex]
└── Footer
    └── Copyright [center]
```

## Component List

| Component | Position | Size | State |
|-----------|----------|------|-------|
| Button-Primary | Form bottom | 120x40 | default/hover/disabled |
| Input | Form | 100%x40 | default/focus/error |
| Card | List | 280x160 | default/hover |

## Component Details

### Button-Primary
```yaml
Size: 120x40 | Border-radius: 8px
Font: 16px medium #FFFFFF
Background: #1890FF
States:
  hover: Background #40A9FF
  disabled: Background #D9D9D9, Color #999
```

### Input
```yaml
Size: 100%x40 | Border-radius: 4px
Border: 1px #D9D9D9
Font: 14px #333
Placeholder: #999
States:
  focus: Border #1890FF
  error: Border #FF4D4F, Error text below
```

## Color Scheme
```yaml
Primary: #1890FF
Success: #52C41A
Warning: #FAAD14
Error: #FF4D4F
Text:
  Primary: #333333
  Secondary: #666666
  Auxiliary: #999999
Background:
  Page: #F5F5F5
  Card: #FFFFFF
```

## Typography
```yaml
Font: PingFang SC, -apple-system, sans-serif
H1: 24px bold
H2: 20px bold
Body: 14px regular
Auxiliary: 12px regular
```

## Spacing
```yaml
Page margin: 24px
Card spacing: 16px
Component spacing: 12px
Element spacing: 8px
```

## Interaction Instructions

### Form Submit
```
Click submit
→ Validation fails → Highlight error fields + Show tooltip
→ Validation passes → Button loading → Request
  → Success → Toast message + Navigate
  → Failure → Toast error message
```

### List Loading
```
Scroll to bottom
→ Show loading animation
→ Loading complete, append data
→ No more data shows "No more data"
```

## Responsive Breakpoints
```yaml
PC: >= 1200px
Tablet: 768px - 1199px
Mobile: < 768px
```

## Asset List
| Name | Size | Format | Description |
|------|------|--------|-------------|
| logo | 120x40 | SVG | Main Logo |
| icon-xxx | 24x24 | SVG | Icon |

---

<!--
Conversion guide:
1. Describe position + size for each area in screenshot
2. Use hex colors, not "light blue"
3. Use specific pixel values for spacing
4. Describe interactions with flowcharts
-->