return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"eslint-lsp", -- "MasonInstall eslint-lsp@4.8.0" to fix esling .mjs config files
				"hadolint",
				"prettierd",
				"shfmt",
				"stylua",
				"selene",
				"shellcheck",
				"delve",
				"sql-formatter",
				"vue-language-server", -- ":MasonInstall vue-language-server@1.8.27"
			},
		},
	},
}
