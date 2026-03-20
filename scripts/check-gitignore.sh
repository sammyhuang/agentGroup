#!/bin/bash
# ================================================================
# aiGroup Project - .gitignore Rules Check Script
# Version: v1.0
# Created: 2026-02-12
# Maintainer: Max
# ================================================================

set -e

PROJECT_ROOT="/Users/yuhao/Desktop/yezannnnn/aiGroup"

cd "$PROJECT_ROOT"

echo "================================================================"
echo "  aiGroup Project .gitignore Rules Check"
echo "================================================================"
echo ""

# Color definitions
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Check counters
TOTAL_CHECKS=0
PASSED_CHECKS=0
WARNINGS=0
ERRORS=0

# Check function
check_files() {
    local pattern=$1
    local description=$2
    local severity=$3  # ERROR or WARNING

    TOTAL_CHECKS=$((TOTAL_CHECKS + 1))

    echo "Checking: $description"

    result=$(git ls-files | grep -E "$pattern" || true)

    if [ -z "$result" ]; then
        echo -e "${GREEN}✅ Passed${NC} - No issues found"
        PASSED_CHECKS=$((PASSED_CHECKS + 1))
    else
        if [ "$severity" == "ERROR" ]; then
            echo -e "${RED}🔴 Error${NC} - Found files that should not be tracked:"
            ERRORS=$((ERRORS + 1))
        else
            echo -e "${YELLOW}⚠️  Warning${NC} - Found the following files:"
            WARNINGS=$((WARNINGS + 1))
        fi
        echo "$result" | sed 's/^/    /'
    fi
    echo ""
}

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Part 1: System Files Check"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

check_files "\.(DS_Store)$" "macOS system files (.DS_Store)" "ERROR"
check_files "\.(Thumbs\.db|desktop\.ini)$" "Windows system files" "ERROR"
check_files "^\.directory$" "Linux system files" "ERROR"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Part 2: Temporary and Log Files Check"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

check_files "\.(log|tmp|swp|swo)$" "Log and temporary files" "ERROR"
check_files "\.(bak|backup|old)$" "Backup files" "WARNING"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Part 3: Design Source Files Check"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

check_files "\.(psd|ai|fig|sketch|xd)$" "Large design source files" "ERROR"
check_files "shared/designs/.*\.(png|jpg|jpeg)$" "Design directory exported images (excluding previews)" "WARNING"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Part 4: Cache and Dependencies Check"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

check_files "__pycache__|\.pyc$|\.pyo$" "Python cache files" "ERROR"
check_files "node_modules/|\.cache/" "Node.js dependencies and cache" "ERROR"
check_files "\.(egg-info|pytest_cache)/" "Python package management and test cache" "ERROR"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Part 5: Sensitive Information Check"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

check_files "\.(env|key|pem)$|secrets/" "Sensitive configuration and key files" "ERROR"
check_files "settings\.local\.json$" "Local configuration files" "ERROR"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Part 6: Editor Configuration Check"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

check_files "\.vscode/|\.idea/|\.cursor/" "Editor configuration directories" "WARNING"

echo "================================================================"
echo "  Check Results Summary"
echo "================================================================"
echo ""
echo "Total checks:   $TOTAL_CHECKS"
echo -e "${GREEN}Passed:       $PASSED_CHECKS${NC}"
echo -e "${YELLOW}Warnings:     $WARNINGS${NC}"
echo -e "${RED}Errors:       $ERRORS${NC}"
echo ""

if [ $ERRORS -gt 0 ]; then
    echo -e "${RED}❌ Check failed - Found $ERRORS errors${NC}"
    echo "Suggestion: Use 'git rm --cached <file>' to remove files that should not be tracked"
    exit 1
elif [ $WARNINGS -gt 0 ]; then
    echo -e "${YELLOW}⚠️  Check passed (with warnings) - Found $WARNINGS warnings${NC}"
    echo "Suggestion: Check if warning files should remain in version control"
    exit 0
else
    echo -e "${GREEN}✅ Check completely passed - .gitignore rules working properly${NC}"
    exit 0
fi