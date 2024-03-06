function attach-tmux
    set -f sessions "$(tmux list-sessions 2> /dev/null)"
    if [ -z "$sessions" ]
        tmux new-session
        return 0
    end
    set -f sessions $sessions\n"n: Create New Session"\n"x: Exit"
    if set -q PERCOL; and type -q $PERCOL
        set -f id "$(echo "$sessions" | $PERCOL | cut -d: -f1)"
    else
        echo "[TMUX Manager] Do you want to attach or create tmux session?"
        echo $sessions
        read -f -P "Please enter ID: " id
    end
    if [ "$id" = n ]
        tmux new-session
    else if [ -n "$id" ]
        tmux attach-session -t "$id"
    else
        : # Start terminal normally
    end
end
