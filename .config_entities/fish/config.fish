if status is-interactive
    alias vim="vim -u $XDG_CONFIG_HOME/vim/vimrc"

    # Commands to run in interactive sessions can go here
    if status is-login; and not set -q TMUX
        attach-tmux
    end
end
