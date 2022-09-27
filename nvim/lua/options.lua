local options = {
   ambiwidth = 'single',
   autoindent = true,
   backspace = {'indent', 'start', 'eol'},
   backup = false,
   backupskip = {'/tmp/*'},
   breakindent = true,
   clipboard = {'unnamed', 'unnamedplus'},
   conceallevel = 0,
   colorcolumn = {80, 100, 120},
   cursorline = true,
   encoding = 'utf-8',
   errorbells = false,
   expandtab = true,
   fileencodings = {'utf-8', 'euc-jp', 'shift-jis'},
   history = 200,
   hlsearch = true,
   incsearch = true,
   list = true,
   -- listchars cannot be set via table (Neovim v0.7.2)
   listchars = 'tab:>-,extends:>,precedes:<,trail:_,nbsp:%',
   matchpairs = {'(:)', '{:}', '[:]'},
   mouse = '',
   number = true,
   shiftwidth = 3,
   showmatch = true,
   softtabstop = 3,
   startofline = false,
   swapfile = false,
   tabstop = 3,
   termguicolors = true,
   undofile = true,
   visualbell = false,
   -- whichwrap cannot be set via table (Neovim v0.7.2)
   whichwrap = 'b,s,h,l,<,>,[,]',
   wildmode = {'list', 'full'},
   wrap = true,
   writebackup = false,
}

for k, v in pairs(options) do
   vim.opt[k] = v
end
