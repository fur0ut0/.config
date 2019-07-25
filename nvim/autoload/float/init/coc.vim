function! float#init#coc#hook_post_update() abort
   :CocInstall coc-solargraph
   :CocInstall coc-python
endfunction

function! float#init#coc#hook_add() abort
   nnoremap [Coc] <Nop>
   nmap     [Myplug]c [Coc]

   set statusline+=[Coc:%{StatusDiagnostic()}]
   function! StatusDiagnostic() abort
      let info = get(b:, 'coc_diagnostic_info', {})
      if empty(info) | return '' | endif
      let msgs = []
      if get(info, 'error', 0)
         call add(msgs, 'E' . info['error'])
      endif
      if get(info, 'warning', 0)
         call add(msgs, 'W' . info['warning'])
      endif
      return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
   endfunction

   " Use `[c` and `]c` for navigate diagnostics
   nmap <silent> [Coc]p <Plug>(coc-diagnostic-prev)
   nmap <silent> [Coc]n <Plug>(coc-diagnostic-next)

   " Remap keys for gotos
   nmap <silent> [Coc]gd <Plug>(coc-definition)
   nmap <silent> [Coc]gy <Plug>(coc-type-definition)
   nmap <silent> [Coc]gi <Plug>(coc-implementation)
   nmap <silent> [Coc]gr <Plug>(coc-references)
   nmap <silent> [Coc]gf <Plug>(coc-openlink)

   " Use K for show documentation in preview window
   nnoremap <silent> K :call <SID>show_documentation()<CR>
   function! s:show_documentation()
      if &filetype == 'vim'
         execute 'h '.expand('<cword>')
      else
         call CocAction('doHover')
      endif
   endfunction

   " Highlight symbol under cursor on CursorHold
   autocmd CursorHold * silent call CocActionAsync('highlight')

   " Remap for rename current word
   nmap [Coc]rn <Plug>(coc-rename)

   " Remap for format selected region
   vmap [Coc]f  <Plug>(coc-format-selected)
   nmap [Coc]f  <Plug>(coc-format-selected)

   " Remap for do codeAction of selected region, ex: `[Coc]aap` for current paragraph
   vmap [Coc]a  <Plug>(coc-codeaction-selected)
   nmap [Coc]a  <Plug>(coc-codeaction-selected)

   " Remap for do codeAction of current line
   nmap [Coc]ac <Plug>(coc-codeaction)
   " Fix autofix problem of current line
   nmap [Coc]qf <Plug>(coc-fix-current)

   " Use `:Format` for format current buffer
   command! -nargs=0 Format :call CocAction('format')

   " Use `:Fold` for fold current buffer
   command! -nargs=? Fold   :call CocAction('fold', <f-args>)

   " Using CocList
   " Show all diagnostics
   nnoremap <silent> [Coc]ca :<C-u>CocList diagnostics<cr>
   " Manage extensions
   nnoremap <silent> [Coc]ce :<C-u>CocList extensions<cr>
   " Show commands
   nnoremap <silent> [Coc]cc :<C-u>CocList commands<cr>
   " Find symbol of current document
   nnoremap <silent> [Coc]co :<C-u>CocList outline<cr>
   " Search workspace symbols
   nnoremap <silent> [Coc]cs :<C-u>CocList -I symbols<cr>
   " Do default action for next item.
   nnoremap <silent> [Coc]cj :<C-u>CocNext<CR>
   " Do default action for previous item.
   nnoremap <silent> [Coc]ck :<C-u>CocPrev<CR>
   " Resume latest coc list
   nnoremap <silent> [Coc]cp :<C-u>CocListResume<CR>
endfunction
