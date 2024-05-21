function update-one-nvim
    set -l dir "$XDG_DATA_HOME"/nvim/site/pack/user/start/one.nvim
    if not [ -d "$dir" ]
        echo "$dir: no such directory" >&2
        return 1
    end
    cd "$dir"
    git pull
end
