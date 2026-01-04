-- Minimal statusline without icons
local M = {}

M.mode = function()
  local modes = {
    ["n"] = "NORMAL",
    ["no"] = "NORMAL",
    ["v"] = "VISUAL",
    ["V"] = "V-LINE",
    [""] = "V-BLOCK",
    ["s"] = "SELECT",
    ["S"] = "S-LINE",
    [""] = "S-BLOCK",
    ["i"] = "INSERT",
    ["ic"] = "INSERT",
    ["R"] = "REPLACE",
    ["Rv"] = "V-REPLACE",
    ["c"] = "COMMAND",
    ["cv"] = "VIM-EX",
    ["ce"] = "EX",
    ["r"] = "PROMPT",
    ["rm"] = "MORE",
    ["r?"] = "CONFIRM",
    ["!"] = "SHELL",
    ["t"] = "TERMINAL",
  }

  local m = vim.api.nvim_get_mode().mode
  return " " .. (modes[m] or "UNKNOWN") .. " "
end

M.file = function()
  local filename = vim.fn.expand("%:t")
  if filename == "" then
    filename = "[No Name]"
  end
  return " " .. filename .. " "
end

M.git = function()
  if not vim.b.gitsigns_head then
    return ""
  end
  return " " .. vim.b.gitsigns_head .. " "
end

M.position = function()
  local line = vim.fn.line(".")
  local total = vim.fn.line("$")
  local col = vim.fn.col(".")
  return " " .. line .. "/" .. total .. ":" .. col .. " "
end

M.run = function()
  return table.concat {
    M.mode(),
    M.file(),
    "%=", -- Right align
    M.git(),
    M.position(),
  }
end

return M
