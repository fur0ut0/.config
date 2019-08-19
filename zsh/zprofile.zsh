# zprofile

autoload -U zsource
zsource $ZDOTDIR/local/zprofile.zsh # Source local one at first

case "$(uname -s)" in
   Darwin*) export OSTYPE=mac ;;
   Linux*)  export OSTYPE=linux ;;
esac

if [[ $OSTYPE =~ linux && "$(uname -a)" =~ Microsoft ]]; then
   export USING_WSL=1

   export LIBGL_ALWAYS_INDIRECT=1
   export NO_AT_BRIDGE=1

   export DOCKER_HOST='tcp://localhost:2375'

   cd
fi

