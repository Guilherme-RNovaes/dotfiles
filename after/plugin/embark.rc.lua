vim.cmd[[
  if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif

  let g:embark_style = 'embark'
  let g:embark_enable_italic = 1
  let g:embark_disable_italic_comment = 0
  let g:embark_diagnostic_line_highlight = 1
  let g:embark_current_word = 'bold'
  colorscheme embark

  if (has("nvim"))
    highlight Normal guibg=NONE ctermbg=NONE
    highlight EndOfBuffer guibg=NONE ctermbg=NONE
  endif
]]
