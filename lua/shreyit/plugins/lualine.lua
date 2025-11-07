return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = {
      -- Cyberpunk neon colors to match Cyberdream theme
      blue = "#5ea1ff",
      green = "#5eff6c",
      cyan = "#5ef1ff",
      magenta = "#ff5ef1",
      pink = "#ff5ea0",
      orange = "#ffbd5e",
      purple = "#bd5eff",
      red = "#ff6e5e",
      yellow = "#f1ff5e",
      
      -- Cyberpunk background colors
      bg = "#0a0a12",
      bg_alt = "#0d0d1a",
      fg = "#ffffff",
      grey = "#7b8496",
      inactive_bg = "#1a1a2a",
    }

    local cyberpunk_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = "#000000", gui = "bold" },
        b = { bg = colors.bg_alt, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.grey },
      },
      insert = {
        a = { bg = colors.green, fg = "#000000", gui = "bold" },
        b = { bg = colors.bg_alt, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.grey },
      },
      visual = {
        a = { bg = colors.magenta, fg = "#000000", gui = "bold" },
        b = { bg = colors.bg_alt, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.grey },
      },
      command = {
        a = { bg = colors.orange, fg = "#000000", gui = "bold" },
        b = { bg = colors.bg_alt, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.grey },
      },
      replace = {
        a = { bg = colors.red, fg = "#000000", gui = "bold" },
        b = { bg = colors.bg_alt, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.grey },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.grey, gui = "bold" },
        b = { bg = colors.inactive_bg, fg = colors.grey },
        c = { bg = colors.inactive_bg, fg = colors.grey },
      },
    }

    -- Configure lualine with cyberpunk theme
    lualine.setup({
      options = {
        theme = cyberpunk_lualine_theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = colors.orange }, -- Orange for updates
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    })
  end,
}
