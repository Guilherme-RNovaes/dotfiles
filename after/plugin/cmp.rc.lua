local cmp = require("cmp")
local types = require("cmp.types")
local str = require("cmp.utils.str")

local function formatForTailwindCSS(entry, vim_item)
  if vim_item.kind == 'Color' and entry.completion_item.documentation then
    local _, _, r, g, b = string.find(entry.completion_item.documentation, '^rgb%((%d+), (%d+), (%d+)')
    if r then
      local color = string.format('%02x', r) .. string.format('%02x', g) .. string.format('%02x', b)
      local group = 'Tw_' .. color
      if vim.fn.hlID(group) < 1 then
        vim.api.nvim_set_hl(0, group, { fg = '#' .. color })
      end
      vim_item.kind = "●"
      vim_item.kind_hl_group = group
      return vim_item
    end
  end
  vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
  return vim_item
end

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local luasnip = require("luasnip")

-- Do not jump to snippet if i'm outside of it
-- https://github.com/L3MON4D3/LuaSnip/issues/78
luasnip.config.setup({
	region_check_events = "CursorMoved",
	delete_check_events = "TextChanged",
})

local lspkind = require("lspkind")

cmp.setup({
	completion = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, scrollbar = "║" },  
  window = {
    documentation = {
		  border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		  scrollbar = "║",
	  },
  },
	formatting = {
    format = lspkind.cmp_format({
      maxwidth = 50,
      before = function(entry, vim_item)
        vim_item = formatForTailwindCSS(entry, vim_item)
        return vim_item
      end
    })
  },
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
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

	-- You should specify your *installed* sources.
	sources = {
		{ name = "cmp_git" },
		{ name = "lspkind" },
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
	},

	experimental = {
		ghost_text = false,
	},
})

require("cmp").setup.cmdline(":", {
	sources = {
		{ name = "cmdline", keyword_length = 2 },
	},
})

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
