#!/usr/bin/env bash
# Fuzzy project sessionizer for tmux

# Common project directories - customize these to your needs
SEARCH_DIRS=(
    ~/code
    ~/projects
    ~/work
    ~/d
    ~/workspaces
)

# Build list of directories to search
dirs=""
for dir in "${SEARCH_DIRS[@]}"; do
    [[ -d "$dir" ]] && dirs="$dirs $dir"
done

# Combine existing sessions and project directories
selected=$(
    {
        tmux list-sessions -F "#{session_name}" 2>/dev/null
        [[ -n "$dirs" ]] && find $dirs -mindepth 1 -maxdepth 1 -type d 2>/dev/null
    } | fzf --reverse \
        --prompt='  ' \
        --pointer='▌' \
        --color=bg:#282828,bg+:#3c3836,fg:#a89984,fg+:#ebdbb2,hl:#d79921,hl+:#d79921,pointer:#d79921,prompt:#d79921,info:#665c54
)

# Exit if nothing selected
[[ -z "$selected" ]] && exit 0

# Determine if selection is a path or existing session name
if [[ "$selected" == /* ]]; then
    session_name=$(basename "$selected" | tr '.' '_')
    session_path="$selected"
else
    session_name="$selected"
    session_path=""
fi

# Check if a workspace exists for this session
WORKSPACE_DIR="$HOME/.config/tmux/workspaces"
WORKSPACE_FILE="$WORKSPACE_DIR/${session_name}.txt"

# Switch to or create session
if tmux has-session -t="$session_name" 2>/dev/null; then
    # Session already exists, just switch to it
    tmux switch-client -t "$session_name"
elif [[ -f "$WORKSPACE_FILE" ]]; then
    # Workspace exists, restore it
    ln -sf "$WORKSPACE_FILE" "$HOME/.local/share/tmux/resurrect/last"
    tmux run-shell "$HOME/.config/tmux/plugins/tmux-resurrect/scripts/restore.sh"
    # Give it a moment to restore, then switch
    sleep 0.5
    tmux switch-client -t "$session_name" 2>/dev/null || tmux attach -t "$session_name"
else
    # No workspace, create a new session normally
    if [[ -n "$session_path" ]]; then
        tmux new-session -ds "$session_name" -c "$session_path"
    else
        tmux new-session -ds "$session_name"
    fi
    tmux switch-client -t "$session_name"
fi
