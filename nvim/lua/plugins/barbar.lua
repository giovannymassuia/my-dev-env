-- Plugin to manage buffers and tabs

local barbar = {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
		-- animation = true,
		-- insert_at_start = true,
		-- …etc.
	},
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
	config = function()
		require("barbar").setup()

		local keymap = vim.keymap -- for conciseness

		require("which-key").register({
			["<leader>b"] = { name = "[B]uffer Tabs", _ = "which_key_ignore" },
		})
		keymap.set("n", "<leader>bp", "<cmd>:BufferPick<cr>", { desc = "Buffer pick" })
		keymap.set("n", "<leader>bd", "<cmd>:BufferPickDelete<cr>", { desc = "Buffer pick delete" })
		keymap.set("n", "<leader>bww", "<cmd>:BufferWipeout<cr>", { desc = "Buffer wipeout" })
		keymap.set("n", "<leader>bx", "<cmd>:BufferClose<cr>", { desc = "Buffer close" })
		keymap.set("n", "<leader>br", "<cmd>:BufferRestore<cr>", { desc = "Buffer restore" })
		keymap.set("n", "<leader>bca", "<cmd>:BufferCloseAllButCurrentOrPinned<cr>", { desc = "Buffer restore" })
	end,
}

-- return barbar
return {}
