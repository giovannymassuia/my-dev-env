return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting

		local mason_null_ls = require("mason-null-ls")

		mason_null_ls.setup({
			ensure_installed = {
				"stylua",
			},
		})

		null_ls.setup({
			sources = {
				formatting.stylua,
				formatting.prettierd,
				formatting.goimports_reviser,
				formatting.gofumpt,
				formatting.golines,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format file" })
	end,
}
