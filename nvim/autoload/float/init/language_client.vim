function! float#init#language_client#hook_add() abort
   let g:LanguageClient_serverCommands = {
   \  'ruby': [ 'solargraph', 'stdio' ],
   \}
endfunction
