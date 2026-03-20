# /spec - Design Specification

Output complete design specification document

## Usage

```
/spec              # Output current project design specification
/spec create       # Create new design specification
/spec update       # Update existing specification
```

## Design Specification Template

```markdown
# Design Specification - [Project Name]

## Basic Information
Designer: Ella
Created Date: YYYY-MM-DD
Updated Date: YYYY-MM-DD

---

## 1. Color System

### Brand Colors
| Name | Hex Value | Usage Scenario |
|------|------|----------|
| Primary | #1890FF | Buttons, links, emphasis |
| Primary Light | #E6F7FF | Selected background, hint background |
| Primary Dark | #096DD9 | Button hover |

### Neutral Colors
| Name | Hex Value | Usage Scenario |
|------|------|----------|
| Title | #262626 | Primary titles |
| Body | #595959 | Body content |
| Secondary | #8C8C8C | Secondary text |
| Disabled | #BFBFBF | Disabled state |
| Border | #D9D9D9 | Borders, dividers |
| Background | #F5F5F5 | Page background |
| White | #FFFFFF | Card background |

### Functional Colors
| Name | Hex Value | Usage Scenario |
|------|------|----------|
| Success | #52C41A | Success state |
| Warning | #FAAD14 | Warning alerts |
| Error | #FF4D4F | Error state |
| Info | #1890FF | Information alerts |

---

## 2. Typography System

### Font Family
```css
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI',
             Roboto, 'Helvetica Neue', Arial, sans-serif;
```

### Font Size Hierarchy
| Level | Size | Weight | Line Height | Usage Scenario |
|------|------|------|------|----------|
| H1 | 28px | 600 | 1.4 | Page titles |
| H2 | 24px | 600 | 1.4 | Section titles |
| H3 | 20px | 500 | 1.4 | Card titles |
| H4 | 16px | 500 | 1.5 | List titles |
| Body | 14px | 400 | 1.6 | Body text |
| Caption | 12px | 400 | 1.4 | Helper text |

---

## 3. Spacing System

### Base Unit
Base spacing unit: 4px

### Spacing Specification
| Name | Value | Usage Scenario |
|------|------|----------|
| xs | 4px | Tight element spacing |
| sm | 8px | Related element spacing |
| md | 16px | Standard spacing |
| lg | 24px | Section spacing |
| xl | 32px | Large section spacing |

### Page Margins
| Device | Margin |
|------|------|
| Mobile | 16px |
| Tablet | 24px |
| Desktop | 32px |

---

## 4. Border Radius System

| Element | Border Radius |
|------|------|
| Small Button | 4px |
| Medium Button | 6px |
| Card | 8px |
| Modal | 12px |
| Avatar | 50% |

---

## 5. Shadow System

| Level | Shadow Value | Usage Scenario |
|------|--------|----------|
| Level 1 | 0 1px 2px rgba(0,0,0,0.05) | Cards |
| Level 2 | 0 4px 8px rgba(0,0,0,0.1) | Dropdown menus |
| Level 3 | 0 8px 16px rgba(0,0,0,0.15) | Modals |

---

## 6. Component Specifications

### Buttons
| Type | Height | Padding | Font Size |
|------|------|--------|------|
| Large Button | 44px | 0 24px | 16px |
| Medium Button | 36px | 0 16px | 14px |
| Small Button | 28px | 0 12px | 12px |

### Input Fields
| Property | Value |
|------|------|
| Height | 36px |
| Border | 1px solid #D9D9D9 |
| Border Radius | 4px |
| Padding | 0 12px |

### Cards
| Property | Value |
|------|------|
| Background | #FFFFFF |
| Border Radius | 8px |
| Padding | 16px |
| Shadow | Level 1 shadow |

---

## 7. Responsive Breakpoints

| Breakpoint | Range | Layout |
|------|------|------|
| xs | < 576px | Single column |
| sm | >= 576px | Single column |
| md | >= 768px | Two columns |
| lg | >= 992px | Multi-column |
| xl | >= 1200px | Max width 1200px |
```

## Storage Location

Design specification stored to `../shared/designs/design-spec.md`
