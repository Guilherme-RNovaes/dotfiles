local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

local filetypes = {
  'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
  'xml',
  'php',
  'markdown',
  'astro', 'glimmer', 'handlebars', 'hbs'
}

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "markdown",
    "markdown_inline",
    "tsx",
    "javascript",
    "typescript",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "swift",
    "css",
    "html",
    "lua"
  },
  autotag = {
    enable = true,
    ebable_rename = true,
    enable_close = true,
    enable_close_on_slash = true,
    filetypes = filetypes,
  },
  context_commentstring = {
    enable         = true,
    enable_autocmd = false,
  },

  auto_install = true,
  sync_install = false,
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
