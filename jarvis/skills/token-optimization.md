# Token Optimization Skill - Development Domain

**Version**: v1.2
**Update Date**: 2026-02-12
**Author**: Jarvis
**Optimization Goal**: Reduce token usage by 60%+ in development process

---

## Core Principles

**Objective:** Save 60% token consumption, maintain 100% code accuracy

## 1. Intelligent File Reading (Save ~35%)

### Current Practice ❌
```
Read: App.vue (complete 800 lines, ~8000 tokens)
```

### Optimized Practice ✅
```
1. Grep: "toggleAudioPlay" files_with_matches  # Locate first
2. Read: App.vue offset=200 limit=60           # Precise reading
```

### Use Cases
- 🔍 **Bug Fixing** - Search and locate first, then read code precisely
- 🎯 **Feature Development** - Precise reading after finding relevant components
- ⚡ **Code Analysis** - Avoid reading irrelevant parts

---

## 2. Reduce Redundant Explanations (Save ~25%)

### Current Practice ❌
```
Done, configured default models:

| Role | Configuration File | Model |
|------|-------------------|-------|
| Jarvis | jarvis/.claude/settings.local.json | Opus 4.5 |
| Kyle | kyle/.claude/settings.local.json | Sonnet 4 |

Next startup will automatically use corresponding models, no manual specification needed...
```

### Optimized Practice ✅
```
Configured team default Sonnet 4, effective on next startup.
```

### Key Information to Retain
- ✅ Technical implementation points
- ✅ Error handling logic
- ✅ Code modification confirmation
- ❌ Detailed table displays
- ❌ Repetitive explanations

---

## 3. Tool Usage Optimization (Save ~20%)

### File Operation Chain
```
Before optimization: Bash ls → Read complete → Edit → Read verification
After optimization: Glob locate → Grep search → Read precise → Edit modify
```

### Specific Optimizations
- **Locate Files**: Use `Glob` instead of `Bash ls`
- **Search Code**: Use `Grep` for precise location
- **Read Files**: Use `offset/limit` parameters
- **Skip Verification**: Trust tool correctness, avoid repetitive reading

---

## 4. Batch Operations (Save ~15%)

### Current Practice ❌
```
5 buttons, processed 5 times separately:
1. Modify back button
2. Modify settings button
3. Modify microphone button
4. Modify send button
5. Modify play button
```

### Optimized Practice ✅
```
Process all button modifications at once:
1. Read design specs, understand all requirements
2. Complete multiple button modifications in one Edit
3. Verify overall effect
```

---

## 5. Response Simplification Strategy

### Information Hierarchy
```
Essential information: Technical solution + Key implementation + Error handling
Optional information: Detailed steps + Table displays + Background explanation
Redundant information: Repetitive confirmation + Over-explanation
```

### Response Template
```
[Feature Implementation] - Concise explanation of what was done
[Technical Points] - Core implementation logic
[Notes] - Key error handling
```

---

## 6. Unchanging Quality Standards

### Never Compromise Parts 🔒
- ✅ Code logic analysis completeness
- ✅ Bug fix verification adequacy
- ✅ Boundary case consideration comprehensiveness
- ✅ Error handling robustness
- ✅ Technical solution correctness

---

## 7. Model Selection Strategy (v1.2 Addition)

### Basic Model Selection Decision Tree

```
Development Task Assessment
├─ Standardized operation? → Haiku
├─ Need technical judgment? → Sonnet
├─ Need architectural innovation? → Opus (confirmation)
└─ Uncertain? → Choose Sonnet (safe choice)
```

### Haiku Use Cases (30-40% usage rate)
- Standardized file operations (read, write, copy, move)
- Simple text replacement and formatting
- Basic configuration file generation (.gitignore, package.json)
- Standard Git operations (add, commit, push)
- Simple information queries and data extraction

### Sonnet Use Cases (50-60% usage rate)
- System architecture and process design
- Bug diagnosis and problem analysis
- Complex code implementation and refactoring
- Technical solution evaluation and selection
- Tasks requiring logical analysis and technical judgment
- Performance optimization and code review

### Opus Use Cases (5-10% usage rate, needs confirmation)
- Architecture design and refactoring
- Complex performance optimization
- Deep technical solution evaluation
- Complex business logic implementation

### Quality-First Principles

1. **Importance Assessment**: Task impact on project > single-time cost savings
2. **Output Quality Requirements**: Choose stronger model for accuracy and depth needs
3. **User Experience**: Code quality and solution completeness priority
4. **Long-term Benefits**: Good quality code reduces rework, saves more cost long-term

---

## 8. Task Multi-Model Optimization Strategy (v1.2 Addition)

### Development Task Decomposition Pattern

#### Three-Stage Decomposition Example
```
Stage 1: Code information collection → Task(model="haiku")
Stage 2: Technical analysis implementation → Task(model="sonnet")
Stage 3: Code format verification → Task(model="haiku")
```

### Real Case Comparison

**❌ Traditional Approach (10000+ tokens)**:
```python
Task(prompt="Implement complete user authentication system and generate documentation")
```

**✅ Decomposed Optimization (4300 tokens, 57% savings)**:
```python
Task(model="haiku", prompt="Create project directory and basic file structure")
Task(model="haiku", prompt="Generate configuration files and dependency management")
Task(model="sonnet", prompt="Design authentication architecture and implement core logic")
Task(model="haiku", prompt="Verify code format and dependency completeness")
```

**Savings Principle**:
- File operations don't need technical analysis capability → Haiku sufficient
- Core architecture and logic maintain quality → Sonnet guaranteed
- Format verification is purely automated → Haiku adequate

### Task Model Selection Decision Matrix

| Subtask Type | Recommended Model | Token Savings | Quality Impact | Use Case Examples |
|-------------|------------------|---------------|----------------|-------------------|
| File operations/Data extraction | Haiku | 70-80% | No impact | Create files, extract config |
| Simple validation/Format check | Haiku | 70-80% | No impact | Check syntax, verify format |
| Standardized code generation | Haiku | 70-80% | No impact | Config files, template code |
| Bug diagnosis/Technical analysis | Sonnet | Baseline | Quality guarantee | Problem diagnosis, solution design |
| Architecture design/Code implementation | Sonnet | Baseline | Quality guarantee | System design, core functionality |
| Complex architecture/Performance optimization | Opus | -3-5x | Significant improvement | Architecture refactoring, deep optimization |

### Quality Assurance Mechanism

**Core Principle**: Quality first, reasonable optimization

**Quality Assurance Checkpoints**:
1. **Critical business logic must use Sonnet+**
   - Implementation involving product core functionality
   - Code affecting system security
   - Complex algorithms and data processing

2. **User-direct interaction outputs guarantee quality**
   - Core functionality implementation
   - Bug fix solutions
   - Technical solution documentation

3. **Internal processing steps can be moderately optimized**
   - Configuration file generation
   - Simple file operations
   - Formatting and validation

---

## 9. Opus Usage Confirmation Mechanism

### Scenario Description
- **Opus Advantages**: Higher code quality and efficiency when handling complex architecture design, performance optimization, and system refactoring
- **Necessity Judgment**: Opus is needed when development involves architectural decisions, complex algorithm optimization, and technical solution evaluation

### Confirmation Process

#### Step 1: Identify Opus Scenarios
Use more powerful model in the following situations:
- Architecture design and refactoring (affecting overall technical direction)
- Complex performance optimization (involving multiple optimization dimensions)
- Technical solution evaluation (requiring deep technical judgment)
- Complex business logic implementation (high-difficulty coding problems)

#### Step 2: User Confirmation
```
Detected that current task involves complex architecture/performance issues.
Recommend using Opus for deeper technical analysis and optimization.
Please confirm:
[ Option A ] Use Opus for this time only (recommended, low cost)
[ Option B ] Use Opus for entire session (continuous deep development support)
[ Option C ] Downgrade to Sonnet (quick completion, may lack optimization space)
```

#### Step 3: Handle User Decision

**User chooses A or B**:
- Activate Opus for deep technical analysis
- Provide more complete architecture design and optimization solutions

**User chooses C or refuses**:
- Downgrade to Sonnet processing
- Explain potential impacts:
  - Architecture design may not be elegant enough
  - Performance optimization may not be thorough enough
  - Code scalability may be limited

### Downgrade Impact Description

| Scenario | Opus Advantage | Risk of Downgrading to Sonnet |
|----------|---------------|-------------------------------|
| Architecture Design | Deep system thinking | Architecture may not be sophisticated enough |
| Performance Optimization | Multi-dimensional optimization approaches | Optimization may not be comprehensive enough |
| Complex Logic | Complete implementation solutions | Code may have omissions |
| Technology Selection | Comprehensive solution comparison | Judgment may be biased |

### Usage Principles

- ✅ **Proactive Inquiry** - Must confirm with user first when Opus scenario is identified
- ✅ **Clear Explanation** - Clarify the technical depth difference between two models
- ✅ **Respect Choice** - If user refuses, immediately downgrade, don't insist
- ✅ **Cost Awareness** - Suggest "this time only" rather than "entire session"

---

## 10. Usage Guide

### Simple Tasks
- Use all optimization strategies
- Simplify response format
- Precise tool usage

### Complex Tasks
- Maintain detailed analysis
- Use optimization moderately
- Ensure accurate understanding

### Judgment Criteria
```
Simple: Style modifications, simple bugs, configuration adjustments
Complex: New feature development, architecture adjustments, complex logic
```

---

## Expected Effects

- **Token Savings**: 60% ↓
- **Response Speed**: 40% ↑
- **Code Quality**: Maintain 100%
- **User Experience**: More streamlined information

---

*This optimization method significantly reduces token consumption and improves work efficiency while ensuring code accuracy.*

**Application Guide**: This is version 1.2 of token optimization strategy for the development domain, containing three levels of optimization strategies: basic optimization, model selection, and Task decomposition. It's recommended to start with basic strategies and gradually master advanced techniques.
