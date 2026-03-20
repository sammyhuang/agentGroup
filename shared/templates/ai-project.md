# AI Project Description Template

> Place in project root `.claude/project.md`, automatically read when AI starts

---

# [Project Name]

## META
```yaml
Name: xxx
Version: x.x.x
Updated: YYYY-MM-DD
Maintainer: xxx
```

## One-line Description
[What the project is in under 20 words]

## Tech Stack
```yaml
Frontend: Vue3 / React / ...
Backend: NestJS / Express / ...
Database: MySQL / MongoDB / ...
Deployment: Docker / PM2 / ...
```

## Directory Structure
```
Project Root/
├── src/
│   ├── modules/       # [Description]
│   ├── services/      # [Description]
│   └── utils/         # [Description]
├── tests/             # [Description]
└── config/            # [Description]
```

## Key Files
<!-- Files AI needs to focus on -->

| File | Purpose | Modification Frequency |
|------|---------|----------------------|
| src/main.ts | Entry file | Low |
| src/config.ts | Configuration center | Medium |
| src/modules/user/ | User module | High |

## Core Concepts
<!-- Project-specific business concepts that AI must understand -->

| Concept | Description |
|---------|-------------|
| xxx | xxx |

## Data Flow
<!-- Brief description of how data flows -->
```
User Request → Controller → Service → Repository → DB
                ↓
            Return Response
```

## Development Standards
```yaml
Naming: camelCase / PascalCase / snake_case
Indentation: 2 spaces / 4 spaces
Branches: feature/xxx, fix/xxx
Commits: feat: / fix: / docs:
```

## Common Commands
```bash
npm run dev      # Start development
npm run build    # Build
npm run test     # Test
```

## Current Status
```yaml
Phase: Development / Testing / Live
Branch: main / develop
Recent Changes: [Brief description]
```

## Ongoing Tasks
- [ ] Task 1
- [ ] Task 2

## Known Issues
- Issue 1: [Description]
- Issue 2: [Description]

## Change Log
### YYYY-MM-DD
- Change content

---

<!--
Usage instructions:
1. Copy this template to project .claude/project.md
2. Fill in each section
3. Update "Current Status" and "Change Log" when code changes
4. AI will automatically read this file on startup
-->