local status, n = pcall(require, 'nord')
if (not status) then return end

-- Example config in lua
vim.g.nord_contrast = true
vim.g.nord_borders = false
vim.g.nord_disable_background = true
vim.g.nord_italic = true
vim.g.nord_uniform_diff_background = true
vim.g.nord_bold = true

-- Load the colorscheme
require('nord').set()


-- Bufferline
local highlights = require("nord").bufferline.highlights({
    italic = true,
    bold = true,
})

require("bufferline").setup({
    options = {
        separator_style = "thin",
    },
    highlights = highlights,
})
