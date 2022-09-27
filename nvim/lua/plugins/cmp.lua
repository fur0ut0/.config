local cmp = require('cmp')

cmp.setup({
   sources = {{name = 'nvim_lsp'}, {name = 'buffer'}, {name = 'path'}},
   mapping = cmp.mapping.preset.insert({
      ['<Tab>'] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_next_item()
         else
            fallback()
         end
      end, {'i', 's'}),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.select_prev_item()
         else
            fallback()
         end
      end, {'i', 's'}),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-l>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm {select = true}
   }),
   experimental = {ghost_text = true}
})
cmp.setup.cmdline('/', {mapping = cmp.mapping.preset.cmdline(), sources = {{name = 'buffer'}}})
cmp.setup.cmdline(':', {mapping = cmp.mapping.preset.cmdline(), sources = {{name = 'path'}, {name = 'cmdline'}}})
