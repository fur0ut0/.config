# zlogin

autoload -U zsource
zsource $ZDOTDIR/local/zlogin.zsh
zsource $XDG_DATA_HOME/zsh/zlogin.zsh

# End of zprof
if (( $+builtins[zprof] )); then
   zprof > ./zprof.log
fi

