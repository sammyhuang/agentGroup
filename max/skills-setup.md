# Max Skills Configuration Guide

## 🎯 Recommended Skills Installation

### Core Project Management Skill Packages

#### 1. Install via Claude Code CLI
```bash
# Enter max project directory
claude --project max

# Install core skill packages
/plugin install pm-skills@claude-code-skills
/plugin install product-skills@claude-code-skills
/plugin install meeting-notes@claude-code-skills
/plugin install status-tracking@claude-code-skills
```

#### 2. Clone GitHub Skills Repositories
```bash
# Clone professional project management system
git clone https://github.com/automazeio/ccpm.git ~/.claude/skills/ccpm

# Clone product management skill set
git clone https://github.com/Sh1n/pm-claude-skills--.git ~/.claude/skills/pm-claude-skills

# Clone comprehensive skills library
git clone https://github.com/alirezarezvani/claude-skills.git ~/.claude/skills/claude-skills
```

### 🔧 Skill Activation Commands

Use the following commands in Claude Code to activate skills:

```bash
# Project management core
/skill project-tracking
/skill risk-analysis
/skill team-efficiency
/skill milestone-planning

# Product consultant enhancement
/skill requirements-analysis
/skill prd-generation
/skill priority-ranking
/skill competitive-analysis

# Personal assistant functions
/skill meeting-management
/skill todo-organization
/skill team-coordination
/skill reminder-system
```

## 📊 Skills Configuration Verification

After installation, verify:
```bash
# Check installed skills
/skills list

# Test core functions
/skill project-status
/skill generate-meeting-notes
/skill analyze-requirements
```

## 🚀 Usage Examples

### Project Status Report
```
/skill project-status --format="weekly" --include="risks,blockers,progress"
```

### Meeting Notes Generation
```
/skill meeting-notes --type="standup" --attendees="team" --duration="30min"
```

### PRD Generation
```
/skill prd-generation --feature="new-dashboard" --priority="high" --stakeholders="design,dev,qa"
```

## 💡 Best Practices

1. **Daily Use**:
   - Morning standup: `/skill daily-standup`
   - Progress tracking: `/skill track-progress`
   - Risk checking: `/skill identify-risks`

2. **Weekly Use**:
   - Report generation: `/skill weekly-report`
   - Team efficiency analysis: `/skill team-metrics`
   - Milestone review: `/skill milestone-review`

3. **On-Demand Use**:
   - PRD writing: `/skill write-prd`
   - Competitive analysis: `/skill competitive-research`
   - Requirements prioritization: `/skill prioritize-backlog`

## ⚠️ Important Notes

- Please read each skill's README documentation before first use
- Some skills may require API key configuration
- Recommend testing skills in a test project first
- Regularly update skill libraries to get latest features