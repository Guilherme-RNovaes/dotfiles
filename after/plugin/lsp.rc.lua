local status, lsp_config = pcall(require, 'lspconfig')
if (not status) then return end
local lspkind = require('lspkind')

local function formatForTailwindCSS(entry, vim_item)
  if vim_item.kind == 'Color' and entry.completion_item.documentation then
    local _, _, r, g, b = string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')
    if r then
      local color = string.format('%02x', r) .. string.format('%02x', g) .. string.format('%02x', b)
      local group = 'Tw_' .. color
      if vim.fn.hlID(group) < 1 then
        vim.api.nvim_set_hl(0, group, { fg = '#' .. color })
      end
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      vim_item.kind = "●"
      vim_item.kind_hl_group = group
      return vim_item
    end
  end
  vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
  return vim_item
end

require 'lspconfig'.clangd.setup {}
require "lsp_signature".setup()
vim.o.completeopt = 'menuone,noselect'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local cmp = require 'cmp'
local luasnip = require("luasnip")

local source_mapping = {
  nvim_lsp = " LSP",
  luasnip = " LSnip",
  path = " Path",
  buffer = "◉ Buffer"
}

vim.cmd [[ "Window cmp style colors
  "Completion and Documentation bg
  highlight! PmenuSel guibg=#282C34 guifg=NONE
  highlight! Pmenu guifg=#363a4f guibg=#24273a

  " gray
  highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
  " blue
  highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
  highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
  " light blue
  highlight! CmpItemKindVariable  guibg=NONE guifg=#9CDCFE
  highlight! link CmpItemKindInterface CmpItemKindVariable
  highlight! link CmpItemKindText CmpItemKindVariable
  " pink
  highlight! CmpItemKindFunction  guibg=NONE guifg=#C586C0
  highlight! link CmpItemKindMethod CmpItemKindFunction
  " front
  highlight! CmpItemKindKeyword  guibg=NONE guifg=#D4D4D4
  highlight! link CmpItemKindProperty CmpItemKindKeyword
  highlight! link CmpItemKindUnit CmpItemKindKeyword
]]

cmp.setup({
  window = {
    completion = cmp.config.window.bordered({
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 0,
    }),
    documentation = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
    },
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lua' },
  },

  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local menu = source_mapping[entry.source.name]
      vim_item.menu = menu
      vim_item.tailwind = formatForTailwindCSS(entry, vim_item)
      return vim_item
    end
  },

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-n>"] = cmp.mapping(
      cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      { "i", "s", "c" }
    ),
    ["<C-p>"] = cmp.mapping(
      cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      { "i", "s", "c" }
    ),
    ["<Tab>"] = cmp.mapping(function(fallback)
      -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
        if not entry then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        end
        cmp.confirm()
      else
        fallback()
      end
    end, {
      "i",
      "s",
      "c",
    }),
  },
  experimental = {
    ghost_text = false,
    native_menu = false,
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
})

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

lsp_config.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities
}

lsp_config.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lsp_config.lua_ls.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    enable_format_on_save(client, bufnr)
  end,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
    },
  },
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "\u{ea71}" },
    severity_sort = true,
  }
)

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})


require("luasnip/loaders/from_vscode").load()

require("cmp").setup.cmdline(":", {
  sources = {
    { name = "cmdline", keyword_length = 2 },
  },
})
