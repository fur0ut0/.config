local ensure_packer = function()
   local fn = vim.fn
   local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
   if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
      vim.cmd [[packadd packer.nvim]]
      return true
   end
   return false
end

local packer_bootstrap = ensure_packer()

local ok, packer = pcall(require, 'packer')
if not ok then return end

packer.init({display = {open_fn = function() return require('packer.util').float({border = 'rounded'}) end}})

vim.cmd([[
augroup packer_user_config
   autocmd!
   autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

return packer.startup(function(use)
   use({'wbthomason/packer.nvim'})

   -- colorscheme
   use({'EdenEast/nightfox.nvim'})
   use({'dracula/vim'})

   -- statusline
   use({'feline-nvim/feline.nvim', config = function() require('plugins.feline') end})
   use({'kyazdani42/nvim-web-devicons'})
   use({'lewis6991/gitsigns.nvim', tag = 'release', config = function() require('plugins.gitsigns') end})

   -- display
   use({'thinca/vim-zenspace'})
   use({'bronson/vim-trailing-whitespace'})
   use({'nathanaelkane/vim-indent-guides', config = function() require('plugins.indent_guides') end})
   use({'tpope/vim-sleuth'})
   --use({'nvim-treesitter/nvim-treesitter', config = function() require('plugins.treesitter') end, run = ':TSUpdate'})

   -- operation
   use({'cohama/lexima.vim'})
   use({'junegunn/vim-easy-align', config = function() require('plugins.easy_align') end})
   use({'tpope/vim-surround'})
   use({'tpope/vim-repeat'})
   use({'tpope/vim-fugitive'})

   -- lsp
   --use({'williamboman/mason.nvim', config = function() require('plugins.mason') end})
   --use({'williamboman/mason-lspconfig.nvim', config = function() require('plugins.mason_lspconfig') end})
   --use({'neovim/nvim-lspconfig', config = function() require('plugins.lspconfig') end})
   use({
      'jose-elias-alvarez/null-ls.nvim',
      config = function() require('plugins.null_ls') end,
      requires = {'nvim-lua/plenary.nvim'}
   })
   use({'ray-x/lsp_signature.nvim', config = function() require('plugins.lsp_signature') end})

   -- completion
   use({'hrsh7th/cmp-buffer'})
   use({'hrsh7th/cmp-path'})
   use({'hrsh7th/cmp-cmdline'})
   use({'hrsh7th/cmp-nvim-lsp'})
   use({'onsails/lspkind.nvim'})
   use({'hrsh7th/nvim-cmp', config = function() require('plugins.cmp') end})

   -- util
   use({'junegunn/fzf'})

   if packer_bootstrap then require('packer').sync() end
end)
