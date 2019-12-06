function! float#init#clang-format#hook_source() abort
   let g:clang_format#detect_style_file = 1
   let g:clang_format#style_options = {
      \ "AccessModifierOffset" : -4,
      \ "AllowShortIfStatementsOnASingleLine" : "true",
      \ "AlwaysBreakTemplateDeclarations" : "true",
      \ "Standard" : "C++17"}

   autocmd FileType c,cpp ClangFormatAutoEnable
endfunction
