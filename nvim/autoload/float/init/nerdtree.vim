function! float#init#nerdtree#hook_add() abort
   nnoremap [Myplug]n :<C-u>NERDTreeToggle<CR>

   " use nerdtree when opening directory
   autocmd StdinReadPre * let s:std_in=1
   autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
endfunction
