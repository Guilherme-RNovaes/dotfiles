vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.enconding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true -- Habilite Numbers on file

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true -- Show cmd
vim.opt.cmdheight = 1 -- set cmd heiht to 1 line
vim.opt.laststatus = 2
vim.opt.expandtab = true -- Insert tabs on the start of a line according to shiftwidth
vim.opt.scrolloff = 10 -- Minimum number of lines to keep above and below the cursor
vim.opt.backupskip = { '/tmp/*', 'private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true -- Insert tabs on the start of a line according to shiftwidth
vim.opt.breakindent = true -- Auto indent on breakline
vim.opt.shiftwidth = 2 -- Indent line with 2 spaces
vim.opt.tabstop = 2 -- Show existing tab with 2 spaces width
vim.opt.wrap = false -- No wrap lines
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }
