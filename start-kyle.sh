#!/bin/bash
# Start Kyle - Quality Testing
# Usage: ./start-kyle.sh [opus]

cd "$(dirname "$0")/kyle"

# Model selection
if [ "$1" = "opus" ]; then
  MODEL="claude-opus-4-5-20251101"
  MODEL_NAME="Opus 4.5"
else
  MODEL="claude-sonnet-4-20250514"
  MODEL_NAME="Sonnet 4"
fi

echo "=========================================="
echo "  Starting Kyle - Quality Testing"
echo "  Model: Claude $MODEL_NAME"
echo "=========================================="
echo ""

# Default to inherit last session, create new if no history
claude --model $MODEL -c 2>/dev/null || claude --model $MODEL
