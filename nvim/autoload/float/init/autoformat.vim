function! float#init#autoformat#hook_add() abort
   let g:formatters_cuda = ['clangformat']

   nmap [Myplug]p :<C-u>Autoformat<CR>
endfunction

