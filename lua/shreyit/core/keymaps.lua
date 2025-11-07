-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode (keep your preference)
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights (LazyVim style)
keymap.set("n", "<leader>h", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

---------------------
-- Better Navigation -------------------

-- Move between windows (LazyVim style)
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize windows with arrows
keymap.set("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Resize window up" })
keymap.set("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Resize window down" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize window left" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize window right" })

---------------------
-- Buffer Management (LazyVim Style) -------------------

-- Buffer navigation
keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })

-- Buffer operations
keymap.set("n", "<leader>bb", "<cmd>e #<CR>", { desc = "Switch to last buffer" })
keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Delete buffer" })
keymap.set("n", "<leader>bD", "<cmd>%bd|e#<CR>", { desc = "Delete all other buffers" })

---------------------
-- Window Management (Enhanced) -------------------

-- Split management (LazyVim style)
keymap.set("n", "<leader>ww", "<C-w>p", { desc = "Other window" })
keymap.set("n", "<leader>wd", "<cmd>close<CR>", { desc = "Delete window" })
keymap.set("n", "<leader>w-", "<cmd>split<CR>", { desc = "Split below" })
keymap.set("n", "<leader>w|", "<cmd>vsplit<CR>", { desc = "Split right" })

-- Quick splits (your style + LazyVim)
keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split vertically" })
keymap.set("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize splits" })

---------------------
-- Tab Management (LazyVim Style) -------------------

keymap.set("n", "<leader><tab>l", "<cmd>tablast<CR>", { desc = "Last tab" })
keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<CR>", { desc = "First tab" })
keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<CR>", { desc = "New tab" })
keymap.set("n", "<leader><tab>]", "<cmd>tabnext<CR>", { desc = "Next tab" })
keymap.set("n", "<leader><tab>d", "<cmd>tabclose<CR>", { desc = "Close tab" })
keymap.set("n", "<leader><tab>[", "<cmd>tabprevious<CR>", { desc = "Previous tab" })

-- Your existing tab keys (keep for compatibility)
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabnext<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabprevious<CR>", { desc = "Go to previous tab" })

---------------------
-- File Operations (LazyVim Style) -------------------

keymap.set("n", "<leader>fn", "<cmd>enew<CR>", { desc = "New file" })
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<CR>", { desc = "Grep word under cursor" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })

---------------------
-- Plugin Specific Keymaps -------------------

-- File Explorer (nvim-tree)
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "File explorer" })
keymap.set("n", "<leader>o", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file explorer" })

-- Telescope
keymap.set("n", "<leader><space>", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
keymap.set("n", "<leader>:", "<cmd>Telescope command_history<CR>", { desc = "Command history" })
keymap.set("n", "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Search in buffer" })

-- Git (if you have gitsigns/lazygit)
keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Lazygit" })
keymap.set("n", "<leader>gj", "<cmd>lua require('gitsigns').next_hunk()<CR>", { desc = "Next hunk" })
keymap.set("n", "<leader>gk", "<cmd>lua require('gitsigns').prev_hunk()<CR>", { desc = "Previous hunk" })

---------------------
-- Editing Enhancements -------------------

-- Select all
keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

-- Better indenting
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Move lines
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

---------------------
-- Terminal -------------------

keymap.set("n", "<leader>ft", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

---------------------
-- UI Toggles -------------------

keymap.set("n", "<leader>ul", "<cmd>set relativenumber!<CR>", { desc = "Toggle line numbers" })
keymap.set("n", "<leader>uw", "<cmd>set wrap!<CR>", { desc = "Toggle word wrap" })

---------------------
-- Save and Quit -------------------

keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
keymap.set("n", "<leader>Q", "<cmd>q!<CR>", { desc = "Force quit" })
keymap.set("n", "<leader>x", "<cmd>x<CR>", { desc = "Save and quit" })
