function! float#init#submode#hook_add() abort
   call submode#enter_with('bufmove', 'n', '', '<C-w>>', '<C-w>>')
   call submode#enter_with('bufmove', 'n', '', '<C-w><', '<C-w><')
   call submode#enter_with('bufmove', 'n', '', '<C-w>+', '<C-w>+')
   call submode#enter_with('bufmove', 'n', '', '<C-w>-', '<C-w>-')
   call submode#map('bufmove', 'n', '', '>', '<C-w>>')
   call submode#map('bufmove', 'n', '', '<', '<C-w><')
   call submode#map('bufmove', 'n', '', '+', '<C-w>+')
   call submode#map('bufmove', 'n', '', '-', '<C-w>-')
endfunction
