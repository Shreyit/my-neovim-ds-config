return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		autotag = { enable = true },
		ensure_installed = {
			"json",
			"javascript",
			"typescript",
			"tsx",
			"yaml",
			"html",
			"css",
			"markdown",
			"markdown_inline",
			"bash",
			"lua",
			"vim",
			"dockerfile",
			"query",
			"vimdoc",
			"c",
			"r",
			"python",
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-space>",
				node_incremental = "<C-space>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
	},
	config = function(_, opts)
		-- This direct call to the main module avoids the broken 'configs' path
		require("nvim-treesitter").setup(opts)
	end,
}
