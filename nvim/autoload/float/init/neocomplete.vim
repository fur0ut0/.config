function! float#init#neocomplete#hook_source()
   let g:neocomplete#enable_at_startup = 1
   let g:acp_enableAtStartup = 0

   let g:neocomplete#sources#syntax#min_keyword_length = 3
   let g:neocomplete#enable_smart_case = 1
   let g:neocomplete#enable_underbar_completion = 0
   let g:neocomplete#enable_camel_case_completion  =  0
   let g:neocomplete#max_list = 20
   let g:neocomplete#auto_completion_start_length = 3
   let g:neocomplete#max_keyword_width = 10000

   let g:neocomplete#enable_auto_close_preview = 0

   if !exists('g:neocomplete#keyword_patterns')
   let g:neocomplete#keyword_patterns = {}
   endif
   let g:neocomplete#keyword_patterns['default'] = '\h\w*'

   imap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"

   imap <expr><C-j> neosnippet#mappings#expand_or_jump_impl()
   smap <expr><C-j> neosnippet#mappings#expand_or_jump_impl()
   xmap <expr><C-j> neosnippet#mappings#expand_impl()

   imap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
   imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

   imap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
   imap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
   imap <expr><C-x><C-o> &filetype == 'vim' ? "\<C-x><C-v><C-p>" : neocomplete#manual_omni_complete()
   noremap <expr><C-g> neocomplete#undo_completion()

   autocmd BufReadPost,BufEnter,BufWritePost :neocompleteCachingBuffer <buffer>

   " Enable heavy omni completion.
   if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
   endif
   let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
   let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
   let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
endfunction
