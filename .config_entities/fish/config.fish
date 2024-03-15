if status is-interactive
    alias vim="vim -u $XDG_CONFIG_HOME/vim/vimrc"

    # Commands to run in interactive sessions can go here
    if status is-login; and not set -q TMUX; and which tmux > /dev/null
        # propagate DISPLAY info to existing shells
        set -U -x DISPLAY $DISPLAY
        attach-tmux
    end
end
