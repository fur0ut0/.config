# Default XDG user directory
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_STATE_HOME $HOME/.local/state
set -x XDG_RUNTIME_DIR /run/user/$UID

set -x TMUX_CONFIG_DIR $HOME/.config/tmux
set -x PERCOL fzf
set -x VIMINIT "source $XDG_CONFIG_HOME/vim/vimrc"
