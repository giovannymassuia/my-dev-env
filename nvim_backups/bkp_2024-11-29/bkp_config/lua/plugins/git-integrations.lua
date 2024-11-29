return {
  {
    -- Fugitive provides a Git wrapper for Vim
    "tpope/vim-fugitive",
  },
  {
    -- Gitsigns provides git signs and hunk actions in the sign column
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
      require("gitsigns").setup()

      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Show git preview hunk" })
      vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle inline git blame" })
    end,
  },
}
