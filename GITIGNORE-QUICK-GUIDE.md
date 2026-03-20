# .gitignore Quick Operation Guide

**Execute Immediately**: Clean up existing issues | **Complete in 5 minutes**

---

## 🔴 Immediate Action: Clean up existing system files

### Step 1: Remove tracked system files from Git

```bash
cd /Users/yuhao/Desktop/yezannnnn/aiGroup

# Remove incorrectly tracked .DS_Store files (keep local files)
git rm --cached shared/.DS_Store
git rm --cached shared/designs/.DS_Store
```

### Step 2: Verify rules take effect

```bash
# Verify .DS_Store will be ignored
git check-ignore -v shared/.DS_Store
git check-ignore -v shared/designs/.DS_Store

# Should output something like:
# .gitignore:37:shared/**/.DS_Store
```

### Step 3: Commit changes

```bash
git add .gitignore

git commit -m "$(cat <<'EOF'
chore: optimize .gitignore and remove tracked system files

- Remove shared/.DS_Store and shared/designs/.DS_Store from version control
- Add comprehensive .gitignore rules (v2.0):
  * Enhanced system file filtering (macOS/Windows/Linux)
  * Editor and IDE configuration protection
  * Design file management (prevent .psd, .ai, .fig uploads)
  * Python and Node.js cache optimization
- Add gitignore-strategy.md for team reference

Co-Authored-By: Claude Sonnet 4 <noreply@anthropic.com>
EOF
)"
```

### Step 4: Verify results

```bash
# Check Git status (should be clean)
git status

# Verify system files are no longer tracked
git ls-files | grep ".DS_Store"
# Should have no output
```

---

## 🧹 Optional: Clean up all local .DS_Store files

```bash
# Find all .DS_Store files
find /Users/yuhao/Desktop/yezannnnn/aiGroup -name ".DS_Store" -type f

# Delete all .DS_Store files
find /Users/yuhao/Desktop/yezannnnn/aiGroup -name ".DS_Store" -type f -delete

# Verify cleanup
find /Users/yuhao/Desktop/yezannnnn/aiGroup -name ".DS_Store" -type f
# Should have no output
```

---

## ✅ Commit Standards (Daily Usage)

### Files That Should Be Committed

```bash
# ✅ Documentation and configuration
git add *.md
git add *.json
git add *.yaml

# ✅ Design specifications and vector graphics
git add shared/designs/*.md
git add shared/designs/*.svg

# ✅ Small preview images (following naming convention)
git add shared/designs/preview-*.png
git add shared/designs/icon-*.png
```

### Files That Should Never Be Committed

```bash
# ❌ These will be automatically ignored by .gitignore
.DS_Store           # System files
*.log               # Log files
.env                # Sensitive configuration
node_modules/       # Dependency directories
__pycache__/        # Python cache
*.psd               # Large design source files
*.ai                # Adobe Illustrator files
*.fig               # Figma files
```

---

## 🎨 Design File Submission Workflow (For Ella)

### Scenario 1: Submitting icon design

```bash
# 1. Export to SVG format
# 2. Submit to Git
git add shared/designs/icon-name.svg
git add shared/designs/icon-spec.md
git commit -m "design: add new icon for feature X"
```

### Scenario 2: Submitting UI design specifications

```bash
# 1. Write design specification .md
# 2. Export small preview image (<200KB, named preview-*.png)
git add shared/designs/ui-spec.md
git add shared/designs/preview-ui.png
git commit -m "design: add UI specification for dashboard"

# 3. Save source files to Figma Cloud / Adobe CC
```

### Scenario 3: Large design source files

```markdown
**Do NOT commit .psd, .ai, .fig files!**

Correct approach:
1. Save source files to cloud (Figma / Adobe CC)
2. Add links in design specification document:
   - Figma link: https://figma.com/file/...
   - Preview image: see preview-dashboard.png
3. Only commit documentation and preview images
```

---

## 🔍 Pre-commit Checklist

```bash
# 1. View files to be committed
git status

# 2. Check file sizes (ensure no large files)
git diff --cached --stat

# 3. Preview changes
git diff --cached

# 4. Confirm no system files
git status | grep -E "\.(DS_Store|log|tmp)$"
# Should have no output

# 5. Commit
git commit -m "your message"
```

---

## 🛠️ Common Issues Quick Fix

### Issue 1: "I accidentally committed .DS_Store"

```bash
# Remove from Git (keep local)
git rm --cached .DS_Store
git commit -m "chore: remove .DS_Store"
```

### Issue 2: "Rules not taking effect"

```bash
# File might already be tracked, need to remove first
git rm --cached <file>

# Verify rules
git check-ignore -v <file>
```

### Issue 3: "I'm not sure if I should commit a certain file"

```bash
# Check if file will be ignored
git check-ignore -v <file>

# If outputs rules, it will be ignored ✅
# If no output, it will be tracked ⚠️ (confirm if should commit)
```

---

## 📚 Complete Documentation

For detailed strategy and instructions see:
- **Complete documentation**: `shared/docs/gitignore-strategy.md`
- **.gitignore file**: `.gitignore`

---

**After completion**: Notify team members that .gitignore rules have been updated
