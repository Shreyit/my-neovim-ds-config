require("shreyit.core")

--require("shreyit.lsp")  
-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

-- R configuration (should be BEFORE lazy loads)
vim.g.R_app = "radian"
vim.g.R_cmd = "R"
vim.g.R_hl_term = 0
vim.g.R_bracketed_paste = 1
vim.g.maplocalleader = "," -- Change from \ to , for easier typing

require("shreyit.lazy")

-- FORCE Cyberdream theme (add this at the very end of your init.lua)
vim.schedule(function()
	vim.cmd.colorscheme("cyberdream")
	print("Cyberdream forced!")
end)

print("Config loaded!")
