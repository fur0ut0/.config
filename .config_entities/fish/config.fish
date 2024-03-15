if status is-interactive
    alias vim="vim -u $XDG_CONFIG_HOME/vim/vimrc"
    if which tmux > /dev/null;
        set -l ver (tmux -V | grep -o -E "[0-9]+\.[0-9]+")
        if [ (echo $ver'<'3.1 | bc -l) -eq 1 ]
            alias tmux="tmux -f $TMUX_CONFIG_DIR/tmux.conf"
        end
    end

    # Commands to run in interactive sessions can go here
    if status is-login; and not set -q TMUX; and which tmux > /dev/null
        # propagate DISPLAY info to existing shells
        set -U -x DISPLAY $DISPLAY
        attach-tmux
    end
end
