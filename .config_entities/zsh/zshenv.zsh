# zshenv

autoload -U zsource
zsource $ZDOTDIR/local/zshenv.zsh
zsource $XDG_DATA_HOME/zsh/zshenv.zsh

setopt no_global_rcs # Skip loading /etc/zprofile etc.
setopt no_sh_word_split

autoload -U add-to-env

add-to-env path /sbin
add-to-env path $HOME/bin
add-to-env path $HOME/.local/bin
if [ $(uname -m) = "x86_64" ]; then
   add-to-env path /usr/local/bin
   add-to-env path /usr/local/sbin
   add-to-env ld_library_path /usr/local/lib
fi


# rbenv
if [[ -z $RBENV_ROOT ]]; then
   RBENV_ROOT=$XDG_DATA_HOME/rbenv
fi
if [[ -d $RBENV_ROOT ]]; then
   export RBENV_ROOT
   add-to-env path $RBENV_ROOT/bin
   add-to-env path $RBENV_ROOT/shims
else
   unset RBENV_ROOT
fi

# pyenv
if [[ -z $PYENV_ROOT ]]; then
   PYENV_ROOT=$XDG_DATA_HOME/pyenv
fi
if [[ -d $PYENV_ROOT ]]; then
   export PYENV_ROOT
   add-to-env path $PYENV_ROOT/bin
   add-to-env path $PYENV_ROOT/shims
else
   unset PYENV_ROOT
fi

# rust
if [[ -z $CARGO_HOME ]]; then
   CARGO_HOME=$HOME/.cargo
fi
if [[ -d $CARGO_HOME ]]; then
   export CARGO_HOME
   . $CARGO_HOME/env
else
   unset CARGO_HOME
fi

# ccls
if [[ -z $CCLS_ROOT ]]; then
   CCLS_ROOT=$HOME/.local/src/ccls
fi
if [[ -d $CCLS_ROOT ]]; then
   export CCLS_ROOT
   add-to-env path $CCLS_ROOT/Release
else
   unset CCLS_ROOT
fi

# go
if [[ -z $GOROOT ]]; then
   GOROOT=$HOME/.local/share/go
fi
if [[ -d $GOROOT ]]; then
   export GOROOT
   add-to-env path $GOROOT/bin
else
   unset GOROOT
fi

# brew
if [[ -z $BREW_ROOT ]]; then
   case $(uname -m) in
      x86_64)
         BREW_ROOT=/usr/local/Homebrew
         ;;
      arm64)
         BREW_ROOT=/opt/homebrew
         ;;
      *)
         BREW_ROOT=""
         ;;
   esac
fi
if [[ -d $BREW_ROOT ]]; then
   export BREW_ROOT
   add-to-env path $BREW_ROOT/bin
else
   unset BREW_ROOT
fi

# Fix umask for Windows Subsystem Linux
[[ "$(umask)" = "000" ]] && umask 022

if [[ -z $DISPLAY && -z $SSH_CONNECTION ]]; then
   if [[ -v WSL_INTEROP ]]; then
      # WSL2
      export DISPLAY="$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2> /dev/null):0"
      export LIBGL_ALWAYS_INDIRECT=1
   else
      export DISPLAY=localhost:0.0
   fi
fi

# Run command with CJK-friendly wcwidth(3) to fix ambiguous width chars
# https://github.com/fumiyas/wcwidth-cjk
WCWIDTH_CJK=/usr/local/lib/wcwidth-cjk.so
if [[ -f $WCWIDTH_CJK ]]; then
   export LD_PRELOAD=$WCWIDTH_CJK
else
   unset WCWIDTH_CJK
fi

