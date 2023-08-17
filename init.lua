require('base')
require('highlights')
require('maps')
require('plugins')

local has = function(x)
  return vim.fn.has(x) == 1
end

local is_win = has "win32"

if is_win == 1 then
  require('windows')
end
