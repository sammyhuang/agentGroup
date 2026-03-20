# Token Optimization Skill - Testing & Acceptance Domain

**Version**: v1.2
**Update Date**: 2026-02-12
**Author**: Kyle
**Optimization Goal**: Reduce token usage in acceptance process by 70%+

---

## Skill Overview

**Skill Name**: Efficient Acceptance and Code Review
**Applicable Scenarios**: Functional acceptance, code review, bug fix verification
**Developer**: Kyle (凯尔) - Quality Assurance Expert

---

## Optimization Strategy Overview

| Strategy | Savings Ratio | Core Method | Implementation Difficulty |
|----------|---------------|-------------|-------------------------|
| Intelligent File Reading | 30% | One-time complete read, avoid repetition | Low |
| Templated Reports | 25% | Standard format, key info prioritized | Low |
| Systematic Verification | 20% | Layered verification, problem-oriented | Medium |
| Focused Code Review | 15% | Risk-driven, highlight priorities | Medium |
| Tool Usage Optimization | 10% | Precise search, combined operations | Low |

**Expected Total Savings**: **70%+**

---

## Strategy 1: Intelligent File Reading 💾

### Core Principle
**Avoid repeated reading, get maximum information at once**

### Before Optimization ❌
```
1. Use Grep to search function locations
2. Read specific line ranges of files
3. Discover need for more context
4. Read again with extended range
5. Repeat above process when needing other functions
```

### After Optimization ✅
```
1. First use Glob to identify key files
2. Read main files completely (e.g., App.vue)
3. Analyze based on complete content
4. Use Grep for precise location + context expansion when needed
```

### Implementation Checklist
- [ ] Identify project core files (usually 1-3)
- [ ] Prioritize complete reading of core files
- [ ] Specify sufficient context when using Grep (-C 10)
- [ ] Batch parallel reading of related files

---

## Strategy 2: Templated Reports 📋

### Core Principle
**Standardize output format, reduce token consumption for generation**

### Quick Summary Template
```markdown
## Acceptance Results
✅ Pass | ❌ Fail | ⚠️ Conditional Pass

**Key Findings**: [1-2 sentences core issues]
**Pass Rate**: X% (Y/Z items)
**Main Issues**: [Most important 1-2 issues]
```

### Checklist Template
```markdown
| Item | Status | Notes |
|------|--------|-------|
| Function1 | ✅ | - |
| Function2 | ❌ | Specific issue |
| Function3 | ⚠️ | Points to note |
```

### Code Review Template
```markdown
**Security**: ✅ No issues | ❌ Found X issues
**Performance**: ✅ Excellent | ⚠️ Can optimize
**Maintainability**: ✅ Good | ❌ Needs refactoring
```

---

## Strategy 3: Systematic Verification 🔄

### Core Principle
**Layered verification in sequence, reduce exploratory operations**

### Verification Hierarchy
1. **Architecture Layer**: Overall structure, tech stack, dependencies
2. **Function Layer**: Core functionality, business logic, user interaction
3. **Implementation Layer**: Code quality, performance, security
4. **Boundary Layer**: Error handling, boundary conditions, compatibility

### Problem-Oriented Checklists

#### Functional Acceptance Checklist
```markdown
- [ ] Do core functions work as expected?
- [ ] Are user interactions smooth?
- [ ] Are error scenarios handled properly?
- [ ] Does performance meet requirements?
```

#### Bug Fix Verification Checklist
```markdown
- [ ] Is the original issue completely resolved?
- [ ] Does the fix introduce new problems?
- [ ] Are related functions working normally?
- [ ] Is the fix approach reasonable?
```

#### Code Review Checklist
```markdown
- [ ] Are there obvious security vulnerabilities?
- [ ] Are there obvious performance issues?
- [ ] Is the code structure reasonable?
- [ ] Is error handling comprehensive?
```

---

## Strategy 4: Focused Code Review 🎯

### Core Principle
**Risk-driven review, highlight key issues**

### SPAR Review Principles
- **Security**: XSS, injection, permission control
- **Performance**: Memory leaks, redundant calculations, large data processing
- **Architecture**: Code structure, coupling, scalability
- **Reliability**: Error handling, boundary conditions, exception scenarios

### Risk-Level Review
```
🔴 High Risk (Deep Review):
- User input processing
- Permission verification logic
- Database operations
- External API calls

🟡 Medium Risk (Focus Attention):
- State management
- Event handling
- Async operations
- Business logic

🟢 Low Risk (Quick Scan):
- UI styling
- Static content
- Utility functions
- Configuration files
```

### Quick Issue Identification Patterns
```javascript
// 🔴 Security Risk Patterns
innerHTML, eval(), document.write()

// 🔴 Performance Issue Patterns
Infinite loops, memory leaks, synchronous blocking

// 🔴 Logic Error Patterns
Null reference, type errors, boundary overflow
```

---

## Strategy 5: Tool Usage Optimization 🛠️

### Core Principle
**Precise and efficient tool usage, avoid repetitive operations**

### Task Tool Optimization
```markdown
# Specify appropriate thoroughness level
Task(subagent_type="Explore", thoroughness="quick")     # Quick overview
Task(subagent_type="Explore", thoroughness="medium")    # Standard exploration
Task(subagent_type="Explore", thoroughness="thorough")  # Deep analysis
```

### Search Combination Strategy
```markdown
# Combination 1: Quick file location
Glob("**/*Button*.{js,vue,ts}") + Read(found key files)

# Combination 2: Precise content search
Grep(pattern="function.*Button", output_mode="files") +
Grep(pattern="function.*Button", output_mode="content", -C=10)

# Combination 3: Parallel operations
Parallel execution: Read(file1) + Read(file2) + Grep(pattern)
```

### Precise Search Patterns
```markdown
# Function definitions
Grep("function\s+\w+|const\s+\w+\s*=.*=>")

# Error handling
Grep("try\s*\{|catch\s*\(|throw\s+")

# State management
Grep("useState|useEffect|reactive|ref\(")

# Security related
Grep("innerHTML|eval\(|document\.write")
```

---

## Complete Optimization Workflow 🚀

### Phase 1: Quick Overview (5 tokens)
```markdown
1. Use Task(Explore, quick) to understand project structure
2. Identify core files and key components
3. Determine acceptance scope and priorities
```

### Phase 2: Systematic Verification (15 tokens)
```markdown
1. Complete reading of 1-2 core files
2. Check by layered verification checklist
3. Use parallel operations to verify multiple points
```

### Phase 3: Focused Review (10 tokens)
```markdown
1. Review key code according to SPAR principles
2. Use problem patterns to quickly identify risks
3. Record important findings and recommendations
```

### Phase 4: Quick Reporting (5 tokens)
```markdown
1. Use templates to generate acceptance results
2. Priority information first, details optional
3. Output standardized checklists
```

**Total ~35 tokens vs original 120+ tokens = 70%+ savings**

---

## Model Selection Strategy (v1.2 Addition)

### Basic Model Selection Decision Tree

```
Acceptance Task Assessment
├─ Standardized check? → Haiku
├─ Need professional judgment? → Sonnet
├─ Need deep diagnosis? → Opus (confirmation)
└─ Uncertain? → Choose Sonnet (safe choice)
```

### Haiku Use Cases (30-40% usage rate)
- Standardized format checking and verification
- Simple function test confirmation
- Basic configuration verification
- Templated report generation
- Simple code scanning

### Sonnet Use Cases (50-60% usage rate)
- Systematic functional acceptance
- Code quality review (SPAR)
- Bug fix verification
- Risk assessment and problem diagnosis
- Acceptance tasks requiring professional judgment

### Opus Use Cases (5-10% usage rate, needs confirmation)
- Complex bug diagnosis and root cause analysis
- System quality assessment
- Performance issue deep analysis
- Difficult problem solving and breakthrough

### Quality-First Principles

1. **Importance Assessment**: Quality risk impact on project > single-time cost savings
2. **Output Quality Requirements**: Choose stronger model for deep analysis needs
3. **User Experience**: Acceptance accuracy and problem discovery rate priority
4. **Long-term Benefits**: Good quality acceptance reduces rework, saves more cost long-term

---

## Task Multi-Model Optimization Strategy (v1.2 Addition)

### Acceptance Task Decomposition Pattern

#### Three-Stage Decomposition Example
```
Stage 1: Information collection and quick scan → Task(model="haiku")
Stage 2: Professional acceptance and problem diagnosis → Task(model="sonnet")
Stage 3: Report generation and formatting → Task(model="haiku")
```

### Real Case Comparison

**❌ Traditional Approach (6000+ tokens)**:
```python
Task(prompt="Complete acceptance of system functionality and generate detailed report")
```

**✅ Decomposed Optimization (3200 tokens, 47% savings)**:
```python
Task(model="haiku", prompt="Quick scan of project structure and key files")
Task(model="sonnet", prompt="Systematic acceptance of core functionality and code quality")
Task(model="haiku", prompt="Format into standardized acceptance report")
```

**Savings Principle**:
- Information collection and scanning don't need deep analysis → Haiku sufficient
- Core acceptance maintains professional quality → Sonnet guaranteed
- Report formatting is purely templated → Haiku adequate

### Task Model Selection Decision Matrix

| Subtask Type | Recommended Model | Token Savings | Quality Impact | Use Case Examples |
|-------------|------------------|---------------|----------------|-------------------|
| Information collection/Quick scan | Haiku | 70-80% | No impact | File lists, basic checks |
| Simple validation/Format check | Haiku | 70-80% | No impact | Format validation, config check |
| Standardized report generation | Haiku | 70-80% | No impact | Template application, formatting |
| Function acceptance/Code review | Sonnet | Baseline | Quality guarantee | SPAR review, problem diagnosis |
| System assessment/Professional judgment | Sonnet | Baseline | Quality guarantee | Risk assessment, quality judgment |
| Complex diagnosis/Deep analysis | Opus | -3-5x | Significant improvement | Root cause analysis, system assessment |

### Quality Assurance Mechanism

**Core Principle**: Quality first, reasonable optimization

**Quality Assurance Checkpoints**:
1. **Critical quality acceptance must use Sonnet+**
   - Acceptance involving core functions
   - Security-related code review
   - Complex problem diagnosis

2. **User-direct interaction outputs guarantee quality**
   - Acceptance conclusions and recommendations
   - Problem analysis and solutions
   - Quality assessment reports

3. **Internal processing steps can be moderately optimized**
   - Information collection and organization
   - Simple format checking
   - Report formatting

---

## Opus Usage Confirmation Mechanism

### Scenario Description
- **Opus Advantages**: Can provide deeper analysis when handling complex quality issues, systematic risk assessment, and difficult problem diagnosis
- **Necessity Judgment**: Opus is needed when acceptance involves complex problem diagnosis, systematic quality assessment, and multi-level risk analysis

### Confirmation Process

#### Step 1: Identify Opus Scenarios
Use more powerful model in the following situations:
- Complex bug diagnosis and root cause analysis (multi-layer causal relationships)
- System quality assessment (comprehensive multi-dimensional risk evaluation)
- Performance issue deep analysis (involving complex optimization directions)
- Difficult problem solving and breakthrough (requiring creative testing approaches)

#### Step 2: User Confirmation
```
Detected that current acceptance task involves complex problem diagnosis/quality assessment.
Recommend using Opus for deeper analysis and risk assessment.
Please confirm:
[ Option A ] Use Opus for this acceptance only (recommended, low cost)
[ Option B ] Use Opus for entire session (continuous deep acceptance support)
[ Option C ] Downgrade to Sonnet (quick completion, may lack deep risk identification)
```

#### Step 3: Handle User Decision

**User chooses A or B**:
- Activate Opus for deep quality analysis
- Provide more comprehensive risk assessment and recommendations

**User chooses C or refuses**:
- Downgrade to Sonnet processing
- Explain potential impacts:
  - Problem diagnosis may not be deep enough
  - Hidden risks may be missed
  - Quality assessment may not be comprehensive enough

### Downgrade Impact Description

| Scenario | Opus Advantage | Risk of Downgrading to Sonnet |
|----------|---------------|-------------------------------|
| Bug Diagnosis | Deep root cause analysis | May not find true cause |
| System Assessment | Multi-dimensional risk identification | May miss hidden risks |
| Performance Analysis | Complete optimization directions | Optimization direction may be partial |
| Problem Breakthrough | Creative solution approaches | May get stuck in deadlock |

### Usage Principles

- ✅ **Proactive Inquiry** - Must confirm with user first when Opus scenario is identified
- ✅ **Clear Explanation** - Clarify the diagnostic depth difference between two models
- ✅ **Respect Choice** - If user refuses, immediately downgrade, don't insist
- ✅ **Cost Awareness** - Suggest "this time only" rather than "entire session"

---

## Practical Case Comparison

### Case 1: AI Debt Assistant Button Icon Acceptance

#### Pre-Optimization Process (120 tokens)
1. Read design documents (20 tokens)
2. Task tool project exploration (25 tokens)
3. Read and verify buttons individually (35 tokens)
4. Detailed code review (25 tokens)
5. Generate detailed report (15 tokens)

#### Post-Optimization Process (35 tokens)
1. Quick exploration + complete read App.vue (15 tokens)
2. Systematic verification of all buttons (10 tokens)
3. SPAR focused review of key code (5 tokens)
4. Templated quick report (5 tokens)

**Savings**: 85 tokens (**71%** ⬇️)

### Case 2: Bug Fix Acceptance

#### Pre-Optimization Process (95 tokens)
1. Multiple fragmented reads of fix code (30 tokens)
2. Detailed functional verification (25 tokens)
3. Comprehensive code quality review (25 tokens)
4. Generate detailed acceptance report (15 tokens)

#### Post-Optimization Process (28 tokens)
1. Complete read + Grep precise location (12 tokens)
2. Systematic functional verification (8 tokens)
3. SPAR risk-focused review (5 tokens)
4. Templated quick report (3 tokens)

**Savings**: 67 tokens (**71%** ⬇️)

---

## Effect Estimation and Monitoring

### Expected Savings Effects
- **Overall Savings**: 70%+ token consumption
- **Time Savings**: 50%+ acceptance time
- **Quality Maintenance**: 95%+ problem discovery rate
- **Report Efficiency**: 80%+ generation speed improvement

### Monitoring Metrics
```markdown
Record for each acceptance:
- Token consumption amount
- Number of problems found
- Acceptance time
- Report satisfaction level
```

### Continuous Optimization
- Monthly review of optimization effects
- Adjust strategy based on actual usage
- Update checklists and templates
- Share best practice cases

---

## FAQ

**Q: Will it affect acceptance quality?**
A: No. Focusing on key points actually improves quality and avoids distraction from details.

**Q: Will templating be too rigid?**
A: Templates are basic frameworks that can be flexibly adjusted based on specific situations.

**Q: How to handle complex projects?**
A: Complex projects need systematic methods even more; can increase thoroughness level.

**Q: How can other team members learn?**
A: Provide checklists and templates, transfer experience through practical demonstrations.

---

## Summary

This token optimization skill achieves 70%+ token savings in the testing and acceptance domain through five major strategies: **Intelligent File Reading**, **Templated Reports**, **Systematic Verification**, **Focused Code Review**, and **Tool Usage Optimization**, while maintaining high-quality acceptance standards.

**Core Concept**: **Systematization + Standardization + Focus = Efficiency**

The key is to **avoid perfectionism**, focus on the most important quality risks, use standardized methods to improve efficiency, making acceptance both fast and accurate.

**Application Guide**: This is version 1.2 of token optimization strategy for the testing and acceptance domain, containing three levels of optimization strategies: basic optimization, model selection, and Task decomposition. It's recommended to start with basic strategies and gradually master advanced techniques.
