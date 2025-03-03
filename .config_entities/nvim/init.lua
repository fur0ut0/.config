if vim.fn.exists('g:vscode') == 0 then
    require('one').setup {}
end

-- clipboard sharing
vim.api.nvim_command('set clipboard&')
vim.api.nvim_command('set clipboard^=unnamedplus')
