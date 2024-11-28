-- Disable "No information available" notification on hover
-- plus define border for hover window
vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
	config = config
		or {
			border = {
				{ "╭", "Comment" },
				{ "─", "Comment" },
				{ "╮", "Comment" },
				{ "│", "Comment" },
				{ "╯", "Comment" },
				{ "─", "Comment" },
				{ "╰", "Comment" },
				{ "│", "Comment" },
			},
		}
	config.focus_id = ctx.method
	if not (result and result.contents) then
		return
	end
	local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
	markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
	if vim.tbl_isempty(markdown_lines) then
		return
	end
	return vim.lsp.util.open_floating_preview(markdown_lines, "markdown", config)
end

return {
	{
		"neovim/nvim-lspconfig",
		opts = function(_, opts)
			local lspconfig = require("lspconfig")

			lspconfig.volar.setup({
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
				init_options = {
					vue = {
						hybridMode = false,
					},
				},
			})
			lspconfig.ts_ls.setup({
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = function()
								local mason_registry = require("mason-registry")
								return mason_registry.get_package("vue-language-server"):get_install_path()
									.. "/node_modules/@vue/language-server"
							end,
							languages = { "javascript", "typescript", "vue" },
						},
					},
				},
				filetypes = {
					"javascript",
					"typescript",
					"vue",
				},
			})
		end,
		-- opts = {
		-- 	servers = {
		-- vtsls = {
		-- 	settings = {
		-- 		typescript = {
		-- 			inlayHints = {
		-- 				enumMemberValues = { enabled = false },
		-- 				functionLikeReturnTypes = { enabled = false },
		-- 				parameterNames = { enabled = false },
		-- 				parameterTypes = { enabled = false },
		-- 				propertyDeclarationTypes = { enabled = false },
		-- 				variableTypes = { enabled = false },
		-- 			},
		-- 		},
		-- 	},
		-- },
		-- ts_ls = {
		-- 	init_options = {
		-- 		plugins = {
		-- 			{
		-- 				name = "@vue/typescript-plugin",
		-- 				location = function()
		-- 					local mason_registry = require("mason-registry")
		-- 					return mason_registry.get_package("vue-language-server"):get_install_path()
		-- 						.. "/node_modules/@vue/language-server"
		-- 				end,
		-- 				languages = { "vue" },
		-- 			},
		-- 		},
		-- 	},
		-- 	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
		-- },
		-- gopls = {
		--   settings = {
		--     gopls = {
		--       hints = {
		--         assignVariableTypes = false,
		--         compositeLiteralFields = false,
		--         compositeLiteralTypes = false,
		--         constantValues = false,
		--         functionTypeParameters = false,
		--         parameterNames = false,
		--         rangeVariableTypes = false,
		--       },
		--     },
		--   },
		-- },
		-- 	},
		-- },
	},
}
