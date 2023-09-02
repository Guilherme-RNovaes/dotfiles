local status, db = pcall(require, 'dashboard-nvim')
if (not status) then return end

  db.setup{
    theme = 'doom', --  theme is doom and hyper default is hyper
    config = {
      header = {}, --your header
      center = {
        {
          icon = ' ',
          icon_hl = 'Title',
          desc = 'Find File           ',
          desc_hl = 'String',
          key = 'b',
          keymap = 'SPC f f',
          key_hl = 'Number',
          action = 'lua print(2)'
        },
        {
          icon = ' ',
          desc = 'Find Dotfiles',
          key = 'f',
          keymap = 'SPC f d',
          action = 'lua print(3)'
        },
      },
      footer = {}  --your footer
    },    --  config used for theme
    hide = {
      statusline = false,    -- hide statusline default is true
    },
    preview = {},
  }
