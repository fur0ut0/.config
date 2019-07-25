function! float#init#session#hook_add()
   let g:session_directory = expand("$XDG_DATA_HOME/nvim/sessions")
   let g:session_autosave = 'yes'
   let g:session_autoload = 'yes'
endfunction
