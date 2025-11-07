return {
	-- R.nvim - Main R plugin
	{
		"R-nvim/R.nvim",
		lazy = false,
		config = function()
			vim.g.rout_follow_colorscheme = true
			vim.g.R_assign = 2 -- Don't auto-replace _ with <-

			local opts = {
				R_args = { "--quiet", "--no-save" },
				hook = {
					on_filetype = function()
						-- Send code mappings
						vim.keymap.set("n", "<Enter>", "<Plug>RDSendLine", { buffer = true, desc = "Send line to R" })
						vim.keymap.set(
							"v",
							"<Enter>",
							"<Plug>RSendSelection",
							{ buffer = true, desc = "Send selection to R" }
						)

						-- Control mappings
						vim.keymap.set("n", "<LocalLeader>rf", "<Plug>RStart", { buffer = true, desc = "Start R" })
						vim.keymap.set("n", "<LocalLeader>rq", "<Plug>RClose", { buffer = true, desc = "Close R" })
						vim.keymap.set(
							"n",
							"<LocalLeader>ro",
							"<Plug>ROBToggle",
							{ buffer = true, desc = "Toggle object browser" }
						)
						vim.keymap.set("n", "<LocalLeader>rh", "<Plug>RHelp", { buffer = true, desc = "Help" })
						vim.keymap.set(
							"n",
							"<LocalLeader>rp",
							"<Plug>RSendParagraph",
							{ buffer = true, desc = "Send paragraph" }
						)
						vim.keymap.set("n", "<LocalLeader>ra", "<Plug>RSendFile", { buffer = true, desc = "Send file" })
					end,
				},
				min_editor_width = 80,
				rconsole_width = 0,
			}

			require("r").setup(opts)
		end,
	},

	-- R completion for nvim-cmp
	{
		"R-nvim/cmp-r",
		dependencies = { "hrsh7th/nvim-cmp" },
	},

	-- Optional: Quarto/RMarkdown support
	{
		"quarto-dev/quarto-nvim",
		ft = { "quarto", "rmd" },
		dependencies = {
			"jmbuhr/otter.nvim",
		},
		config = function()
			require("quarto").setup({
				lspFeatures = {
					enabled = true,
					languages = { "r", "python", "julia" },
				},
			})
		end,
	},
}

