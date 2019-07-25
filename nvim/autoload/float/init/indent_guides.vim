function! float#init#indent_guides#hook_add() abort
   let g:indent_guides_enable_on_vim_startup = 1

   let g:indent_guides_start_level = 2
   let g:indent_guides_guide_size = 1

   let g:indent_guides_auto_colors = 0
   autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#f4f4f4 ctermbg=254
   autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#f0f0f0 ctermbg=255
endfunction
