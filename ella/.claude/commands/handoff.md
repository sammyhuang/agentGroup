# /handoff - Design Handoff

Organize design mockups and prepare for handoff to Jarvis for development

## Usage

```
/handoff [design mockup name]
/handoff login page
/handoff all  # Handoff all designs ready for development
```

## Execution Steps

### 1. Check Design Completeness

Confirm design mockup includes:
- [ ] Page layout (ASCII diagram)
- [ ] Design specifications (colors, typography, spacing)
- [ ] Component states (default, hover, active, disabled)
- [ ] Interaction instructions
- [ ] Exception state handling

### 2. Generate Development Handoff Document

```markdown
# Design Handoff - [Feature Name]

## Handoff Information
Designer: Ella
Handoff Date: YYYY-MM-DD
Design Mockup Location: ../shared/designs/[filename].md

## Design Overview
[Brief description of design content]

## Development Notes

### Key Interactions
1. [Important interaction point 1]
2. [Important interaction point 2]

### Component Reuse
| Component | Reuse | Reference |
|------|----------|------|
| Button | Yes | Existing Button component |
| Form | Yes | Existing Form component |
| Card | New | See design mockup |

### Responsive Requirements
| Breakpoint | Layout Change |
|------|----------|
| < 768px | Single column layout |
| >= 768px | Two column layout |

## Acceptance Criteria
1. Implementation fidelity meets design requirements
2. Smooth interaction effects
3. Complete exception state handling

## Design Mockup Checklist
- [ ] [Design mockup 1].md
- [ ] [Design mockup 2].md
```

### 3. Update Shared Status

Update `../shared/status.json`:
```json
{
  "designs": {
    "[feature name]": {
      "status": "pending development",
      "designer": "Ella",
      "files": ["xxx-ui.md", "xxx-prototype.md"],
      "handoffDate": "YYYY-MM-DD"
    }
  }
}
```

### 4. Notification Options

Ask user:
- Should I notify Jarvis to start development?
- If notification needed, I'll mark the task in status.json

## Handoff Checklist

| Check Item | Status |
|--------|------|
| Complete color values | ✓ |
| Complete font sizes/weights | ✓ |
| Complete spacing annotations | ✓ |
| Clear interaction instructions | ✓ |
| Exception states defined | ✓ |
| Responsive specifications | ✓ |
