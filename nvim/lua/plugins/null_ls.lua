local null_ls = require('null-ls')

local sources = {null_ls.builtins.formatting.lua_format}

null_ls.setup({sources = sources})
