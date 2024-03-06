export PERCOL=fzf
if status is-interactive
    # Commands to run in interactive sessions can go here
    if status is-login; and not set -q TMUX; and [ "$TERM_PROGRAM" != vscode ]
        attach-tmux
    end
end
