return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<leader>dO",
        function() require("dap").step_out() end,
        desc = "Step Out",
      },
      {
        "<leader>do",
        function() require("dap").step_over() end,
        desc = "Step Over",
      },
    },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = {
      virt_text_win_col = 80,
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "python", "node2", "js" },
    },
  },
}
