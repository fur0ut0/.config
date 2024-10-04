# zprofile

autoload -U zsource
zsource $ZDOTDIR/local/zprofile.zsh
zsource $XDG_DATA_HOME/zsh/zprofile.zsh

case "$(uname -s)" in
   Darwin*) export OSTYPE=mac ;;
   Linux*)  export OSTYPE=linux ;;
esac


setopt extended_glob
if [[ $OSTYPE =~ linux && "$(uname -a)" =~ (#i)microsoft ]]; then
   export USING_WSL=1

   export LIBGL_ALWAYS_INDIRECT=1
   export NO_AT_BRIDGE=1

   export DOCKER_HOST='tcp://localhost:2375'

   cd
fi
setopt noextended_glob

