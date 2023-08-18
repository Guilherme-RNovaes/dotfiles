local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup({
  -- Unnable autopairs for the selected file
  disable_filetype = { "TelescopePrompt" },
})
