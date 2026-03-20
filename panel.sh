#!/bin/bash
# AI Group - Interactive Launch Panel

SESSION="aigroup"
DIR="$(cd "$(dirname "$0")" && pwd)"

# Check tmux
if ! command -v tmux &> /dev/null; then
    echo "Error: tmux installation required"
    echo "Install command: brew install tmux"
    exit 1
fi

# If session already exists
if tmux has-session -t $SESSION 2>/dev/null; then
    echo "AI Group session already exists"
    echo ""
    echo "  1) Connect to existing session"
    echo "  2) Close and restart"
    echo "  3) Exit"
    echo ""
    read -p "Please choose [1-3]: " choice

    case $choice in
        1) tmux attach-session -t $SESSION; exit 0 ;;
        2) tmux kill-session -t $SESSION ;;
        *) exit 0 ;;
    esac
fi

echo "=========================================="
echo "  AI Group - Launch Panel"
echo "=========================================="
echo ""
echo "  a) Full Team (Max + Ella + Jarvis + Kyle)"
echo "  b) Three-person Mode (Max + Ella + Jarvis)"
echo "  c) Max Only"
echo "  d) Design & Development (Ella + Jarvis)"
echo "  q) Exit"
echo ""
read -p "Please choose: " selection

case $selection in
    a|A)
        # Full team: Max left + right three columns
        tmux new-session -d -s $SESSION -c "$DIR/max" -n "AI Group"
        tmux send-keys -t $SESSION "claude -c 2>/dev/null || claude" C-m

        tmux split-window -h -t $SESSION -c "$DIR/ella" -p 40
        tmux send-keys -t $SESSION "claude --model claude-opus-4-5-20251101 -c 2>/dev/null || claude --model claude-opus-4-5-20251101" C-m

        tmux split-window -v -t $SESSION -c "$DIR/jarvis"
        tmux send-keys -t $SESSION "claude --model claude-opus-4-5-20251101 -c 2>/dev/null || claude --model claude-opus-4-5-20251101" C-m

        tmux split-window -v -t $SESSION -c "$DIR/kyle"
        tmux send-keys -t $SESSION "claude -c 2>/dev/null || claude" C-m

        tmux select-pane -t $SESSION:0.0
        tmux attach-session -t $SESSION
        ;;
    b|B)
        # Three-person: Max left + right two columns
        tmux new-session -d -s $SESSION -c "$DIR/max" -n "AI Group"
        tmux send-keys -t $SESSION "claude -c 2>/dev/null || claude" C-m

        tmux split-window -h -t $SESSION -c "$DIR/ella" -p 40
        tmux send-keys -t $SESSION "claude --model claude-opus-4-5-20251101 -c 2>/dev/null || claude --model claude-opus-4-5-20251101" C-m

        tmux split-window -v -t $SESSION -c "$DIR/jarvis"
        tmux send-keys -t $SESSION "claude --model claude-opus-4-5-20251101 -c 2>/dev/null || claude --model claude-opus-4-5-20251101" C-m

        tmux select-pane -t $SESSION:0.0
        tmux attach-session -t $SESSION
        ;;
    c|C)
        # Max only
        tmux new-session -d -s $SESSION -c "$DIR/max" -n "AI Group"
        tmux send-keys -t $SESSION "claude -c 2>/dev/null || claude" C-m
        tmux attach-session -t $SESSION
        ;;
    d|D)
        # Design & Development: Ella left + Jarvis right
        tmux new-session -d -s $SESSION -c "$DIR/ella" -n "Design+Dev"
        tmux send-keys -t $SESSION "claude --model claude-opus-4-5-20251101 -c 2>/dev/null || claude --model claude-opus-4-5-20251101" C-m

        tmux split-window -h -t $SESSION -c "$DIR/jarvis"
        tmux send-keys -t $SESSION "claude --model claude-opus-4-5-20251101 -c 2>/dev/null || claude --model claude-opus-4-5-20251101" C-m

        tmux attach-session -t $SESSION
        ;;
    *)
        exit 0
        ;;
esac