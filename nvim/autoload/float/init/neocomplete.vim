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


   inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"

   inoremap <expr><C-k> neosnippet#mappings#expand_or_jump_impl()
   snoremap <expr><C-k> neosnippet#mappings#expand_or_jump_impl()
   xnoremap <expr><C-k> neosnippet#mappings#expand_impl()

   inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
   inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

   inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
   inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
   inoremap <expr><C-x><C-o> &filetype == 'vim' ? "\<C-x><C-v><C-p>" : neocomplete#manual_omni_complete()
   noremap <expr><C-g> neocomplete#undo_completion()


   autocmd BufReadPost,BufEnter,BufWritePost :neocompleteCachingBuffer <buffer>

   autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
   autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
   autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
   autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
   autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
   autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

   " Enable heavy omni completion.
   if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
   endif
   let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
   let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
   let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
endfunction
