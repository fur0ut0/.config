function! float#init#quickrun#hook_source() abort
   let g:quickrun_config = {
   \  '_' : {
   \     'hook/close_quickfix/enable_hook_loaded' : 1,
   \     'hook/close_quickfix/enable_success' : 1,
   \     'hook/close_buffer/enable_empty_data' : 1,
   \     'hook/shabadoubi_touch_henshin/enable' : 1,
   \     'hook/shabadoubi_touch_henshin/wait' : 10,
   \     'runner' : 'vimproc',
   \     'runner/vimproc/updatetime' : 40,
   \     'outputter/error/success' : 'buffer',
   \     'outputter/error/error' : 'quickfix',
   \  },
   \  'tex' : {
   \     'command' : 'latexmk',
   \     'outputter' : 'error',
   \     'outputter/error/success' : 'null',
   \     'outputter/error/error' : 'quickfix',
   \     'srcfile' : expand('%'),
   \     'cmdopt': '-pv -pdfdvi',
   \     'hook/sweep/files' : [
   \        '%S:p:r.aux',
   \        '%S:p:r.bbl',
   \        '%S:p:r.blg',
   \        '%S:p:r.dvi',
   \        '%S:p:r.fdb_latexmk',
   \        '%S:p:r.fls',
   \        '%S:p:r.log',
   \        '%S:p:r.out',
   \        '%S:p:r.synctex.gz'
   \     ],
   \     'exec': '%c %o %a %s',
   \  },
   \  'gnuplot' : {
   \     'command' : 'gnuplot',
   \     'outputter' : 'error',
   \     'outputter/error/success' : 'null',
   \     'outputter/error/error' : 'quickfix',
   \     'srcfile' : expand('%'),
   \     'exec': '%c %s',
   \  },
   \  'bib' : {
   \     'command' : 'bib2html_wrapper.sh',
   \     'srcfile' : expand('%:p'),
   \     'outputter' : 'error',
   \     'outputter/error/success' : 'null',
   \     'outputter/error/error' : 'quickfix',
   \     'exec': '%c %o %s',
   \  },
   \  'cpp' :{
   \     'command' : 'g++',
   \     'cmdopt': '-std=c++14',
   \  },
   \}

   let g:tex_conceal=''

   autocmd BufWritePost,FileWritePost *.bib :QuickRun bib
endfunction

function! float#init#quickrun#hook_add() abort
   vnoremap <silent><buffer> <F5> :QuickRun -mode v -type tmptex<CR>
   nnoremap <silent><F5> :<C-u>QuickRun<CR>
endfunction

