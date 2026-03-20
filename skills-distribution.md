# aiGroup Skills Distribution Configuration

> **Statement**: The skill packages integrated in this project come from multiple open source communities and the SkillsMP skills marketplace. We thank all original authors for their contributions. All skills are marked with source, author, and license information. Please comply with corresponding usage terms.

## 🎯 Skill Allocation Strategy

### 👨‍💼 Max - Project Management Skills
**Skills Directory**: `max/skills/`

#### 📦 CCPM Project Management System
- **Path**: `max/skills/ccpm/`
- **Function**: GitHub Issues integration, project tracking
- **Usage**: `claude --project max → /skill ccmp-status`

#### 🎨 PM Claude Skill Set
- **Path**: `max/skills/pm-claude-skills/`
- **Function**: PRD generation, meeting notes, requirements analysis
- **Time Savings**: 8-9 hours/week
- **Usage**: `claude --project max → /skill generate-prd`

#### 📜 Quick Tools
- **Path**: `max/skills/max-skills.sh`
- **Function**: Interactive skill selection menu
- **Usage**: `./max/skills/max-skills.sh`

### 🎨 Ella - Design Skills
**Skills Directory**: `ella/skills/`

#### 🖼️ Advanced Frontend Skills
- **Path**: `ella/skills/senior-frontend/`
- **Function**: UI/UX design, frontend development guidance
- **Specialties**: React/Vue component design, responsive layout
- **Usage**: `claude --project ella → /skill ui-design`

### ⚡ Jarvis - Development Skills
**Skills Directory**: `jarvis/skills/`

#### 🏗️ Claude Simone Framework
- **Path**: `jarvis/skills/claude-simone/`
- **Function**: AI-assisted development project management
- **Specialties**: Development workflow optimization, team collaboration

#### 👥 Engineering Team Skill Set
- **Path**: `jarvis/skills/engineering-team/`
- **Included Skills**:
  - senior-backend (Backend development)
  - senior-fullstack (Full-stack development)
  - senior-architect (System architecture)
  - code-reviewer (Code review)
  - senior-devops (DevOps deployment)
  - tech-stack-evaluator (Technology selection)
- **Usage**: `claude --project jarvis → /skill code-review`

### 🔍 Kyle - Testing Skills
**Skills Directory**: `kyle/skills/`

#### 🧪 Advanced QA Skills
- **Path**: `kyle/skills/senior-qa/`
- **Function**: Testing strategy, quality assurance, acceptance testing
- **Specialties**: Automated testing, performance testing

#### 📋 TDD Guidance
- **Path**: `kyle/skills/tdd-guide/`
- **Function**: Test-driven development guidance
- **Specialties**: Unit testing, integration test design
- **Usage**: `claude --project kyle → /skill tdd-testing`

## 🚀 Usage Methods

### Launch Specific AI and Use Skills
```bash
# Max project management
claude --project max
/skills list
/skill project-status

# Ella UI design
claude --project ella
/skills list
/skill ui-design

# Jarvis development
claude --project jarvis
/skills list
/skill code-review

# Kyle testing
claude --project kyle
/skills list
/skill qa-testing
```

### Skill Path Configuration
Each AI automatically detects skills in its `skills/` directory, no additional configuration needed.

## 📊 Skill Allocation Statistics

| AI Member | Skill Count | Main Areas | Expected Benefits |
|-----------|-------------|------------|-------------------|
| Max | 2 systems + tools | Project management, product planning | 8-9 hours/week saved |
| Ella | 1 skill set | UI/UX design, frontend | Design efficiency improvement |
| Jarvis | 2 frameworks + multi-skills | Full-stack development, architecture | Development quality improvement |
| Kyle | 2 skill sets | Quality assurance, testing | Test coverage improvement |

## 📝 Skill Sources and References

### Max Skill Sources
- **CCPM Project Management System**
  - Source: [automazeio/ccpm](https://github.com/automazeio/ccpm)
  - Author: automaze.io
  - License: MIT License

- **PM Claude Skill Set**
  - Source: [mohitagw15856/pm-claude-skills](https://github.com/mohitagw15856/pm-claude-skills)
  - Author: mohitagw15856
  - License: MIT License

### Ella Skill Sources
- **Senior Frontend Skill Package**
  - Source: SkillsMP Skills Market - Frontend Development Expert Skill Package
  - Author: aiGroup team customization
  - License: MIT License

### Jarvis Skill Sources
- **Claude Simone Framework**
  - Source: [Helmi/claude-simone](https://github.com/Helmi/claude-simone)
  - Author: Helmi
  - License: See original repository

- **Engineering Team Skill Set**
  - Source: [alirezarezvani/claude-skills/engineering-team](https://github.com/alirezarezvani/claude-skills/engineering-team)
  - Author: alirezarezvani
  - License: See original repository

### Kyle Skill Sources
- **Senior QA Skill Package**
  - Source: SkillsMP Skills Market - Senior QA Engineer Skill Package
  - Author: aiGroup team customization
  - License: MIT License

- **TDD Guidance Skill Package**
  - Source: SkillsMP Skills Market - TDD Test-Driven Development Guide
  - Author: aiGroup team customization
  - License: MIT License

## 🔧 Maintenance Instructions

- Each AI's skills are independently managed without interference
- Skill updates only affect the corresponding AI
- New skills can be added independently for each AI
- Complies with responsibility boundary principles
- All skills are marked with source and license information

## ⚠️ Notes

- Skills are only available within the corresponding AI project
- Cross-AI skill usage requires project switching
- Ensure skills match AI responsibilities
- Regularly update and maintain skill libraries
- Comply with license requirements for each skill
- Maintain source attribution when referencing external skills