local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Plugin manager
  use 'arcticicestudio/nord-vim' -- Theme Nord
  use 'nvim-lualine/lualine.nvim' -- Lualine buffer navigation
  use 'ryanoasis/vim-devicons' -- Devicons
  use 'preservim/nerdtree' -- Tree for navigation
  use 'tiagofumo/vim-nerdtree-syntax-highlight' -- Nerdtree syntax highlight
  use 'Xuyuanp/nerdtree-git-plugin' -- gitsigns plugin for nerdtree
  use 'nvim-lua/plenary.nvim' -- plugin for telescope
  use 'norcalli/nvim-colorizer.lua' -- Highlight in css color items
  use 'nvim-telescope/telescope.nvim' -- File Finder
  use 'nvim-telescope/telescope-file-browser.nvim' -- Plugin for File Finder
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  } -- Syntax Highlighth for languages
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },           -- Required
      { 'williamboman/mason.nvim' },         -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional
      { 'onsails/lspkind.nvim' }, -- LSP language icons
      { 'glepnir/lspsaga.nvim' }, -- LSP Ui's

      -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
    }
  } -- LSP

  use 'windwp/nvim-autopairs' -- Auto pairs plugin
  use 'windwp/nvim-ts-autotag' -- Auto tag for typescript

  use 'lewis6991/gitsigns.nvim' -- Git signs plugin
end)
