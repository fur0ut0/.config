# zshrc

autoload -U zsource
zsource $ZDOTDIR/local/zshrc.zsh
zsource $XDG_DATA_HOME/zsh/zshrc.zsh

# Create XDG Base Directory as needed
[[ -d $XDG_DATA_HOME/zsh ]]  || mkdir -p $XDG_DATA_HOME/zsh
[[ -d $XDG_CACHE_HOME/zsh ]] || mkdir -p $XDG_CACHE_HOME/zsh

#==============================================================================
# BASIC CONFIG

#======#
# opts #
#======#
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt share_history
setopt auto_cd
setopt auto_pushd
setopt correct
setopt list_packed
setopt no_beep
HISTFILE=$XDG_DATA_HOME/zsh/history
HISTSIZE=10000
SAVEHIST=10000
REPORTTIME=3
LISTMAX=0
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>' # exclude "/" for ctrl-W convenience

#========#
# keymap #
#========#
bindkey -d  # reset keybind
bindkey -e  # emacs keybind

#=======#
# color #
#=======#
autoload -Uz add-zsh-hook
autoload -U colors && colors

export LS_COLORS=di="1;34:ln=35:so=32:pi=33:ex=31:bd=30;46:cd=30;43:su=30;41:sg=30;46:tw=37;42:ow=30;43"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
alias grep='grep --color=auto --exclude-dir=".git" --exclude-dir=".ccls-cache"'

case $OSTYPE in
linux*)
   alias ls='ls --color=auto --group-directories-first'
   zstyle ':completion:*' list-dirs-first true
   ;;
mac*)
   export LSCOLORS="Exfxcxdxbxagadabaghcad"
   export CLICOLOR=1
   ;;
esac

#=========#
# plugins #
#=========#
typeset -g -A ZINIT
ZINIT[HOME_DIR]=$XDG_CACHE_HOME/zinit
ZINIT[BIN_DIR]=$ZINIT[HOME_DIR]/bin
ZINIT[ZCOMPDUMP_PATH]=$XDG_CACHE_HOME/zsh/compdump
ZPFX=$ZINIT[HOME_DIR]/polaris

if [[ ! -d $ZINIT[BIN_DIR] ]]; then
   print "==> Setup zinit..."
   [[ -d $ZINIT[HOME_DIR] ]] || mkdir -p $ZINIT[HOME_DIR]
   (( $+commands[git] )) && git clone https://github.com/zdharma-continuum/zinit.git $ZINIT[BIN_DIR]
fi

if [[ -f $ZINIT[BIN_DIR]/zinit.zsh ]]; then
   source $ZINIT[BIN_DIR]/zinit.zsh
fi

if (( $+functions[zinit] )); then
   zinit ice pick"async.zsh" src"pure.zsh"; zinit light sindresorhus/pure

   zinit ice as"program" pick"bin/*" src"shell/key-bindings.zsh" atclone"./install --bin" atpull"%atclone"; zinit light junegunn/fzf

   zinit ice wait"0" blockf; zinit light zsh-users/zsh-completions
   zinit ice wait"0" atload"_zsh_autosuggest_start"; zinit light zsh-users/zsh-autosuggestions

   zinit ice wait"0" atinit"zpcompinit; zpcdreplay"; zinit light zdharma/fast-syntax-highlighting
   zinit ice wait"0" atload"zpcompinit; zpcdreplay"; zinit light ascii-soup/zsh-url-highlighter
   zinit ice wait"0" blockf; zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

   zinit ice wait"0"; zinit light mollifier/zload

   # completions
   zinit ice lucid nocompile; zinit load MenkeTechnologies/zsh-cargo-completion
   zinit ice wait"0" as"completion"; zinit light gangleri/pipenv

   typeset -g ENHANCD_DIR=$XDG_DATA_HOME/enhancd ENHANCD_DOT_ARG=... ENHANCD_HYPHEN_ARG=-- ENHANCD_HOME_ARG=%
   zinit ice wait"0"; zinit light b4b4r07/enhancd
fi

#============#
# completion #
#============#
autoload +X -U compinit && compinit -C -d $XDG_CACHE_HOME/zsh/compdump

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end

bindkey '^[[Z' reverse-menu-complete # reverse completion by Shift-Tab

# 補完方法毎にグループ化する。
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''

# 補完侯補をメニューから選択する。
# select=2: 補完候補を一覧から選択する。補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2

# 補完候補がなければより曖昧に候補を探す。
# m:{a-z}={A-Z}: 小文字を大文字に変えたものでも補完する。
# r:|[._-]=*: 「.」「_」「-」の前にワイルドカード「*」があるものとして補完する。
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' recent-dirs-insert both

# 補完候補
# _oldlist 前回の補完結果を再利用する。
# _complete: 補完する。
# _match: globを展開しないで候補の一覧から補完する。
# _history: ヒストリのコマンドも補完候補とする。
# _ignored: 補完候補にださないと指定したものも補完候補とする。
# _approximate: 似ている補完候補も補完候補とする。
# _prefix: カーソル以降を無視してカーソル位置までで補完する。
zstyle ':completion:*' completer _complete _match _approximate _prefix

# 補完候補をキャッシュする。
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/compcache

# sudo の時にコマンドを探すパス
zstyle ':completion:*:sudo:*' command-path \
   /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# Better SSH/Rsync/SCP Autocomplete
# source: https://www.codyhiar.com/blog/zsh-autocomplete-with-ssh-config-file/
zstyle ':completion:*:(scp|rsync):*' tag-order \
   ' hosts:-ipaddr:ip\ address hosts:-host:host files'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns \
   '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns \
   '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' \
   '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

#==============================================================================
# APPLICATION

stty stop   undef   # Free Ctrl-S
stty start  undef   # Free Ctrl-Q

# rbenv
if [[ -d $RBENV_ROOT ]]; then
   eval "$(rbenv init - | grep -v 'rbenv rehash' | grep -v 'PATH')"
   autoload -Uz rbenv-update
fi

if [[ -v WSL_INTEROP ]]; then
   autoload -Uz daemonize-wsl-systemd nsenter-wsl-systemd
fi

# pyenv
if [[ -d $PYENV_ROOT ]]; then
   eval "$(pyenv init - | grep -v 'pyenv rehash' | grep -v 'PATH')"
   autoload -Uz pyenv-update
fi

# psql
[[ -d $XDG_DATA_HOME/psql ]] || mkdir -p $XDG_DATA_HOME/psql
export PSQL_HISTORY="$XDG_DATA_HOME/psql/history"

# Python
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python3/startup.py"

# Ruby
export IRBRC="$XDG_CONFIG_HOME/irb/irbrc"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/bundle/config"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/bundle/cache"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/bundle/plugin"

# Use neovim as default
if (( ${+commands[nvim]} )); then
   alias vim="nvim"
else
   export VIMINIT=":source $XDG_CONFIG_HOME/vim/vimrc"
fi

# tmux
export TMUX_CONFIG_DIR=$XDG_CONFIG_HOME/tmux
alias tmux='tmux -f $TMUX_CONFIG_DIR/tmux.conf'

# less config
if (( $+commands[lesskey] )); then
   () {
      local conf_dir=$XDG_CONFIG_HOME/less
      local lesskey_conf=$conf_dir/lesskey
      [[ -f $lesskey_conf ]] || return 0
      export LESSKEY=$conf_dir/less
      lesskey $lesskey_conf
   }
fi

# Grant safety of rm
if (( ${+commands[mv2trash]} )); then
   alias rm='mv2trash'
else
   alias rm='rm -i'
fi

(( ${+commands[tac]} )) || alias tac="tail -r"

alias pps='ps -o pid,pgid,ppid,lwp,nlwp,tty,time,etime,stat,psr,pcpu,euser,args'
compdef pps='ps'

# Suffix oriented alias
autoload -U unarchive && alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz,7z}='unarchive'
alias -s {png,jpg,bmp,PNG,JPG,BMP}='open'

autoload -Uz color256

if (( $+commands[sshfs] )); then
   autoload -Uz sshmount
fi

if (( $+commands[git] )); then
   autoload -Uz git-root
fi

if (( $+commands[git] && $+commands[fzf] )); then
   autoload -Uz git-checkout-fzf
   autoload -Uz git-show-fzf
fi

compdef zsource='source'

# Clipboard compatibility
if [[ $OSTYPE =~ linux ]] && (( $+commands[xclip] )); then
   alias pbcopy='xclip -sel c'
   alias pbpaste='xclip -sel c -o'
fi

# tmux env update hook
if [[ -n $TMUX ]]; then
   autoload -Uz tmux-update-env
   autoload -Uz add-zsh-hook
   add-zsh-hook preexec tmux-update-env
   alias ssh='TERM=${TERM%%-italic} ssh'
fi

# Attach existing tmux session or create new one
# https://qiita.com/ssh0/items/a9956a74bff8254a606a
autoload -Uz is-at-least
if (( $+commands[tmux] * !$+TMUX )) && is-at-least 5.2.0 && (( ! $+DISABLE_AUTO_TMUX_ATTACH )) && [[ "$TERM_PROGRAM" != "vscode" ]]; then
   () {
      # Build session lists
      # Colons(:) are used as delimiter
      local -a sess_names
      local sess_list="$(command tmux list-session 2> /dev/null)"
      if [[ -n $sess_list ]]; then
         sess_names+=("${(@f)sess_list}")
      fi
      local new_sess_id="c"
      sess_names+=("$new_sess_id: Create new session")
      local sess_ids=("${(@f)"$(echo ${(F)sess_names} | cut -d: -f1)"}")

      local sess_id
      if (( $+commands[fzf] )); then
         sess_id="$(echo ${(F)sess_names[@]} | fzf | cut -d: -f1)"
      else
         print -u 2 -l "[TMUX Manager]" \
            "Do you want to attach or create tmux session?"
         print -u 2 -l -x 4 -- "\t"$^sess_names
         read sess_id\?"Please enter ID (${(j:/:)sess_ids}): "
      fi

      if [[ "$sess_id" == "$new_sess_id" ]]; then
         tmux -f "$TMUX_CONFIG_DIR/tmux.conf" new-session
      elif (( $+sess_ids[(re)$sess_id] )); then
         tmux attach-session -d -t "$sess_id"
      else
         print -u 2 -- "Unknown ID: $sess_id. Abort."
         :  # Start terminal normally
      fi
   }
fi

