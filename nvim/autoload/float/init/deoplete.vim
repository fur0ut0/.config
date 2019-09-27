function! float#init#deoplete#hook_source()
   let g:deoplete#enable_at_startup = 1
   let g:deoplete#max_list = 10000

   let g:deoplete#auto_complete_delay = 0
   let g:deoplete#auto_complete_start_length = 1

   let g:deoplete#enable_smart_case = 1
   let g:deoplete#enable_camel_case = 0
   let g:deoplete#enable_ignore_case = 0

   let g:deoplete#enable_refresh_always = 0
   let g:deoplete#file#enable_buffer_path = 1

   imap <expr><C-j> neosnippet#mappings#expand_or_jump_impl()
   smap <expr><C-j> neosnippet#mappings#expand_or_jump_impl()
   xmap <expr><C-j> neosnippet#mappings#expand_impl()

   imap <expr><CR>  pumvisible() ? "\<C-y>" : "\<CR>"
   imap <expr><TAB> pumvisible() ? "\<C-n>" :
   \  neosnippet#expandable_or_jumpable() ?
   \  "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
   imap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

   imap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
   imap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

   noremap <expr><C-g> deoplete#undo_completion()

   call deoplete#custom#var('omni', 'input_patterns', {
   \  'ruby': ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::'],
   \})
endfunction
