vim.cmd [[
try
   source $XDG_CONFIG_HOME/nvim/local/colormode.vim
catch
endtry

if exists('g:colormode') && g:colormode == "light"
   set background=light
   try
     colorscheme dayfox
   catch
     colorscheme default
   endtry
else
   set background=dark
   try
     colorscheme dracula
   catch
     colorscheme default
   endtry
endif
]]
