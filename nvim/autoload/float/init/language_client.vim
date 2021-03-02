function! float#init#language_client#hook_add() abort
   let g:LanguageClient_serverCommands = {
   \  'c': ['ccls'],
   \  'cpp': ['ccls'],
   \  'rust': ['rls'],
   \  'python': ['pyls'],
   \  'ruby': ['solargraph'],
   \}

   "---------------------------------------------------------------------------
   " Keymap

   nnoremap [LS] <Nop>
   nmap     [Myplug]l [LS]

   " Jump to relevant elements
   nmap <silent> [LS]d <Plug>(lcn-definition)
   nmap <silent> [LS]t <Plug>(lcn-type-definition)
   nmap <silent> [LS]i <Plug>(lcn-implementation)
   nmap <silent> [LS]r <Plug>(lcn-references)

   " Modification
   nmap [LS]<F2> <Plug>(lcn-rename)
   nmap [LS]f <Plug>(lcn-format)
endfunction
