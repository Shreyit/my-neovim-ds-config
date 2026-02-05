return {
	"benlubas/molten-nvim",
	version = "^1.0.0",
	build = ":UpdateRemotePlugins",
	dependencies = { "3rd/image.nvim" },

	init = function()
		vim.g.molten_image_provider = "image.nvim"
		vim.g.molten_auto_open_output = true
		-- Disable popups since we are doing inline now
		vim.g.molten_auto_image_popup = false
		vim.g.molten_output_win_max_height = 20
	end,
	config = function()
		-- Keymaps
		local keymap = vim.keymap
		keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { desc = "Initialize Molten" })
		keymap.set("n", "<leader>rl", ":MoltenEvaluateLine<CR>", { desc = "Run current line" })
		keymap.set("n", "<leader>rd", ":MoltenDelete<CR>", { desc = "Delete Molten cell" })
		keymap.set("n", "<leader>rh", ":MoltenHideOutput<CR>", { desc = "Hide Molten output", silent = true })
		keymap.set("n", "<leader>rs", ":noautocmd MoltenShowOutput<CR>", { desc = "Show Molten output", silent = true })

		-- NEW: Manual trigger to see the plot again if the window closes
		keymap.set("n", "<leader>mp", ":MoltenImagePopup<CR>", { desc = "Open image popup", silent = true })

		-- Auto-init logic
		vim.api.nvim_create_autocmd("BufReadPost", {
			pattern = { "*.py", "*.ipynb" },
			callback = function()
				if vim.fn.exists(":MoltenInit") == 2 then
					vim.cmd("MoltenInit")
				end
			end,
		})
	end,
}
