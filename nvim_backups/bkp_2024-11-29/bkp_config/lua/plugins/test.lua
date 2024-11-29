return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-jest",
			"nvim-neotest/nvim-nio",
			"nvim-neotest/neotest-go",
		},
		requires = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-jest",
			"nvim-neotest/nvim-nio",
			"nvim-neotest/neotest-go",
		},
		config = function(_, opts)
			require("neotest").setup({
				adapters = {
					require("neotest-jest")({
						jestCommand = "npm test --",
						jestConfigFile = "custom.jest.config.ts",
						env = { CI = true },
						cwd = function()
							return vim.fn.getcwd()
						end,
					}),

					require("neotest-go"),
				},
			})
		end,
	},
	{
		"preservim/vimux",
	},
	{
		"vim-test/vim-test",
		vim.cmd("let test#strategy = 'vimux'"),
	},
}
