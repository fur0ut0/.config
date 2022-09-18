function! float#init#coc#install_plugins() abort
   :CocInstall coc-solargraph
   :CocInstall coc-python
   :CocInstall coc-snippets
   :CocInstall coc-neosnippet
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

   " Highlight symbol under cursor on CursorHold
   autocmd CursorHold * silent call CocActionAsync('highlight')

   "---------------------------------------------------------------------------
   " Keymap

   " Diagnostic
   nmap <silent> [Coc]dp <Plug>(coc-diagnostic-prev)
   nmap <silent> [Coc]dn <Plug>(coc-diagnostic-next)

   " Jump to relevant elements
   nmap <silent> [Coc]gd <Plug>(coc-definition)
   nmap <silent> [Coc]gy <Plug>(coc-type-definition)
   nmap <silent> [Coc]gi <Plug>(coc-implementation)
   nmap <silent> [Coc]gr <Plug>(coc-references)
   nmap <silent> [Coc]gf <Plug>(coc-openlink)

   " Selection
   vmap <silent> [Coc]sif <Plug>(coc-funcobj-i)
   vmap <silent> [Coc]saf <Plug>(coc-funcobj-a)

   " Modification
   nmap [Coc]mr <Plug>(coc-rename)
   nmap [Coc]mf <Plug>(coc-fix-current)

   " Using CocList
   " Show all diagnostics
   nnoremap <silent> [Coc]la :<C-u>CocList diagnostics<cr>
   " Manage extensions
   nnoremap <silent> [Coc]le :<C-u>CocList extensions<cr>
   " Show commands
   nnoremap <silent> [Coc]lc :<C-u>CocList commands<cr>
   " Find symbol of current document
   nnoremap <silent> [Coc]lo :<C-u>CocList outline<cr>
   " Search workspace symbols
   nnoremap <silent> [Coc]ls :<C-u>CocList -I symbols<cr>
   " Do default action for next item.
   nnoremap <silent> [Coc]ln :<C-u>CocNext<CR>
   " Do default action for previous item.
   nnoremap <silent> [Coc]lp :<C-u>CocPrev<CR>
   " Resume latest coc list
   nnoremap <silent> [Coc]lr :<C-u>CocListResume<CR>
endfunction
