# zlogin

autoload -U zsource
zsource $ZDOTDIR/local/zlogin.zsh # Source local one at first

case $OSTYPE in
linux*)
   if [[ -z "$SSH_CONNECTION" ]]; then
      if [[ -z "$SSH_AUTH_SOCK" ]]; then
         eval $(ssh-agent)
      fi
      ssh-add
   else
      # Preserve ssh-agent socket using symbolic link
      # https://qiita.com/sonots/items/2d7950a68da0a02ba7e4
      SSH_AGENT="$HOME/.ssh/${(%):-%m}_agent"
      if [[ ! -L "${SSH_AUTH_SOCK}" ]] && [[ -S "$SSH_AUTH_SOCK" ]]; then
         ln -snf "$SSH_AUTH_SOCK" "$SSH_AGENT"
      fi
      if [[ -S "$SSH_AGENT" ]]; then
         export SSH_AUTH_SOCK="$SSH_AGENT"
      else
         unset SSH_AGENT
      fi
   fi
   ;;
mac*)
   [[ -z "$SSH_CONNECTION" ]] && ssh-add
   ;;
esac

# End of zprof
if (( $+builtins[zprof] )); then
   zprof > ./zprof.log
fi

