function! float#init#language_client#hook_source() abort
   let g:LanguageClient_serverCommands = {
   \  'cpp': ['ccls'],
   \}

   "---------------------------------------------------------------------------
   " Keymap

   nnoremap [LS] <Nop>
   nmap     [Myplug]l [LS]

   " Jump to relevant elements
   nmap <silent> [Coc]d <Plug>(lcn-definition)
   nmap <silent> [Coc]t <Plug>(lcn-type-definition)
   nmap <silent> [Coc]i <Plug>(lcn-implementation)
   nmap <silent> [Coc]r <Plug>(lcn-references)

   " Modification
   nmap [Coc]<F2> <Plug>(lcn-rename)
endfunction
