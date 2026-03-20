# /style - Style Extraction

Extract design style from reference images and generate design specifications

## Usage

```
/style [image path or description]
/style reference this image's style
/style minimalist modern style
```

## Execution Steps

### 1. Analyze Reference
- If image: Analyze visual elements
- If description: Understand style keywords

### 2. Extract Design Elements

#### Color Analysis
```markdown
## Color Extraction

### Main Colors
| Color | Hex Value | Usage Scenario | Ratio |
|------|------|----------|------|
| Brand Blue | #1890FF | Buttons, emphasis | 20% |
| Dark Gray | #333333 | Main text | 30% |
| Light Gray | #F5F5F5 | Background | 40% |

### Secondary Colors
| Color | Hex Value | Usage Scenario |
|------|------|----------|
| Success | #52C41A | Success state |
| Warning | #FAAD14 | Warning alerts |
| Error | #FF4D4F | Error state |
```

#### Typography Analysis
```markdown
## Typography Extraction

| Level | Size | Weight | Line Height | Purpose |
|------|------|------|------|------|
| H1 | 28px | 600 | 1.4 | Page titles |
| H2 | 20px | 500 | 1.4 | Section titles |
| Body | 14px | 400 | 1.6 | Body text |
| Caption | 12px | 400 | 1.4 | Helper text |
```

#### Border Radius/Shadow
```markdown
## Shape & Effects

| Element | Border Radius | Shadow |
|------|------|------|
| Card | 8px | 0 2px 8px rgba(0,0,0,0.1) |
| Button | 4px | none |
| Input | 4px | none |
| Modal | 12px | 0 4px 16px rgba(0,0,0,0.15) |
```

### 3. Output Style Guide

Store to `../shared/designs/style-guide.md`

### 4. Application Suggestions
Explain how to apply this style to specific pages

## Common Style Keywords

| Style | Characteristics |
|------|------|
| Minimalist Modern | Lots of whitespace, flat design, sans-serif fonts |
| Tech-focused | Dark backgrounds, gradients, light effects |
| Warm & Friendly | Warm colors, rounded corners, illustrations |
| Professional Business | Cool colors, structured layout, formal |
