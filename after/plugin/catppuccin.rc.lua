--vim.cmd[[
  --if exists('+termguicolors')
    --let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    --let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    --set termguicolors
  --endif

  --let g:catppuccin_style = 'catppuccin'
  --let g:catppuccin_enable_italic = 1
  --let g:catppuccin_disable_italic_comment = 0
  --let g:catppuccin_diagnostic_line_highlight = 1
  --let g:catppuccin_current_word = 'bold'
  --colorscheme catppuccin-macchiato

  --if (has("nvim"))
    --highlight Normal guibg=NONE ctermbg=NONE
    --highlight EndOfBuffer guibg=NONE ctermbg=NONE
  --endif
--]]

require("catppuccin").setup({
  flavour = "macchiato", -- latte, frappe, macchiato, mocha
  transparent_background = true, -- disables setting the background color.
  show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
  term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
  dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.5,
	},
  styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic" }, -- Change the style of comments
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    treesitter = true,
    mason = true,
    notify = false,
    mini = false,
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})

vim.cmd[[colorscheme catppuccin-macchiato]]
