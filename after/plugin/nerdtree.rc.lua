local status, nerdtree = pcall(require, "nerdtree")

vim.keymap.set('n', '<C-a>', ':NERDTreeToggle<CR>')
