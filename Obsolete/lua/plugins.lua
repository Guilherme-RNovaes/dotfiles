local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'shaunsingh/nord.nvim'
  use 'hoob3rt/lualine' -- Statusline
  use 'neovim/nvim-lspconfig' -- LSP
end)


