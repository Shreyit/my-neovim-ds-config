return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        -- Enhanced transparency and effects
        transparent = true,
        italic_comments = true,
        borderless_pickers = false, -- Keep borders enabled
        hide_fillchars = false, -- Keep fillchars for visual separation
        
        -- BRIGHTER PASTEL NEON COLORS (more vibrant but still eye-friendly)
        colors = {
          -- Base colors - slightly brighter dark background
          bg = "#1e1e3f", -- Brighter purple-toned dark
          bg_alt = "#28284a", -- Lighter alternative
          bg_highlight = "#32325a", -- Brighter highlights
          
          -- Brighter pastel neon colors - more vibrant but still soft
          fg = "#f0f0ff", -- Bright lavender white
          grey = "#a0a0c0", -- Brighter grey
          blue = "#87b0ff", -- Bright pastel blue
          green = "#a6e3a1", -- Bright mint green
          cyan = "#89ddff", -- Bright sky cyan
          red = "#f38ba8", -- Bright coral
          yellow = "#f9e2af", -- Bright golden yellow
          magenta = "#cba6f7", -- Bright lavender
          pink = "#f5c2e7", -- Bright pink
          orange = "#fab387", -- Bright orange
          purple = "#b4befe", -- Bright lilac
        },
        
        -- Custom highlights with brighter colors
        highlights = {
          -- Enhanced syntax highlighting with brighter colors
          ["@function"] = { fg = "#a6e3a1", bold = true }, -- Bright mint
          ["@method"] = { fg = "#a6e3a1", italic = true }, -- Bright mint
          ["@function.call"] = { fg = "#89ddff" }, -- Bright cyan
          ["@variable"] = { fg = "#87b0ff" }, -- Bright blue
          ["@parameter"] = { fg = "#f9e2af", italic = true }, -- Bright gold
          ["@property"] = { fg = "#cba6f7" }, -- Bright lavender
          ["@field"] = { fg = "#f5c2e7" }, -- Bright pink
          ["@string"] = { fg = "#f9e2af" }, -- Bright gold
          ["@number"] = { fg = "#f5c2e7" }, -- Bright pink
          ["@boolean"] = { fg = "#f38ba8", bold = true }, -- Bright coral
          ["@keyword"] = { fg = "#b4befe", italic = true }, -- Bright lilac
          ["@type"] = { fg = "#89ddff" }, -- Bright cyan
          ["@namespace"] = { fg = "#87b0ff" }, -- Bright blue
          ["@comment"] = { fg = "#a0a0c0", italic = true }, -- Brighter grey
          
          -- Brighter visual effects
          Visual = { bg = "#87b0ff", fg = "#1e1e3f" }, -- Bright blue background
          Search = { bg = "#f9e2af", fg = "#1e1e3f", bold = true }, -- Bright gold
          IncSearch = { bg = "#cba6f7", fg = "#1e1e3f", bold = true }, -- Bright lavender
          
          -- Cursor effects
          CursorLine = { bg = "#28284a" }, -- Brighter highlight
          CursorLineNr = { fg = "#89ddff", bold = true }, -- Bright cyan
          
          -- ENHANCED BORDERS with brighter colors
          FloatBorder = { fg = "#89ddff", bg = "#1e1e3f" }, -- Bright cyan borders
          NormalFloat = { bg = "#1e1e3f" }, -- Solid background for floats
          WinSeparator = { fg = "#89ddff", bold = true }, -- Bright window separators
        },
        
        -- Enable extensions
        extensions = {
          telescope = true,
          notify = true,
          mini = true,
          cmp = true,
          lualine = false,
          treesitter = true,
          whichkey = true,
          gitsigns = true,
          indentblankline = true,
        }
      })
      
      -- Apply the colorscheme
      vim.cmd.colorscheme("cyberdream")
      
      -- ENHANCED BORDER CONFIGURATION
      -- Solid backgrounds for floating windows with bright borders
      vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e3f" }) -- SOLID background for floats
      vim.api.nvim_set_hl(0, "FloatBorder", { 
        fg = "#89ddff", 
        bg = "#1e1e3f",
        bold = true 
      })
      vim.api.nvim_set_hl(0, "NonText", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "Folded", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
      
      -- Bright, visible borders for all UI elements
      vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1e1e3f", fg = "#f0f0ff" })
      vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#87b0ff", fg = "#1e1e3f" })
      vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#89ddff", bold = true })
      
      -- Make nvim-tree borders clearly visible with bright colors
      vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "#1e1e3f" })
      vim.api.nvim_set_hl(0, "NvimTreeVertSplit", { fg = "#89ddff", bg = "#1e1e3f" })
      
      -- Bright borders for other UI elements
      vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#89ddff", bg = "#1e1e3f" })
      vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#1e1e3f" })
      vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = "#89ddff", bg = "#1e1e3f" })
      vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = "#89ddff", bg = "#1e1e3f" })
      
      -- Auto commands for consistent bright borders
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "NvimTree",
        callback = function()
          vim.api.nvim_win_set_option(0, "winhl", "Normal:NvimTreeNormal,EndOfBuffer:NvimTreeEndOfBuffer,VertSplit:WinSeparator")
        end,
      })
      
      -- Force bright borders on all floating windows
      vim.api.nvim_create_autocmd("WinNew", {
        callback = function()
          local config = vim.api.nvim_win_get_config(0)
          if config.relative ~= "" then -- it's a floating window
            vim.api.nvim_win_set_option(0, "winblend", 0) -- No transparency for floats
          end
        end,
      })
      
      -- Cyberpunk keybindings
      vim.keymap.set("n", "<leader>tt", ":CyberdreamToggleMode<CR>", {
        noremap = true,
        silent = true,
        desc = "Toggle cyberpunk mode"
      })
      
      -- Toggle transparency (now with bright border handling)
      vim.keymap.set("n", "<leader>tb", function()
        local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
        if normal_hl.bg then
          -- Enable transparency but keep borders bright and solid
          vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
          vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e3f" }) -- Keep floats solid
          vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#89ddff", bg = "#1e1e3f" })
          vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1e1e3f" })
          print("🌟 Bright Neon: Main transparency ON (bright borders visible)")
        else
          -- Enable solid background everywhere
          vim.api.nvim_set_hl(0, "Normal", { bg = "#1e1e3f" })
          vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e3f" })
          vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#89ddff", bg = "#1e1e3f" })
          vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1e1e3f" })
          print("🌈 Bright Neon: Solid background everywhere")
        end
      end, {
        noremap = true,
        silent = true,
        desc = "Toggle transparency"
      })
      
      print("✨ Bright Pastel Neon Theme Loaded!")
      print("   <leader>tt - Toggle light/dark")
      print("   <leader>tb - Toggle transparency (bright borders always visible)")
    end,
  }
}

