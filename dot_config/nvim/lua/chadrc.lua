-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "gruvbox",
	integrations = {},

	hl_override = {
		-- Remove statusline background
		StatusLine = { bg = "NONE" },
		StatusLineNC = { bg = "NONE" },
	},
}

-- M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = {
    enabled = true,
    lazyload = false,
    order = { "buffers" }, -- Only show buffers, remove treeOffset and tabs
    modules = nil,
  },

  statusline = {
    enabled = true,
    theme = "minimal",
    separator_style = "default",
    order = nil,
    modules = nil,
  },
}

return M
