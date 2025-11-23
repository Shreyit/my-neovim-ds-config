return {
	"jpalardy/vim-slime",
	config = function()
		-- Use tmux as the target
		vim.g.slime_target = "tmux"

		-- Default tmux configuration
		-- Format: "{session}:{window}.{pane}"
		-- Example: "0:1.1" means session 0, window 1, pane 1
		vim.g.slime_default_config = {
			socket_name = "default",
			target_pane = "{right-of}", -- Send to the pane to the right
		}

		-- Don't prompt for configuration every time (use defaults)
		vim.g.slime_dont_ask_default = 1

		-- Preserve cursor position after sending
		vim.g.slime_preserve_curpos = 1

		-- No paste mode bracketing (cleaner for R)
		vim.g.slime_no_mappings = 0

		-- Python-specific: send cell
		vim.g.slime_cell_delimiter = "# %%"

		-- Radian-specific: Enable bracketed paste
		vim.g.slime_bracketed_paste = 1

		-- For radian: use paste mode
		vim.g.slime_paste_file = vim.fn.tempname()

		-- Keybindings for vim-slime
		local keymap = vim.keymap.set
		local opts = { silent = true, noremap = true }

		-- Send current paragraph/code block
		keymap("n", "<leader>ss", "<Plug>SlimeLineSend", { desc = "Send current line" })
		keymap("n", "<leader>sp", "<Plug>SlimeParagraphSend", { desc = "Send paragraph" })

		-- Send visual selection
		keymap("x", "<leader>s", "<Plug>SlimeRegionSend", { desc = "Send selection" })

		-- Send entire buffer
		keymap("n", "<leader>sb", "ggVG<Plug>SlimeRegionSend", { desc = "Send entire buffer" })

		-- Re-configure target pane (if you need to change it)
		keymap("n", "<leader>sc", "<Cmd>SlimeConfig<CR>", { desc = "Configure slime target" })

		-- Motion-based send (e.g., <leader>sip sends inside paragraph)
		keymap("n", "<leader>s", "<Plug>SlimeMotionSend", { desc = "Send motion" })

		-- For R/Radian: Send line and move to next
		keymap("n", "<CR>", function()
			-- Use vim-slime's built-in line send
			vim.cmd("normal \\<Plug>SlimeLineSend")
			vim.cmd("normal! j")
		end, { desc = "Send line and move down", silent = true })
	end,
}
