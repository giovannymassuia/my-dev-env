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
      require("mason").setup()
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
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
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
        "tsserver",
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

      vim.keymap.set("n", "gi", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "Show Hover" })
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
    end,
  },
}
