local set = vim.keymap.set

set('', '<Up>', '<Nop>')
set('', '<Down>', '<Nop>')
set('', '<Left>', '<Nop>')
set('', '<Right>', '<Nop>')

set('n', '[Myplug]', '<Nop>')
set('n', '<Space>', '[Myplug]', {remap = true})

set('', 'j', 'gj')
set('', 'k', 'gk')

set('n', '<C-k>t', ':<C-u>tabnew<CR>')
set('n', '<C-k>n', ':<C-u>bnext<CR>')
set('n', '<C-k>p', ':<C-u>bprev<CR>')
set('n', '<C-k>q', ':<C-u>bdel<CR>')
set('n', '<C-k>N', ':<C-u>cnext<CR>')
set('n', '<C-k>P', ':<C-u>cprev<CR>')

set('n', '<C-c>', '<C-c>:<C-u>syntax sync fromstart<CR>', {silent = true})
set('n', '<C-l>', '<C-l>:<C-u>nohlsearch<CR>', {silent = true})

set('i', '<expr><CR>', 'pumvisible() ? "<C-y>" : "<CR>"')
set('i', '<expr><TAB>', 'pumvisible() ? "<C-n>" : "<TAB>"', {remap = true})
set('i', '<expr><S-TAB>', 'pumvisible() ? "<C-p>" : "<S-TAB>"', {remap = true})