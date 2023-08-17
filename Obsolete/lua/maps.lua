local keymap = vim.keymap

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment/decrement
-- keymap.set('n', '+', '<C-a>')
-- keymap.set('n', '-', '<C-x>')

-- Delet a word backwards
-- keymap.set('n', 'dw', 'vb"_d')

-- Select all
-- keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Manipulate tabs
keymap.set('n', 'te', ':tabedit')
keymap.set('n', 'ty', ':bn<CR>')
keymap.set('n', 'tr', ':bt<CR>')
keymap.set('n', 'td', ':bd<CR>')

-- Move window
keymap.set('', '<C-h>', '<C-w>h')
keymap.set('', '<C-k>', '<C-w>k')
keymap.set('', '<C-j>', '<C-w>j')
keymap.set('', '<C-l>', '<C-w>l')
