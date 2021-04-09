set nocompatible
filetype off

" XDG Directory Specification
if $XDG_CACHE_HOME == ''
   let $XDG_CACHE_HOME = expand('$HOME/.cache')
endif
if $XDG_CONFIG_HOME == ''
   let $XDG_CONFIG_HOME = expand('$HOME/.config')
endif
if $XDG_DATA_HOME == ''
   let $XDG_DATA_HOME = expand('$HOME/.local/share')
endif

" Vim compatibility
if !has('nvim')
   if !isdirectory(expand("$XDG_CACHE_HOME/vim"))
      call mkdir(expand("$XDG_CACHE_HOME/vim"), "p")
   endif
   set undodir=$XDG_CACHE_HOME/vim/undo
   set directory=$XDG_CACHE_HOME/vim/swap
   set backupdir=$XDG_CACHE_HOME/vim/backup
   set viminfo+='1000,n$XDG_CACHE_HOME/vim/viminfo
   set runtimepath=$XDG_CONFIG_HOME/nvim,$VIMRUNTIME,$XDG_CONFIG_HOME/nvim/after
endif

" Basic
set history=200
set backspace=indent,start,eol
set whichwrap=b,s,h,l,<,>,[,]
set clipboard+=unnamed,unnamedplus
set wildmode=list,full

" Indentation
set autoindent
set expandtab
set tabstop=3
set shiftwidth=3
set softtabstop=3

" Visual
set cino+=(0
set noerrorbells
set visualbell t_vb=
set number
set cursorline
set nostartofline
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp
set ambiwidth=double
set showmatch
set matchpairs& matchpairs+=<:>
   autocmd FileType c,cpp,java set matchpairs+==:;
set wrap
set breakindent
set list
set listchars=tab:>-,extends:>,precedes:<,trail:_,nbsp:%
set incsearch
set hlsearch
set conceallevel=0

" Statusline
set laststatus=2
set statusline=%F
set statusline+=%m
set statusline+=%r
set statusline+=%h
set statusline+=%w
set statusline+=%=
set statusline+=%y
set statusline+=[%{&fileencoding}]
set statusline+=[%l/%L,%c/%{strlen(getline('.'))}]

"------------------------------------------------------------------------------
" Plugin

let s:dein_dir = expand('$XDG_CACHE_HOME/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
   execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
   call dein#begin(s:dein_dir)

   let s:toml_dir = expand('$XDG_CONFIG_HOME/nvim/dein')

   " Global
   let s:toml = s:toml_dir . '/dein.toml'
   let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'
   call dein#load_toml(s:toml, {'lazy': 0})
   call dein#load_toml(s:lazy_toml, {'lazy': 1})

   " Local
   let s:local_toml = s:toml_dir . '/local/dein.toml'
   if filereadable(s:local_toml)
      call dein#load_toml(s:local_toml, {'lazy': 0})
   endif
   let s:local_lazy_toml = s:toml_dir . '/local/dein_lazy.toml'
   if filereadable(s:local_lazy_toml)
      call dein#load_toml(s:local_lazy_toml, {'lazy': 1})
   endif

   call dein#end()
   call dein#save_state()
endif

if dein#check_install(['vimproc.vim'])
   call dein#install(['vimproc.vim'])
endif

if dein#check_install()
   call dein#install()
endif

autocmd VimEnter * call dein#call_hook('post_source')

"------------------------------------------------------------------------------
" Color

let OSTYPE = system('uname')
if match(OSTYPE, 'Linux') != -1
   set t_Co=256
endif

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

set background=dark
syntax on
colorscheme dracula

" 80文字制限ラインを可視化
if (exists('+colorcolumn'))
   set colorcolumn=80,100
endif

"------------------------------------------------------------------------------
" Color scheme development

" カーソル上のhighlight情報を取得
" :SyntaxInfo
function! s:get_syn_id(transparent)
   let synid = synID(line("."), col("."), 1)
   if a:transparent
      return synIDtrans(synid)
   else
      return synid
   endif
endfunction

function! s:get_syn_attr(synid)
   let name = synIDattr(a:synid, "name")
   let ctermfg = synIDattr(a:synid, "fg", "cterm")
   let ctermbg = synIDattr(a:synid, "bg", "cterm")
   let cterm = synIDattr(a:synid, "cterm")
   let term = synIDattr(a:synid, "term")
   let guifg = synIDattr(a:synid, "fg", "gui")
   let guibg = synIDattr(a:synid, "bg", "gui")
   let gui = synIDattr(a:synid, "gui")
   return {
      \ "name": name,
      \ "ctermfg": ctermfg,
      \ "ctermbg": ctermbg,
      \ "cterm": cterm,
      \ "term": term,
      \ "guifg": guifg,
      \ "guibg": guibg,
      \ "gui": gui
   \}
endfunction

function! s:get_syn_info()
   let baseSyn = s:get_syn_attr(s:get_syn_id(0))
   echo "name: " . baseSyn.name .
      \ " ctermfg: " . baseSyn.ctermfg .
      \ " ctermbg: " . baseSyn.ctermbg .
      \ " cterm: " . baseSyn.cterm .
      \ " term: " . baseSyn.term .
      \ " guifg: " . baseSyn.guifg .
      \ " guibg: " . baseSyn.guibg
      \ " gui: " . baseSyn.gui
   let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
   echo "link to"
   echo "name: " . linkedSyn.name .
      \ " ctermfg: " . linkedSyn.ctermfg .
      \ " ctermbg: " . linkedSyn.ctermbg .
      \ " cterm: " . linkedSyn.cterm .
      \ " term: " . linkedSyn.term .
      \ " guifg: " . linkedSyn.guifg .
      \ " guibg: " . linkedSyn.guibg
      \ " gui: " . linkedSyn.gui
endfunction
command! SyntaxInfo call s:get_syn_info()

function! s:auto_update_colorscheme(...) abort
   if &ft !=# 'vim'
      echoerr 'Execute this command in colorscheme file buffer'
   endif
   setlocal autoread noswapfile
   let interval = a:0 > 0 ? a:1 : 3000
   let timer = timer_start(interval, {-> execute('checktime')}, {'repeat' : -1})
   autocmd! BufReadPost <buffer> source %
endfunction
command! -nargs=? AutoUpdateColorscheme call <SID>auto_update_colorscheme(<f-args>)

"------------------------------------------------------------------------------
" Keybind

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

nnoremap [Myplug] <Nop>
nmap <Space> [Myplug]

noremap j gj
noremap k gk

nnoremap <C-k>t :<C-u>tabnew<CR>
nnoremap <C-k>n :<C-u>bnext<CR>
nnoremap <C-k>p :<C-u>bprev<CR>
nnoremap <C-k>q :<C-u>bdel<CR>
nnoremap <C-k>N :<C-u>cnext<CR>
nnoremap <C-k>P :<C-u>cprev<CR>

nnoremap <C-c> <C-c>:<C-u>syntax sync fromstart<CR>
nnoremap <C-l> <C-l>:<C-u>nohlsearch<CR>

inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"
imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Esc: neovim terminalを抜ける
if has("nvim")
   tnoremap <silent> <ESC> <C-\><C-n>
endif

" makes * and # work on visual mode too.
" From http://got-ravings.blogspot.com/2008/07/vim-pr0n-visual-search-mappings.html
function! s:VSetSearch(cmdtype)
   let temp = @s
   norm! gv"sy
   let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
   let @s = temp
endfunction
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
" recursively vimgrep for word under cursor or selection if you hit leader-star
nmap <leader>* :execute 'noautocmd vimgrep /\V' . substitute(escape(expand("<cword>"), '\'), '\n', '\\n', 'g') . '/ **'<CR>
vmap <leader>* :<C-u>call <SID>VSetSearch()<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **'<CR>

filetype indent plugin on

"------------------------------------------------------------------------------
" Local config

augroup vimrc-local
   autocmd!
   autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
   let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
   for i in reverse(filter(files, 'filereadable(v:val)'))
      source `=i`
   endfor
endfunction
