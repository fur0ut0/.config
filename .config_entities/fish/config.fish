if status is-interactive
    alias vim="vim -u $XDG_CONFIG_HOME/vim/vimrc"

    # Commands to run in interactive sessions can go here
    if status is-login; and not set -q TMUX; and [ "$TERM_PROGRAM" != vscode ]
        attach-tmux
    end
end
