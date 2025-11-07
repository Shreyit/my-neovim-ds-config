return {
  -- Mason - LSP manager
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  -- Mason LSP config
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "pyright",       -- Python (Microsoft) - BEST for data science
        "r_language_server", -- R
        "bashls",        -- Shell scripts
        "lua_ls",        -- Lua (for Neovim config)
        "jsonls",        -- JSON config files
      },
    },
  },

  -- LSP config
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      
      -- Python (Pyright) - Optimized for data science
      lspconfig.pyright.setup({
        settings = {
          pyright = {
            analysis = {
              typeCheckingMode = "off", -- Faster, less strict
              autoSearchPaths = true,
              useLibraryCodeForTypes = true
            }
          }
        }
      })

      -- R Language Server
      lspconfig.r_language_server.setup({})

      -- Bash
      lspconfig.bashls.setup({})

      -- Lua
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      })
    end
  },

  -- Formatters & Linters for data science
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "black",          -- Python formatter
        "isort",          -- Python import sorter
        "pylint",         -- Python linter
        "stylua",         -- Lua formatter
        "prettier",       -- JSON/other formatter
      },
    },
  },
}
