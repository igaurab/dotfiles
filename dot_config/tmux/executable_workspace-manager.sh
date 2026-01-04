#!/usr/bin/env bash
# Tmux workspace manager - save and restore named workspaces

WORKSPACE_DIR="$HOME/.config/tmux/workspaces"
mkdir -p "$WORKSPACE_DIR"

# Gruvbox fzf colors matching sessionizer
FZF_COLORS="bg:#282828,bg+:#3c3836,fg:#a89984,fg+:#ebdbb2,hl:#d79921,hl+:#d79921,pointer:#d79921,prompt:#d79921,info:#665c54"

list_workspaces() {
    if [[ ! -d "$WORKSPACE_DIR" || -z "$(ls -A "$WORKSPACE_DIR" 2>/dev/null)" ]]; then
        return 1
    fi
    ls -1 "$WORKSPACE_DIR" | sed 's/\.txt$//'
}

restore_workspace() {
    local selected=$(list_workspaces | fzf \
        --reverse \
        --prompt='󰁯 Restore workspace: ' \
        --pointer='▌' \
        --color="$FZF_COLORS")

    if [[ -n "$selected" ]]; then
        # Use tmux-resurrect's restore script with the specific workspace file
        ln -sf "$WORKSPACE_DIR/${selected}.txt" "$HOME/.local/share/tmux/resurrect/last"
        tmux run-shell "$HOME/.config/tmux/plugins/tmux-resurrect/scripts/restore.sh"
    fi
}

save_workspace() {
    # Get workspace name using fzf with input prompt
    local workspace_name=$(echo "" | fzf \
        --print-query \
        --prompt='󰆓 Save as workspace: ' \
        --pointer='▌' \
        --color="$FZF_COLORS" \
        --header='Type workspace name and press Enter' | tail -1)

    if [[ -z "$workspace_name" ]]; then
        exit 0
    fi

    # Replace spaces with underscores for file safety
    workspace_name="${workspace_name// /_}"

    # Save current tmux state using tmux-resurrect
    tmux run-shell "$HOME/.config/tmux/plugins/tmux-resurrect/scripts/save.sh"

    # Copy the last resurrect save to our workspace
    sleep 1  # Give it a moment to save
    local last_save=$(ls -t ~/.local/share/tmux/resurrect/*.txt 2>/dev/null | head -1)

    if [[ -n "$last_save" ]]; then
        cp "$last_save" "$WORKSPACE_DIR/${workspace_name}.txt"
        tmux display-message "Workspace '$workspace_name' saved!"
    else
        tmux display-message "Failed to save workspace"
    fi
}

delete_workspace() {
    local selected=$(printf "󰆴 Delete all workspaces\n$(list_workspaces)" | fzf \
        --reverse \
        --prompt='󰆴 Delete workspace: ' \
        --pointer='▌' \
        --color="$FZF_COLORS")

    if [[ "$selected" == "󰆴 Delete all workspaces" ]]; then
        # Confirmation for delete all
        local confirm=$(printf "No\nYes" | fzf \
            --reverse \
            --prompt='⚠ Delete ALL workspaces? ' \
            --pointer='▌' \
            --color="$FZF_COLORS")

        if [[ "$confirm" == "Yes" ]]; then
            rm -f "$WORKSPACE_DIR"/*.txt
            tmux display-message "All workspaces deleted"
        fi
    elif [[ -n "$selected" ]]; then
        rm "$WORKSPACE_DIR/${selected}.txt"
        tmux display-message "Workspace '$selected' deleted"
    fi
}

# Main menu using fzf
main_menu() {
    while true; do
        local action=$(printf "󰁯 Restore workspace\n󰆓 Save current as workspace\n󰆴 Delete workspace\n Exit" | fzf \
            --reverse \
            --prompt='  Workspace Manager: ' \
            --pointer='▌' \
            --color="$FZF_COLORS" \
            --header='Select action (ESC to exit)')

        # Exit if no selection (ESC pressed) or Exit selected
        if [[ -z "$action" || "$action" == " Exit" ]]; then
            break
        fi

        case "$action" in
            "󰁯 Restore workspace") restore_workspace ;;
            "󰆓 Save current as workspace") save_workspace ;;
            "󰆴 Delete workspace") delete_workspace ;;
        esac
    done
}

# If run with argument, restore that workspace directly
if [[ "$1" == "restore" ]]; then
    restore_workspace
else
    main_menu
fi
