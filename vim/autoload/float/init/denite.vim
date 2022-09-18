function! float#init#denite#hook_add() abort
   nnoremap [Denite] <Nop>
   nmap     [Myplug]u [Denite]

   nnoremap [Denite]b :<C-u>Denite buffer<CR>
   nnoremap [Denite]f :<C-u>Denite file_mru<CR>
   nnoremap [Denite]r :<C-u>Denite register<CR>
   nnoremap [Denite]g :<C-u>Denite grep<CR>
endfunction
