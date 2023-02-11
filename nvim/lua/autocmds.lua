local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local numbertoggle = augroup('numbertoggle', {clear = true})
autocmd({'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter'}, {
   group = numbertoggle,
   pattern = {'*'},
   callback = function() if vim.o.number and vim.fn.mode() ~= 'i' then vim.o.relativenumber = true end end
})
autocmd({'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave'}, {
   group = numbertoggle,
   pattern = {'*'},
   callback = function() if vim.o.number then vim.o.relativenumber = false end end
})

-- copy yanked text to windows clipboard in WSL
local winshareclip = augroup('winshareclip', {clear = true})
autocmd({'TextyankPost'},{
   group = winshareclip,
   pattern = {'*'},
   callback = function() vim.fn.system('clip.exe', vim.fn.getreg('')) end,
})
