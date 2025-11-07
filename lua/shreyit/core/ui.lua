return function()
    -- Basic UI settings
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.cursorline = true
    vim.opt.signcolumn = "yes"
    vim.opt.showmode = false

    -- Better borders and windows
    vim.opt.winblend = 10
    vim.opt.pumblend = 10
    vim.opt.fillchars = {
        vert = "│",
        fold = " ",
        eob = " ",
        diff = "╱",
        msgsep = "─",
        foldopen = "",
        foldclose = "",
        foldsep = " ",
    }

    -- Better visual cues
    vim.opt.showmatch = true
    vim.opt.matchtime = 2
    vim.opt.scrolloff = 8
    vim.opt.sidescrolloff = 8

    -- Smoother scrolling
    vim.opt.mousescroll = "ver:1,hor:1"

    -- ============ BORDER CONFIGURATION ============
    
    -- Global border settings
    vim.opt.winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder"

    -- Apply borders to all float windows
    vim.api.nvim_set_hl(0, "FloatBorder", {
        fg = "#5ef1ff",  -- Cyberdream cyan color
        bg = "none",
    })

    vim.api.nvim_set_hl(0, "NormalFloat", {
        bg = "none",
    })

    -- Specific border for nvim-tree
    vim.api.nvim_set_hl(0, "NvimTreeNormal", {
        bg = "none",
    })

    vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", {
        bg = "none",
        fg = "none",
    })

    vim.api.nvim_set_hl(0, "NvimTreeVertSplit", {
        fg = "#5ef1ff",  -- Border color
        bg = "none",
    })

    -- Set border for the main editor
    vim.api.nvim_set_hl(0, "WinSeparator", {
        fg = "#5ef1ff",  -- Cyberdream cyan
        bg = "none",
    })

    -- Make which-key borders nicer
    vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "none" })

    -- Auto commands for borders
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "NvimTree",
        callback = function()
            vim.api.nvim_win_set_option(0, "winhl", "Normal:NvimTreeNormal,EndOfBuffer:NvimTreeEndOfBuffer,VertSplit:WinSeparator")
        end,
    })

    -- Force borders for all floating windows
    vim.api.nvim_create_autocmd("WinNew", {
        callback = function()
            local config = vim.api.nvim_win_get_config(0)
            if config.relative ~= "" then -- it's a floating window
                vim.api.nvim_win_set_option(0, "winblend", 10)
            end
        end,
    })
end
