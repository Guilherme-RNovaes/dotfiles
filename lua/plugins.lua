local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'arcticicestudio/nord-vim'
  use 'nvim-lualine/lualine.nvim'
  use 'L3MON4D3/LuaSnip'
  use 'ryanoasis/vim-devicons'
  use 'preservim/nerdtree'
  use 'tiagofumo/vim-nerdtree-syntax-highlight'
  use 'Xuyuanp/nerdtree-git-plugin'
  use 'nvim-lua/plenary.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use { 'neoclide/coc.nvim', branch = 'release' }

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'onsails/lspkind-nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
end)
