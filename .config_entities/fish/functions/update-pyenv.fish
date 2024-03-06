function update-pyenv
    if not set -q PYENV_ROOT
        echo "PYENV_ROOT is not set" >&2
        return 1
    end
    if not [ -d "$PYENV_ROOT" ]
        echo "$PYENV_ROOT: no such directory" >&2
        return 1
    end
    cd "$PYENV_ROOT"
    git pull
end
