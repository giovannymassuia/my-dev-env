return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"prettierd",
				"js-debug-adapter",
			},
		},
		config = function()
			require("mason").setup({
				registries = {
					"github:nvim-java/mason-registry",
					"github:mason-org/mason-registry",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
					"tailwindcss",
					"eslint",
					"cssls",
					"jdtls",
					"gopls",
				},
				automatic_installation = false,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("java").setup()

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local function organize_imports()
				local params = {
					command = "_typescript.organizeImports",
					arguments = { vim.api.nvim_buf_get_name(0) },
				}
				vim.lsp.buf.execute_command(params)
			end

			local lspconfig = require("lspconfig")
			local servers = {
				"lua_ls",
				"tailwindcss",
				"eslint",
			}

			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({
					capabilities = capabilities,
				})
			end

			lspconfig.tsserver.setup({
				capabilities = capabilities,
				commands = {
					OrganizeImports = {
						organize_imports,
						description = "Organize Imports",
					},
				},
			})

			lspconfig.jdtls.setup({
				capabilities = capabilities,
				settings = {
					java = {
						configuration = {
							runtimes = {
								name = "JavaSE-21",
								path = "/Users/giovannymassuia/.sdkman/candidates/java/current",
								default = true,
							},
						},
					},
				},
			})

			local util = require("lspconfig.util")
			lspconfig.gopls.setup({
				capabilities = capabilities,
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = util.root_pattern("go.mod", ".git", "go.work"),
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
							shadow = true,
						},
					},
				},
			})

			vim.keymap.set("n", "gi", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "Show Hover" })
			vim.keymap.set(
				"n",
				"gr",
				vim.lsp.buf.references,
				{ noremap = true, silent = true, desc = "Show References" }
			)
			vim.keymap.set(
				"n",
				"gd",
				vim.lsp.buf.definition,
				{ noremap = true, silent = true, desc = "Go to Definition" }
			)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set(
				"n",
				"goi",
				"<cmd>:OrganizeImports<cr>",
				{ noremap = true, silent = true, desc = "Organize Imports" }
			)
			-- go next and previous diagnostics
			-- vim.keymap.set("n", "<leader>dn", vim.lsp.diagnostic.goto_next(), { desc = "Go to next diagnostic" })
			-- vim.keymap.set("n", "<leader>dp", vim.lsp.diagnostic.goto_prev(), { desc = "Go to previous diagnostic" })

			-- java
			vim.keymap.set(
				"n",
				"<leader>jtr",
				"<cmd>JavaTestRunCurrentClass<CR>",
				{ desc = "Java Test - Run Current Class" }
			) -- toggle file explorer
			vim.keymap.set(
				"n",
				"<leader>jvr",
				"<cmd>JavaTestViewLastReport<CR>",
				{ desc = "Java Test - Show test report" }
			) -- toggle file explorer
		end,
	},
}
