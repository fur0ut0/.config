function! float#init#deoplete#hook_source()
   let g:deoplete#enable_at_startup = 1

    call deoplete#custom#option({
    \  'max_list': 10000,
    \  'smart_case': v:true,
    \ })

   imap <expr><C-j> neosnippet#mappings#expand_or_jump_impl()
   smap <expr><C-j> neosnippet#mappings#expand_or_jump_impl()
   xmap <expr><C-j> neosnippet#mappings#expand_impl()

   inoremap <expr><CR>  pumvisible() ? "\<C-y>" : "\<CR>"
   imap <expr><TAB> pumvisible() ? "\<C-n>" :
   \  neosnippet#expandable_or_jumpable() ?
   \  "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
   inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

   imap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
   imap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

   map <expr><C-g> deoplete#undo_completion()
endfunction
