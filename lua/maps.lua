local keymap = vim.keymap

-- Manipulate tabs
keymap.set('n', 'te', ':tabe<CR>')
keymap.set('n', 'ty', ':bn<CR>')
keymap.set('n', 'tr', ':bp<CR>')
keymap.set('n', 'td', ':bd<CR>')

-- Move window
keymap.set('', '<C-h>', '<C-w>h')
keymap.set('', '<C-k>', '<C-w>k')
keymap.set('', '<C-j>', '<C-w>j')
keymap.set('', '<C-l>', '<C-w>l')