# Token Optimization Skills - UI/UX Design Domain

**Version**: v1.2
**Updated**: 2026-02-12
**Author**: Ella
**Optimization Goal**: Reduce design process token usage by 65%+

---

## I. Design Decision Optimization

### 1.1 Design System Priority
**Problem**: Starting design from scratch each time, many tokens used for style exploration
**Solution**:
```bash
# Enable design system recommendations (save 70% exploration tokens)
python3 .agents/skills/ui-ux-pro-max/scripts/search.py "product_type industry keywords" --design-system -p "project_name"
```
**Effect**: Directly get color, font, style recommendations, avoid multiple trial-and-error rounds

### 1.2 Quick User Preference Confirmation
**Problem**: Collecting user preferences through text descriptions, many back-and-forth conversations
**Solution**:
- Generate visual options (SVG preview images)
- 3-5 specific options for selection
- Avoid open-ended questions, use multiple choice instead

**Example**:
```
❌ "What style of buttons do you prefer?"
✅ Generate 5 button style SVG previews for user selection
```

### 1.3 Reference Existing Interfaces
**Problem**: Blindly designing new interface styles
**Solution**:
- First read existing interface screenshots/code
- Maintain style consistency
- Only optimize specific elements, don't restructure entirely

---

## II. Tool Usage Optimization

### 2.1 Icon Acquisition Strategy
**Problem**: Multiple rounds of conversation describing icon requirements
**Solution**:
```bash
# Direct API acquisition, one-time completion
WebFetch: https://api.iconify.design/lucide/icon-name.svg
```
**Savings**: From 5-8 conversation rounds → 1 API call

### 2.2 Batch Design Elements
**Problem**: Designing UI elements one by one
**Solution**:
- Design similar elements at once (all buttons, all icons)
- Single SVG file containing multiple elements
- Reduce file read/write operations

### 2.3 Tool Chain Integration
**Priority Order**:
1. UI/UX Pro Max skill (design system)
2. Iconify API (icons)
3. WebFetch (style reference)
4. Direct SVG writing (simple graphics)

---

## III. Output Format Optimization

### 3.1 Standardized Delivery Documents
**Templated output to reduce repetitive tokens**:

```markdown
# UI Design Delivery - [Project Name]
## I. Design Specifications
| Element | Specification | Color | Size |
## II. Icon Checklist
[SVG code blocks]
## III. Interaction Instructions
[State transitions]
## IV. Development Recommendations
[Technical implementation]
```

### 3.2 SVG Code Optimization
**Problem**: Verbose SVG code consuming tokens
**Solution**:
- Use viewBox for unified sizing
- Reuse definitions (defs, gradients)
- Simplify path data
- Combine related elements

### 3.3 Phased Delivery
**Phase 1**: Core design specifications (colors, fonts, basic components)
**Phase 2**: Specific component design
**Phase 3**: Interaction instructions and development recommendations

---

## IV. Communication Efficiency Optimization

### 4.1 Visual-First Approach
**Principle**: Use images to replace text descriptions
- Button states → SVG preview images
- Layout options → ASCII diagrams
- Color schemes → Color palette displays

### 4.2 Choice Rather Than Creation
**Strategy**: Provide 3-5 mature options for user selection
- Reduce user thinking cost
- Avoid infinite modification cycles
- Based on existing design systems

### 4.3 Technical Constraints Upfront
**Confirm before design**:
- Project technology stack
- Existing component libraries
- Performance requirements
- Compatibility needs

---

## V. Practical Application

### 5.1 Button Icon Design Case Study
**Traditional Process** (estimated 350 tokens):
```
User requirements → Style discussion → Multiple design options → Repeated modifications → Final decision
```

**Optimized Process** (actual 120 tokens):
```
Read existing interface → Direct acquisition of 12 icon options → User selection → Output specifications
```

**Key optimization points**:
- Skip style discussion (reference existing)
- Batch icon design (generate 12 at once)
- Visual selection (SVG preview)

### 5.2 Color Scheme Design
**Before optimization**: Discuss color psychology, brand tone, etc.
**After optimization**: Directly provide 5 color schemes + application effect preview

---

## VI. Token Savings Statistics

| Optimization Item | Savings Ratio | Specific Measures |
|--------|----------|----------|
| Design exploration | 70% | Design system + existing reference |
| Icon acquisition | 85% | Direct API acquisition |
| User communication | 60% | Visual selection |
| Document output | 40% | Templated + batch processing |
| **Comprehensive optimization** | **65%** | **Systematic improvement** |

---

## VII. Model Selection Strategy (v1.2 Addition)

### Basic Model Selection Decision Tree

```
Design Task Assessment
├─ Standardized UI components? → Haiku
├─ Need design professional judgment? → Sonnet
├─ Need creative integration? → Opus (confirm)
└─ Uncertain? → Choose Sonnet (safe choice)
```

### Haiku Applicable Scenarios (30-40% usage rate)
- Standardized icon acquisition and format conversion
- Simple SVG code generation
- Basic color scheme application
- Design document template output
- Simple visual adjustments

### Sonnet Applicable Scenarios (50-60% usage rate)
- UI/UX system design and planning
- Complex component interaction design
- Professional evaluation of design proposals
- User experience optimization recommendations
- Design decisions requiring aesthetic judgment
- Design system establishment and optimization

### Opus Applicable Scenarios (5-10% usage rate, requires confirmation)
- Brand/design system restructuring
- Complex component library design
- Creative style fusion
- Large-scale UI unification optimization

### Quality First Principles

1. **Importance Assessment**: Design impact on user experience > single-time cost savings
2. **Output Quality Requirements**: Choose stronger models for aesthetic and professional needs
3. **User Experience**: User satisfaction and design solution completeness priority
4. **Long-term Benefits**: High-quality design reduces rework, more cost-effective long-term

---

## VIII. Task Multi-Model Optimization Strategy (v1.2 Addition)

### Design Task Decomposition Pattern

#### Three-Stage Decomposition Example
```
Stage 1: Design information collection → Task(model="haiku")
Stage 2: Creative design analysis → Task(model="sonnet")
Stage 3: Design document output → Task(model="haiku")
```

### Actual Case Comparison

**❌ Traditional Method (6000+ tokens)**:
```python
Task(prompt="Design complete UI component library and generate design documentation")
```

**✅ Decomposition Optimization (3200 tokens, 47% savings)**:
```python
Task(model="haiku", prompt="Collect existing design elements and style information")
Task(model="sonnet", prompt="Design core component interaction and visual solutions")
Task(model="haiku", prompt="Format as standardized design delivery documentation")
```

**Savings Principle**:
- Information collection doesn't need design creativity → Haiku sufficient
- Core design maintains professional quality → Sonnet ensures
- Document formatting is purely templated → Haiku adequate

### Task Model Selection Decision Matrix

| Subtask Type | Recommended Model | Token Savings | Quality Impact | Applicable Scenario Examples |
|------------|----------|-----------|----------|--------------|
| Design resource collection/format conversion | Haiku | 70-80% | No impact | Extract design data, format SVG |
| Simple visual adjustments/validation | Haiku | 70-80% | No impact | Color adjustments, size validation |
| Standardized design document generation | Haiku | 70-80% | No impact | Apply templates, format output |
| UI/UX design/interaction design | Sonnet | Baseline | Quality assurance | Component design, interaction solutions |
| Design system/professional evaluation | Sonnet | Baseline | Quality assurance | Design specifications, aesthetic judgment |
| Brand innovation/complex fusion | Opus | -3-5x | Significant improvement | Brand restructuring, creative design |

### Quality Assurance Mechanism

**Core Principle**: Quality first, reasonable optimization

**Quality Assurance Checkpoints**:
1. **Critical design decisions must use Sonnet+**
   - Core designs affecting user experience
   - Visual decisions affecting brand image
   - Complex interaction design solutions

2. **User-facing outputs ensure quality**
   - Final design solutions and delivery documents
   - Design responses to user questions
   - Important design information for team communication

3. **Internal processing steps can be moderately optimized**
   - Intermediate data conversion and formatting
   - Temporary file generation
   - Auxiliary validation

---

## IX. Opus Usage Confirmation Mechanism

### Scenario Description
- **Opus Advantage**: Can provide more sophisticated solutions when handling complex design problems, creative integration, style fusion
- **Necessity Judgment**: Opus needed when design involves overall style innovation, multi-element fusion, high-difficulty aesthetic decisions

### Confirmation Process

#### Step 1: Identify Opus Scenarios
More powerful model needed in following situations:
- Brand/design system restructuring (affects overall visual)
- Complex component library design (involves multiple interaction states)
- Creative style fusion (requires advanced aesthetic judgment)
- Large-scale UI unification optimization (global visual coordination)

#### Step 2: Confirm with User
```
Current design task involves complex style fusion/creative decisions.
Recommend using Opus for more sophisticated design solutions.
Please confirm:
[ Option A ] Use Opus only this time (recommended, low cost)
[ Option B ] Use Opus for entire session (continuous creative support)
[ Option C ] Downgrade to Sonnet (quick completion, possibly conservative solutions)
```

#### Step 3: Handle User Decision

**User chooses A or B**:
- Activate Opus for creative design
- Provide more design variants and innovative solutions

**User chooses C or refuses**:
- Downgrade to Sonnet processing
- Explain possible impacts:
  - Design solutions may be more conservative
  - Creative fusion may not be natural enough
  - Style innovation may be limited

### Downgrade Impact Description

| Scenario | Opus Advantage | Risk of Downgrading to Sonnet |
|------|---------|------------------|
| Brand innovation | Unique creative integration | Solutions may become mundane |
| Style fusion | Subtle and natural fusion | Combinations may be stiff |
| Complex components | Refined interaction design | Details may lack finesse |
| Global unification | Overall aesthetic coordination | Reduced consistency across parts |

### Usage Principles

- ✅ **Proactive Inquiry** - Must confirm with user first when Opus scenario is identified
- ✅ **Clear Explanation** - Clarify design style differences between two models
- ✅ **Respect Choice** - Immediately downgrade if user refuses, don't insist
- ✅ **Cost Awareness** - Recommend "only this time" rather than "entire session"

---

## X. Continuous Optimization

### 10.1 Template Library Development
Establish common design templates:
- Button design specification templates
- Color system templates
- Icon specification templates
- Interaction instruction templates

### 10.2 Tool Chain Improvement
- Integrate more design APIs
- Optimize SVG generation algorithms
- Build design asset library

### 10.3 Feedback Collection
Record token usage for each design task, continuously optimize processes.

---

## Application Guide

### Simple Design Tasks
- Use Haiku for standardized operations
- Simplify response format
- Precise tool usage

### Complex Design Tasks
- Use Sonnet to maintain design quality
- Moderately use Task decomposition optimization
- Ensure creative and aesthetic standards

### Judgment Criteria
```
Simple: Standard UI components, icon acquisition, color adjustments
Complex: New component design, interaction solutions, design system establishment
```

**Expected Effect**: Complete design task token usage from 500+ → 150-200, 65% savings.

---

**Application Guide**: This is Token optimization strategy v1.2 for UI/UX design domain, containing three-layer optimization strategies: basic optimization, model selection, and Task decomposition. Recommend starting with basic strategies and gradually mastering advanced techniques.
