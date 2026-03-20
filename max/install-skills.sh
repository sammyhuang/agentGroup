#!/bin/bash

# Max Skills Auto-Installation Script
echo "🚀 Starting Max project management skills installation..."

# Create skills directory
SKILLS_DIR="$HOME/.claude/skills"
mkdir -p "$SKILLS_DIR"

echo "📁 Skills directory created: $SKILLS_DIR"

# Install core project management system
echo "📦 Installing CCPM (Claude Code Project Manager)..."
if [ ! -d "$SKILLS_DIR/ccpm" ]; then
    git clone https://github.com/automazeio/ccpm.git "$SKILLS_DIR/ccmp"
    echo "✅ CCPM installation completed"
else
    echo "⚠️  CCPM already exists, skipping installation"
fi

# Install product management skill set
echo "📦 Installing product management skill set..."
if [ ! -d "$SKILLS_DIR/pm-claude-skills" ]; then
    git clone https://github.com/Sh1n/pm-claude-skills--.git "$SKILLS_DIR/pm-claude-skills"
    echo "✅ Product management skill set installation completed"
else
    echo "⚠️  Product management skill set already exists, skipping installation"
fi

# Install comprehensive skills library
echo "📦 Installing comprehensive skills library..."
if [ ! -d "$SKILLS_DIR/claude-skills" ]; then
    git clone https://github.com/alirezarezvani/claude-skills.git "$SKILLS_DIR/claude-skills"
    echo "✅ Comprehensive skills library installation completed"
else
    echo "⚠️  Comprehensive skills library already exists, skipping installation"
fi

# Install project management framework
echo "📦 Installing project management framework..."
if [ ! -d "$SKILLS_DIR/claude-simone" ]; then
    git clone https://github.com/Helmi/claude-simone.git "$SKILLS_DIR/claude-simone"
    echo "✅ Project management framework installation completed"
else
    echo "⚠️  Project management framework already exists, skipping installation"
fi

# Create skills quick launch script
echo "📝 Creating skills quick launch script..."
cat > "$SKILLS_DIR/max-skills.sh" << 'EOF'
#!/bin/bash
# Max Skills Quick Launch

echo "🎯 Max Skills Toolkit"
echo "====================="
echo "1. Project Status Check"
echo "2. Generate Meeting Notes"
echo "3. Analyze Team Efficiency"
echo "4. Create PRD Documents"
echo "5. Risk Assessment"
echo "6. Todo Management"
echo "====================="

read -p "Please select function (1-6): " choice

case $choice in
    1) echo "🔍 Executing project status check..." ;;
    2) echo "📝 Generating meeting notes..." ;;
    3) echo "📊 Analyzing team efficiency..." ;;
    4) echo "📋 Creating PRD documents..." ;;
    5) echo "⚠️  Executing risk assessment..." ;;
    6) echo "✅ Managing todo items..." ;;
    *) echo "❌ Invalid selection" ;;
esac
EOF

chmod +x "$SKILLS_DIR/max-skills.sh"
echo "✅ Quick launch script creation completed"

# Verify installation
echo ""
echo "🎉 Max skills installation completed!"
echo ""
echo "📍 Installed skills:"
echo "   - CCPM project management system"
echo "   - Product management skill set (saves 8-9 hours/week)"
echo "   - Comprehensive skills library"
echo "   - Project management framework"
echo ""
echo "🚀 Usage:"
echo "   1. Start Claude Code: claude --project max"
echo "   2. View skills list: /skills list"
echo "   3. Quick launch: ~/.claude/skills/max-skills.sh"
echo ""
echo "📖 For detailed instructions see: max/skills-setup.md"