local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  -- Plugin Manager
  use 'wbthomason/packer.nvim' -- Plugin manager

  -- Appearence
  use 'glepnir/dashboard-nvim'
  use 'arcticicestudio/nord-vim' -- Theme Nord
  use { 'embark-theme/vim', as = 'embark' } -- Theme Embark
  use { "catppuccin/nvim", as = "catppuccin" } -- Theme Catppuccin
  use 'ryanoasis/vim-devicons' -- Devicons
  use 'nvim-tree/nvim-web-devicons' -- Devicons lua

  -- Utils
  use "lukas-reineke/indent-blankline.nvim"
  use 'numToStr/Comment.nvim' -- Plugin for comment lines
  use 'nvim-lualine/lualine.nvim' -- Lualine buffer navigation
  use 'preservim/nerdtree' -- Tree for navigation
  use 'tiagofumo/vim-nerdtree-syntax-highlight' -- Nerdtree syntax highlight
  use {
      'stevearc/oil.nvim', -- It's a tree for manipulating archives in the project
      config = function() require('oil').setup() end
    }
  use 'Xuyuanp/nerdtree-git-plugin' -- gitsigns plugin for nerdtree
  use 'fedepujol/move.nvim' -- Gain the power to move lines and blocks!
  use 'nvim-lua/plenary.nvim' -- plugin for telescope
  use 'norcalli/nvim-colorizer.lua' -- Highlight in css color items
  use 'nvim-telescope/telescope.nvim' -- File Finder
  use 'nvim-telescope/telescope-file-browser.nvim' -- Plugin for File Finder
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  } -- Syntax Highlighth for languages
  use 'williamboman/mason.nvim'         -- Optional
  use 'williamboman/mason-lspconfig.nvim' -- Optional
  use {
      -- LSP Support
      'neovim/nvim-lspconfig',           -- Required
      'onsails/lspkind.nvim', -- LSP language icons
      'glepnir/lspsaga.nvim', -- LSP Ui's

      -- Autocompletion
		  'hrsh7th/nvim-cmp',
		  'hrsh7th/cmp-buffer',
		  'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
		  'saadparwaiz1/cmp_luasnip',
		  'hrsh7th/cmp-nvim-lsp',
		  'hrsh7th/cmp-nvim-lua',
      'ray-x/lsp_signature.nvim',

		  -- Snippets
		  'L3MON4D3/LuaSnip',
		  'rafamadriz/friendly-snippets',
  } -- LSP

  use 'windwp/nvim-autopairs' -- Auto pairs plugin
  use 'windwp/nvim-ts-autotag' -- Auto tag for typescript

  -- Git Plugins
  use 'lewis6991/gitsigns.nvim' -- Git signs plugin
  use 'dinhhuy258/git.nvim' -- For git blame and broser
end)
