# Project Management Token Optimization Skill

**Author**: Max - Project Manager
**Version**: v1.2
**Update Date**: 2026-02-12
**Savings Rate**: ~67-85% (through Task multi-model optimization strategy)
**Based on**: Practical experience summary from AI Debt Assistant project
**v1.1 Update**: Added model selection experience summary chapter, based on selection errors and corrections in actual use
**v1.2 Update**: Added Task multi-model optimization strategy, achieving fine-grained cost control and task decomposition optimization

## Optimization Principles

1. **Structured Information Storage** - Use data instead of descriptions
2. **Standardized Status Management** - Reduce redundant queries
3. **Precise Task Assignment** - Clarify requirements all at once
4. **Preset Permission Management** - Avoid repeated confirmations

---

## Core Optimization Strategies

### 1. Status Management Optimization ⭐⭐⭐

**Traditional Method** (High consumption):
```
Max: What is Ella working on now?
System: Querying Ella's status...
Max: Has Ella's task been completed?
System: Checking task status...
Max: How is Jarvis's progress?
```

**Optimized Method** (Save 70%):
```json
// Direct read of status.json
{
  "current_task": "AI Debt Assistant - Bug Fix",
  "notifications": [...],
  "completed_tasks": [...]
}
```

**Implementation**:
- Read `status.json` at startup to get global status
- Use structured JSON instead of natural language queries
- Update files directly for status changes, no multi-round dialogues needed

### 2. Standardized Task Assignment ⭐⭐⭐

**Traditional Method**:
```
User: Have Jarvis fix this bug
Max: What bug? In which file? Specific symptoms?
User: [Explanation...]
Max: Jarvis, do you understand the requirements?
Jarvis: I need more details...
```

**Optimized Method**:
```json
{
  "to": "Jarvis",
  "task": "Bug Fix",
  "details": {
    "file": "frontend/src/App.vue",
    "issues": [
      {
        "id": 1,
        "title": "Speech recognition failure handling error",
        "current_behavior": "...",
        "expected_behavior": "...",
        "hint": "Check recognizeSpeech function"
      }
    ]
  }
}
```

**Savings Points**:
- Provide complete context all at once
- Structured problem description
- Preset solution clues

### 3. Permission Pre-authorization ⭐⭐

**Traditional Method**:
```
Max: Can I update status.json?
User: Yes
Max: Can I record this bug?
User: Yes
```

**Optimized Method**:
```
// Preset in CLAUDE.md:
## User Authorization (Important)
Following operations have permanent authorization, execute directly:
- Update project status (status.json)
- Record bugs and issues
- Notify team members
```

**Savings**: Save 2-3 rounds of confirmation dialogue per operation

### 4. Problem Recording Templating ⭐⭐

**Traditional Method**:
```
User: The play button has issues
Max: What issues?
User: It restarts after pause
Max: What's the expected behavior?
User: Should continue playing
```

**Optimized Template**:
```json
{
  "id": 2,
  "title": "Play button status issue",
  "severity": "Critical",
  "current_behavior": "Restarts from beginning after pause then play",
  "expected_behavior": "Should continue from pause position when clicked after pause",
  "hint": "Check toggleAudioPlay function status synchronization"
}
```

### 5. Notification Batch Processing ⭐⭐

**Traditional Method**:
```
Max: Notify Ella...
Max: Then notify Kyle...
Max: Send a desktop notification...
```

**Optimized Method**:
```json
// Update status.json once with all notifications
{
  "notifications": [
    {"to": "Ella", "task": "..."},
    {"to": "Kyle", "task": "..."}
  ]
}
// + one desktop notification
```

---

## Specific Execution Skills

### At Startup
1. Read `status.json` to get complete status
2. Read `todos.md` to understand pending items
3. Output status summary, don't ask for details

### During Task Assignment
1. Use JSON to structure task details
2. Include file paths, specific issues, expected results
3. Provide solution hints
4. Send complete information all at once

### During Status Updates
1. Operate files directly, don't ask for permissions
2. Use structured data instead of natural language
3. Batch update related statuses

### During Problem Recording
1. Use preset templates to collect information
2. Classify markings (Critical/General/Minor)
3. Include specific locations and solution clues

---

## Token Waste Behaviors to Avoid

❌ **Repeated Permission Requests**: "Can I update status?"
❌ **Multiple Confirmations**: "Do you mean this?"
❌ **Redundant Queries**: "What's the current progress?"
❌ **Vague Tasks**: "Have XX handle this problem"
❌ **Verbose Descriptions**: Using lengthy text to explain simple concepts

✅ **Direct Execution**: Operate directly based on pre-authorization
✅ **Structured Information**: Use data instead of dialogue
✅ **Precise Tasks**: Task descriptions containing complete context
✅ **Batch Operations**: Handle multiple related tasks all at once

---

## Effectiveness Statistics

Based on AI Debt Assistant project:

| Scenario | Traditional Token Consumption | Optimized Consumption | Savings Rate |
|----------|------------------------------|----------------------|-------------|
| Status Queries | ~200 tokens | ~50 tokens | 75% |
| Task Assignment | ~300 tokens | ~80 tokens | 73% |
| Problem Recording | ~250 tokens | ~70 tokens | 72% |
| Permission Confirmation | ~100 tokens | ~0 tokens | 100% |
| **Average** | | | **75%** |

---

**Application Guide**: Next time executing project management tasks, strictly follow this Skill, expected to save 75% of Token consumption.

---

## Opus Usage Confirmation Mechanism

### Scenario Description
- **Opus Advantages**: Higher token efficiency when handling complex analysis, multi-angle comprehensive judgment, and high-difficulty problems
- **Necessity Assessment**: Opus needed when tasks involve global strategic analysis, risk assessment, major decision recommendations

### Confirmation Process

#### Step 1: Identify Opus Scenarios
More powerful model needed in following situations:
- Comprehensive project risk assessment (involving multiple dimensions)
- Strategic decision recommendations (affecting project direction)
- System analysis of complex problems (requiring deep thinking)
- Overall coordination of multiple projects (global perspective)

#### Step 2: User Confirmation
```
Found current task suitable for Opus deep analysis.
Please confirm:
[ Option A ] Use Opus for this task only (recommended, low cost)
[ Option B ] Use Opus for entire session (continuous deep support)
[ Option C ] Downgrade to Sonnet (quick completion, may lack depth)
```

#### Step 3: Handle User Decisions

**User chooses A or B**:
- Activate Opus for the task
- Output deeper analysis and recommendations

**User chooses C or refuses**:
- Downgrade to Sonnet processing
- Explain possible impacts:
  - Analysis depth may not be comprehensive enough
  - Risk warnings may not be sharp enough
  - Recommendations may have reduced targeting

### Downgrade Impact Explanation

| Scenario | Opus Advantages | Risk of Downgrading to Sonnet |
|----------|-----------------|-------------------------------|
| Risk Assessment | Multi-dimensional deep analysis | May miss hidden risks |
| Strategic Recommendations | Systematic thinking | Recommendations may be one-sided |
| Complex Problems | Complete logical chains | Solutions may be incomplete |
| Multi-project Coordination | Global optimization perspective | Optimization space may be insufficient |

### Usage Principles

- ✅ **Proactive Inquiry** - Must confirm with user first when Opus scenario is identified
- ✅ **Clear Explanation** - Clearly explain differences between two models and risks of choosing C
- ✅ **Respect Choice** - Immediately downgrade if user refuses, don't insist
- ✅ **Cost Awareness** - Suggest "this time only" rather than "entire session"

### Example Dialogue

**Scenario: User requests comprehensive project risk assessment**

```
Max: Detected need for comprehensive project risk assessment (involving design, development, testing, progress and other dimensions).
This type of deep analysis recommends using Opus model, which can provide more complete systematic assessment and prevention recommendations.

Your choice:
A. Use Opus for this analysis only (recommended)
B. Use Opus for entire session
C. Use Sonnet for quick completion (risk: may miss important hazards)

Please tell me your choice.
```

**After user chooses A:**
```
Switched to Opus, executing deep risk assessment...

[Conduct detailed multi-dimensional analysis]
```

**After user chooses C:**
```
Downgraded to Sonnet processing.
Reminder: This mode may not identify all hidden risks,
recommend using Opus for verification before critical decisions.
```

---

## Model Selection Experience Summary (v1.1 Update)

### Common Selection Errors and Corrections

#### Error 1: Overly Conservative Haiku Selection
**Manifestation**: Using Haiku for medium-complexity tasks to save costs
**Consequences**: Output quality decline, user experience affected, problem solving not thorough enough
**Correction**: Re-evaluate task complexity, quality priority over cost

#### Error 2: Task Complexity Assessment Too Low
**Manifestation**: Complex tasks like system design, professional consulting treated as "simple tasks"
**Correction Standard**: Tasks requiring professional knowledge, logical analysis, systematic thinking are medium complexity

#### Error 3: Excessive Cost Anxiety
**Manifestation**: Forming habitual thinking of "default to Haiku"
**Correction**: Establish quality-oriented selection standards, reasonable distribution of model usage

### Corrected Model Selection Standards

#### Haiku Applicable Scenarios (30-40% usage rate)
- Standardized file operations (read/write, copy, move)
- Simple text replacement and formatting
- Basic configuration file generation (.gitignore, LICENSE)
- Standard Git operations (add, commit, push)
- Simple information queries and data extraction

#### Sonnet Applicable Scenarios (50-60% usage rate)
- System architecture and process design
- Professional domain consulting (legal, security, technology selection)
- Complex document analysis and organization
- Strategy formulation and experience summary
- Tasks requiring contextual understanding and logical analysis
- Workflow optimization and improvement

#### Opus Applicable Scenarios (5-10% usage rate, requires confirmation)
- Strategic-level decision support
- Complex technical architecture design
- Innovative solutions and breakthrough approaches
- Multi-dimensional deep analysis

### Quality First Principles

1. **Importance Assessment**: Task's impact on project > single-time cost savings
2. **Output Quality Requirements**: Choose stronger models when accuracy and depth needed
3. **User Experience**: User satisfaction and solution completeness priority
4. **Long-term Benefits**: Quality solutions reduce rework, more cost-effective long-term

### Practice Guidelines

#### Selection Decision Tree
```
Task Assessment
├─ Standardized operations? → Haiku
├─ Requires professional knowledge? → Sonnet
├─ Requires deep innovation? → Opus (confirm)
└─ Uncertain? → Choose Sonnet (safe choice)
```

#### Monthly Model Distribution Target
- Haiku: 30-40% (truly simple tasks)
- Sonnet: 50-60% (main workhorse model)
- Opus: 5-10% (critical tasks)

#### Continuous Improvement
- Monthly review of model selection effectiveness
- Collect user feedback on output quality
- Adjust selection criteria based on actual results
- Avoid extremes (all Haiku or all Sonnet)

---

## Task Tool Multi-Model Selection Strategy (Advanced Optimization Techniques)

### Optimization Potential: Task vs Direct Tool Calls

#### Direct Tool Call Limitations
- **Read/Write/Edit/Bash tools have no model selection parameters**
  - Usually billed by default model, cannot fine-tune optimization
  - Suitable for simple, clear single-step operations
  - Cannot adjust resource consumption based on complexity

#### Task Tool Advantages
- **Can precisely specify model="haiku/sonnet/opus"**
  - Supports decomposition optimization of complex tasks
  - Choose most suitable model based on subtask characteristics
  - Achieve fine-grained cost control

### Complex Task Decomposition Optimization Patterns

#### Three-Stage Decomposition Pattern
```
Stage 1: Information Collection → Task(model="haiku")
Stage 2: Logical Analysis → Task(model="sonnet")
Stage 3: Result Output → Task(model="haiku")
```

#### Actual Case Comparison

**❌ Traditional Method (8000+ tokens)**:
```python
Task(prompt="Analyze system architecture and generate optimization report")
```

**✅ Decomposition Optimization (4500 tokens, save 44%)**:
```python
Task(model="haiku", prompt="Extract architecture components and tech stack info")
Task(model="sonnet", prompt="Analyze architecture problems and improvement opportunities")
Task(model="haiku", prompt="Format into standardized report")
```

**Savings Principle**:
- Information extraction doesn't need deep analysis capability → Haiku sufficient
- Core analysis maintains quality → Sonnet guarantees
- Formatting is purely templated → Haiku adequate

### Differentiated Selection for Parallel Tasks

#### Strategy Description
Choose models independently based on each subtask's complexity, different tasks can simultaneously use different models.

#### Practical Example: Team Configuration Task

**Scenario**: Configure work environment for 4 team members

**❌ Traditional Method**:
```python
# All use Sonnet, excessive consumption
Task(model="sonnet", prompt="Update Max's configuration")
Task(model="sonnet", prompt="Update Ella's configuration")
Task(model="sonnet", prompt="Update Jarvis's configuration")
Task(model="sonnet", prompt="Update Kyle's configuration")
```

**✅ Differentiated Selection**:
```python
# Launch simultaneously, different models
Task(model="haiku", prompt="Update member A's standard config")    # Simple repetition
Task(model="haiku", prompt="Update member B's standard config")    # Simple repetition
Task(model="sonnet", prompt="Design team collaboration workflow")   # Complex design
Task(model="haiku", prompt="Verify configuration consistency")      # Simple check
```

**Savings Effect**: Approximately 60% Token consumption

### Task Model Selection Decision Matrix

| Subtask Type | Recommended Model | Token Savings | Quality Impact | Example Scenarios |
|--------------|------------------|---------------|----------------|-------------------|
| Data extraction/format conversion | Haiku | 70-80% | No impact | Extract JSON data, format text |
| Simple validation/checking | Haiku | 70-80% | No impact | Check config consistency, validate format |
| Standardized document generation | Haiku | 70-80% | No impact | Apply templates, format reports |
| Logic analysis/strategy development | Sonnet | Baseline | Ensure quality | Problem diagnosis, solution design |
| System design/professional consulting | Sonnet | Baseline | Ensure quality | Architecture design, technology selection |
| Complex innovation/strategic decisions | Opus | -3-5x | Significant improvement | Major architecture decisions, innovative solutions |

### Best Practice Guidelines

#### 1. Task Decomposition Principles
- **Identify independent subtasks**: Find independent parts that can be executed in parallel
- **Assess complexity**: Independently assess complexity for each subtask
- **Prioritize decomposing large tasks**: Larger tasks yield higher decomposition benefits

**Example**:
```
User request: "Set up complete development environment for new project and provide technical recommendations"

❌ Single task: Task("setup environment + tech recommendations") → 12000 tokens

✅ Decomposition:
- Task(haiku, "Create project directory structure") → 500 tokens
- Task(haiku, "Configure package.json") → 600 tokens
- Task(haiku, "Set up .gitignore and basic configs") → 400 tokens
- Task(sonnet, "Analyze project requirements and provide tech selection advice") → 3000 tokens
Total → 4500 tokens, save 62%
```

#### 2. Model Selection Strategy

**Decision Flowchart**:
```
Task Assessment
├─ Pure information processing? (extract/format/validate)
│  └─ Haiku
├─ Requires logical analysis? (problem diagnosis/solution design)
│  └─ Sonnet
├─ Requires deep innovation? (strategic decisions/architecture design)
│  └─ Opus (requires user confirmation)
└─ Uncertain complexity?
   └─ Conservative choice: Sonnet
```

**Selection Principles**:
- **Information Processing** → Haiku
  - Read files and extract data
  - Format conversion (JSON/YAML/Markdown)
  - Simple validation (format checking, consistency checking)

- **Logical Analysis** → Sonnet
  - Problem diagnosis and root cause analysis
  - Solution design and technology selection
  - Code review and optimization recommendations

- **Innovation Design** → Opus (requires confirmation)
  - Major system architecture design
  - Strategic-level decision support
  - Breakthrough solutions

#### 3. Quality Assurance Mechanism

**Core Principle**: Quality first, reasonable optimization

**Quality Assurance Checkpoints**:
1. **Critical business logic must use Sonnet+**
   - Design involving core product functionality
   - Key decisions affecting user experience
   - Content with legal/security risks

2. **Ensure quality for direct user interaction outputs**
   - Final reports, recommendation documents
   - Responses to user questions
   - Important team communication information

3. **Internal processing steps can be moderately optimized**
   - Intermediate data conversion
   - Temporary file generation
   - Auxiliary validation

**Error Example**:
```python
❌ Over-optimization leading to quality decline
Task(haiku, "Analyze system security vulnerabilities and provide fix solutions")
# Security issues need deep analysis, Haiku insufficient

✅ Correct approach
Task(sonnet, "Analyze system security vulnerabilities and provide fix solutions")
# Use Sonnet for security issues to ensure quality
```

#### 4. Effectiveness Monitoring and Iteration

**Establish monitoring mechanism**:
1. **Record token consumption comparison before/after decomposition**
   ```
   Task: Generate project report
   Traditional method: 8000 tokens
   Decomposition optimization: 4200 tokens (save 47%)
   Quality assessment: User satisfied
   ```

2. **Monitor output quality and user satisfaction**
   - User feedback collection
   - Rework frequency statistics
   - Output accuracy assessment

3. **Establish best practice templates for task types**
   ```
   Template name: "System Architecture Analysis Report"
   Standard decomposition:
   1. Haiku: Collect component info (500 tokens)
   2. Sonnet: Analyze problems and opportunities (2500 tokens)
   3. Haiku: Format report (400 tokens)
   Total: 3400 tokens
   Savings rate: 65%
   ```

### Expected Optimization Effects

#### Token Savings Potential

| Task Complexity | Optimization Space | Expected Savings | Quality Assurance |
|-----------------|-------------------|------------------|-------------------|
| Simple Task (single-step operation) | No additional space | 0% | Already optimal |
| Medium Complex Task (3-5 steps) | Medium | 30-50% | Core steps maintain quality |
| High Complex Task (5+ steps) | Very large | 50-70% | Key steps maintain quality |

#### Actual Case Verification

**Case 1: Project Initialization**
```
Task: Create new project and configure development environment
Traditional: Task(sonnet, "full process handling") = 10000 tokens
Optimized:
- Task(haiku, "create directories") = 500 tokens
- Task(haiku, "generate config files") = 600 tokens
- Task(sonnet, "design project architecture") = 2800 tokens
- Task(haiku, "verify environment") = 400 tokens
Optimized total = 4300 tokens
Savings rate: 57%
Quality: Architecture design quality maintained, user satisfied
```

**Case 2: Team Status Report**
```
Task: Generate team weekly report
Traditional: Task(sonnet, "full process handling") = 6000 tokens
Optimized:
- Task(haiku, "read status.json") = 300 tokens
- Task(haiku, "extract member data") = 400 tokens
- Task(sonnet, "analyze progress and risks") = 2000 tokens
- Task(haiku, "format report") = 500 tokens
Optimized total = 3200 tokens
Savings rate: 47%
Quality: Analysis quality maintained, format standardized
```

### Quality Assurance Commitment

**Core Principles**:
- ✅ Core logic uses Sonnet+ to ensure quality
- ✅ Auxiliary processing uses Haiku to improve efficiency
- ✅ Overall solution quality does not decline
- ✅ User satisfaction prioritized over cost savings

**Reasons quality won't decline**:
1. Key analysis steps still use Sonnet/Opus
2. Only simple information processing uses Haiku
3. Task decomposition itself improves process clarity
4. Continuous quality monitoring and strategy adjustment

---

**Application Guide**: This is an advanced optimization technique for Task tool usage, recommended to apply after familiarizing with basic model selection. Initially try simple 2-3 step decomposition, then handle complex tasks after accumulating experience.

**Warning**: Don't over-decompose tasks just for optimization, maintain reasonable task granularity. If coordination costs after decomposition exceed Token savings, it's not worth decomposing.