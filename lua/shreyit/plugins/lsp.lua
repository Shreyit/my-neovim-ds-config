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
				"pyright", -- Python (Microsoft) - BEST for data science
				"r_language_server", -- R
				"bashls", -- Shell scripts
				"lua_ls", -- Lua (for Neovim config)
				"jsonls", -- JSON config files
			},
		},
	},
	-- LSP config
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Use the new vim.lsp.config API for Neovim 0.11+
			if vim.fn.has("nvim-0.11") == 1 then
				-- Python (Pyright) - Optimized for data science
				vim.lsp.config.pyright = {
					cmd = { "pyright-langserver", "--stdio" },
					filetypes = { "python" },
					root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
					settings = {
						pyright = {
							analysis = {
								typeCheckingMode = "off", -- Faster, less strict
								autoSearchPaths = true,
								useLibraryCodeForTypes = true,
							},
						},
					},
				}

				-- R Language Server
				vim.lsp.config.r_language_server = {
					cmd = { "R", "--slave", "-e", "languageserver::run()" },
					filetypes = { "r", "rmd" },
					root_markers = { ".git", "DESCRIPTION" },
				}

				-- Bash
				vim.lsp.config.bashls = {
					cmd = { "bash-language-server", "start" },
					filetypes = { "sh", "bash" },
					root_markers = { ".git" },
				}

				-- Lua
				vim.lsp.config.lua_ls = {
					cmd = { "lua-language-server" },
					filetypes = { "lua" },
					root_markers = {
						".luarc.json",
						".luarc.jsonc",
						".luacheckrc",
						".stylua.toml",
						"stylua.toml",
						"selene.toml",
						"selene.yml",
						".git",
					},
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				}

				-- Enable LSP servers
				vim.lsp.enable("pyright")
				vim.lsp.enable("r_language_server")
				vim.lsp.enable("bashls")
				vim.lsp.enable("lua_ls")
			else
				-- Fallback to old lspconfig API for Neovim < 0.11
				local lspconfig = require("lspconfig")

				-- Python (Pyright) - Optimized for data science
				lspconfig.pyright.setup({
					settings = {
						pyright = {
							analysis = {
								typeCheckingMode = "off", -- Faster, less strict
								autoSearchPaths = true,
								useLibraryCodeForTypes = true,
							},
						},
					},
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
								globals = { "vim" },
							},
						},
					},
				})
			end
		end,
	},
	-- Formatters & Linters for data science
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"black", -- Python formatter
				"isort", -- Python import sorter
				"pylint", -- Python linter
				"stylua", -- Lua formatter
				"prettier", -- JSON/other formatter
			},
		},
	},
}
