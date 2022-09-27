vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
                                                                   {virtual_text = false})

-- Reference highlight
vim.cmd [[
set updatetime=500
highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
]]

vim.keymap.set('n', '[Myplug]l', '[Lsp]', {remap = true})

vim.keymap.set('n', '[Lsp]h', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '[Lsp]f', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
vim.keymap.set('n', '[Lsp]r', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', '[Lsp]d', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', '[Lsp]D', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', '[Lsp]i', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', '[Lsp]t', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
vim.keymap.set('n', '[Lsp]n', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', '[Lsp]a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', '[Lsp]s', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
vim.keymap.set('n', '[Lsp]e', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '[Lsp]]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', '[Lsp][', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
