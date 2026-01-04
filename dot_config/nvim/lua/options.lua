require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- Set minimal statusline
vim.opt.statusline = "%{%v:lua.require('statusline').run()%}"
