# zlogin

autoload -U zsource
zsource $ZDOTDIR/local/zlogin.zsh # Source local one at first

# End of zprof
if (( $+builtins[zprof] )); then
   zprof > ./zprof.log
fi

