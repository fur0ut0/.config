# zprof
if [[ -n $ZSH_STARTUP_ZPROF ]]; then
   zmodload zsh/zprof && zprof
fi

# XDG Base Directory
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# NOTE: .zshenv must exist in both $HOME and $ZDOTDIR
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# Force *path entries unique
typeset -U path fpath manpath cdpath
typeset -U PATH FPATH MANPATH CDPATH
typeset -T -Ux LD_LIBRARY_PATH ld_library_path
typeset -T -Ux LIBRARY_PATH library_path
typeset -T -Ux CPATH cpath

fpath=(
   $ZDOTDIR/function(N-/)
   $ZDOTDIR/local/function(N-/)
   $fpath[@]
)

autoload -U zsource
zsource $ZDOTDIR/zshenv.zsh
