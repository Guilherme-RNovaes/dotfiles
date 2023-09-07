local status, db = pcall(require, 'dashboard')
if (not status) then return end

vim.cmd[[
  let g:indent_blankline_filetype_exclude = ['dashboard', 'oil']
]]

local function key(shortcut)
  shortcut.icon_hl = shortcut.icon_hl or "Title"
  shortcut.desc_hl = shortcut.desc_hl or "String"
  shortcut.key_hl = shortcut.key_hl or "Keyword"
  return shortcut
end

  db.setup{
    theme = 'doom', --  theme is doom and hyper default is hyper
    config = {
      header = {
        "","", "", "", "", "","", "", "", "", "", "",
        [[ ███▄    █     ▒█████      ██▓    ▄████▄     ▓█████   ]],
        [[ ██ ▀█   █    ▒██▒  ██▒   ▓██▒   ▒██▀ ▀█     ▓█   ▀   ]],
        [[▓██  ▀█ ██▒   ▒██░  ██▒   ▒██▒   ▒▓█    ▄    ▒███     ]],
        [[▓██▒  ▐▌██▒   ▒██   ██░   ░██░   ▒▓▓▄ ▄██▒   ▒▓█  ▄   ]],
        [[▒██░   ▓██░   ░ ████▓▒░   ░██░   ▒ ▓███▀ ░   ░▒████▒  ]],
        [[░ ▒░   ▒ ▒    ░ ▒░▒░▒░    ░▓     ░ ░▒ ▒  ░   ░░ ▒░ ░  ]],
        [[░ ░░   ░ ▒░     ░ ▒ ▒░     ▒ ░     ░  ▒       ░ ░  ░  ]],
        [[   ░   ░ ░    ░ ░ ░ ▒      ▒ ░   ░              ░     ]],
        [[         ░        ░ ░      ░     ░ ░            ░  ░  ]],
        [[                                 ░                    ]],
      "",""
    }, --your header
      center = {
        key { icon = "  ", desc = "Telescope", key = "fw", action = "Telescope" },
        key { icon = "  ", desc = "Find Files", key = "ff", action = "Telescope find_files" },
        key { icon = "  ", desc = "Help", key = "fh", action = "Telescope help_tags" },
      },
      footer = {
      ' My Dashboard',
    }  --your footer
    },    --  config used for theme
    hide = {
      statusline = false,    -- hide statusline default is true
    },
    preview = {},
  }
