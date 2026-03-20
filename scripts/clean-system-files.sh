#!/bin/bash
# ================================================================
# aiGroup Project - System File Cleanup Script
# Version: v1.0
# Creation Date: 2026-02-12
# Maintainer: Max
# ================================================================

set -e

PROJECT_ROOT="/Users/yuhao/Desktop/yezannnnn/aiGroup"

cd "$PROJECT_ROOT"

echo "================================================================"
echo "  aiGroup Project System File Cleanup Tool"
echo "================================================================"
echo ""

# Color definitions
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Statistics
total_files=0
deleted_files=0

echo -e "${BLUE}Searching for system files in project...${NC}"
echo ""

# Find .DS_Store files
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  macOS System Files (.DS_Store)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

ds_store_files=$(find . -name ".DS_Store" -type f | grep -v ".git/" || true)

if [ -z "$ds_store_files" ]; then
    echo -e "${GREEN}✅ No .DS_Store files found${NC}"
else
    echo "Found the following .DS_Store files:"
    echo "$ds_store_files"
    count=$(echo "$ds_store_files" | wc -l | tr -d ' ')
    total_files=$((total_files + count))
fi
echo ""

# Find Thumbs.db files
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Windows System Files (Thumbs.db, desktop.ini)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

windows_files=$(find . \( -name "Thumbs.db" -o -name "desktop.ini" \) -type f | grep -v ".git/" || true)

if [ -z "$windows_files" ]; then
    echo -e "${GREEN}✅ No Windows system files found${NC}"
else
    echo "Found the following Windows system files:"
    echo "$windows_files"
    count=$(echo "$windows_files" | wc -l | tr -d ' ')
    total_files=$((total_files + count))
fi
echo ""

# Find Vim/Emacs temporary files
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Editor Temporary Files (.swp, *~)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

temp_files=$(find . \( -name "*.swp" -o -name "*.swo" -o -name "*~" \) -type f | grep -v ".git/" || true)

if [ -z "$temp_files" ]; then
    echo -e "${GREEN}✅ No editor temporary files found${NC}"
else
    echo "Found the following temporary files:"
    echo "$temp_files"
    count=$(echo "$temp_files" | wc -l | tr -d ' ')
    total_files=$((total_files + count))
fi
echo ""

# Summary
echo "================================================================"
echo "  Cleanup Summary"
echo "================================================================"
echo ""

if [ $total_files -eq 0 ]; then
    echo -e "${GREEN}✅ Project is very clean, no system files found that need cleanup${NC}"
    echo ""
    exit 0
fi

echo -e "${YELLOW}Found $total_files system files that need cleanup${NC}"
echo ""

# Ask whether to delete
read -p "$(echo -e ${YELLOW}Delete these files? [y/N]:${NC} )" -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${BLUE}Operation cancelled${NC}"
    exit 0
fi

echo ""
echo -e "${BLUE}Starting cleanup...${NC}"
echo ""

# Delete .DS_Store files
if [ -n "$ds_store_files" ]; then
    echo "$ds_store_files" | while read file; do
        if [ -f "$file" ]; then
            rm "$file"
            echo "  Deleted: $file"
            deleted_files=$((deleted_files + 1))
        fi
    done
fi

# Delete Windows files
if [ -n "$windows_files" ]; then
    echo "$windows_files" | while read file; do
        if [ -f "$file" ]; then
            rm "$file"
            echo "  Deleted: $file"
            deleted_files=$((deleted_files + 1))
        fi
    done
fi

# Delete temporary files
if [ -n "$temp_files" ]; then
    echo "$temp_files" | while read file; do
        if [ -f "$file" ]; then
            rm "$file"
            echo "  Deleted: $file"
            deleted_files=$((deleted_files + 1))
        fi
    done
fi

echo ""
echo "================================================================"
echo -e "${GREEN}✅ Cleanup Complete${NC}"
echo "================================================================"
echo ""
echo "Deleted $total_files files"
echo ""

# Verification
remaining=$(find . \( -name ".DS_Store" -o -name "Thumbs.db" -o -name "*.swp" \) -type f | grep -v ".git/" || true)

if [ -z "$remaining" ]; then
    echo -e "${GREEN}Verification passed: All system files cleaned${NC}"
else
    echo -e "${YELLOW}Warning: Some files still remain uncleaned${NC}"
    echo "$remaining"
fi

echo ""
echo "Recommendation: Run 'git status' to check Git status"
echo ""
