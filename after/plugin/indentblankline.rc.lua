local status, blankline = pcall(require, 'indent_blankline')
if (not status) then return end

vim.opt.list = true

blankline.setup {
  show_current_context = true,
  show_current_context_start = true,
}
