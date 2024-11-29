local nnoremap = require("config.keymaps_utils").nnoremap
local inoremap = require("config.keymaps_utils").inoremap

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local Util = require("lazyvim.util")

keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { silent = true })
keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { silent = true })
keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { silent = true })
keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { silent = true })
keymap.set("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { silent = true })
keymap.set("n", "<C-Space>", "<Cmd>NvimTmuxNavigateNavigateNext<CR>", { silent = true })

-- use jk to exit insert mode
keymap.set("i", "jk", "<Esc>", { silent = true, noremap = true, desc = "Exit insert mode" })

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- save file without auto-formatting
vim.keymap.set(
	"n",
	"<leader>sn",
	"<cmd>noautocmd w <CR>",
	{ silent = true, noremap = true, desc = "Save without autoformat" }
)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Borderless terminal
vim.keymap.set("n", "<C-/>", function()
	Util.terminal(nil, { border = "none" })
end, { desc = "Term with border" })

-- Borderless lazygit
vim.keymap.set("n", "<leader>gg", function()
	Util.terminal({ "lazygit" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false, border = "none" })
end, { desc = "Lazygit (root dir)" })

keymap.del({ "n", "i", "v" }, "<A-j>")
keymap.del({ "n", "i", "v" }, "<A-k>")
keymap.del("n", "<C-Left>")
keymap.del("n", "<C-Down>")
keymap.del("n", "<C-Up>")
keymap.del("n", "<C-Right>")

keymap.set("n", "<M-h>", '<Cmd>lua require("tmux").resize_left()<CR>', { silent = true })
keymap.set("n", "<M-j>", '<Cmd>lua require("tmux").resize_bottom()<CR>', { silent = true })
keymap.set("n", "<M-k>", '<Cmd>lua require("tmux").resize_top()<CR>', { silent = true })
keymap.set("n", "<M-l>", '<Cmd>lua require("tmux").resize_right()<CR>', { silent = true })

local set_keymap = vim.api.nvim_set_keymap

-- Split windows
keymap.set("n", "ss", ":vsplit<Return>", opts)
keymap.set("n", "sv", ":split<Return>", opts)

-- Tabs
keymap.set("n", "te", ":tabedit", opts)
-- keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- package-info keymaps
set_keymap(
	"n",
	"<leader>cpt",
	"<cmd>lua require('package-info').toggle()<cr>",
	{ silent = true, noremap = true, desc = "Toggle" }
)
set_keymap(
	"n",
	"<leader>cpd",
	"<cmd>lua require('package-info').delete()<cr>",
	{ silent = true, noremap = true, desc = "Delete package" }
)
set_keymap(
	"n",
	"<leader>cpu",
	"<cmd>lua require('package-info').update()<cr>",
	{ silent = true, noremap = true, desc = "Update package" }
)
set_keymap(
	"n",
	"<leader>cpi",
	"<cmd>lua require('package-info').install()<cr>",
	{ silent = true, noremap = true, desc = "Install package" }
)
set_keymap(
	"n",
	"<leader>cpc",
	"<cmd>lua require('package-info').change_version()<cr>",
	{ silent = true, noremap = true, desc = "Change package version" }
)

-- notifications
keymap.set("n", "<leader>n", "<Cmd>Notifications<CR>", { silent = true, noremap = true, desc = "Notifications" })

-- nvim-tree
whichkey_label("e", "File Explorer")
nnoremap("<leader>ee", "<cmd>NvimTreeFocus<CR>", "Toggle file explorer") -- toggle file explorer
nnoremap("<leader>et", "<cmd>NvimTreeToggle<CR>", "Toggle file explorer") -- toggle file explorer
nnoremap("<leader>ef", "<cmd>NvimTreeFindFile<CR>", "Toggle file explorer on current file") -- toggle file explorer on current file
nnoremap("<leader>ec", "<cmd>NvimTreeClose<CR>", "Collapse file explorer") -- collapse file explorer
nnoremap("<leader>er", "<cmd>NvimTreeRefresh<CR>", "Refresh file explorer") -- refresh file explorer

-- Map Oil to <leader>e
nnoremap("<leader>eo", "<cmd>lua require('oil').toggle_float()<CR>", "Open Oil float explorer")
