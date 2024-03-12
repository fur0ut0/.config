set -q PYENV_ROOT; or set -Ux PYENV_ROOT $XDG_DATA_HOME/pyenv
if [ -d $PYENV_ROOT/bin ]
    fish_add_path $PYENV_ROOT/bin
    eval "$(pyenv init -)"
end
