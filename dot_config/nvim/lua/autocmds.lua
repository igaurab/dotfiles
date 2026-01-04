require "nvchad.autocmds"

-- Disable icons in tabufline for minimal appearance
vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    -- Override devicons to return empty icons but keep highlight groups
    local ok, devicons = pcall(require, "nvim-web-devicons")
    if ok then
      devicons.get_icon = function(name, ext, opts)
        -- Return space instead of icon, but keep the default highlight
        return " ", "DevIconDefault"
      end

      devicons.get_icon_by_filetype = function(filetype, opts)
        return " ", "DevIconDefault"
      end
    end
  end,
})
