return {
  "mrjones2014/smart-splits.nvim",
  config = function()
    require("smart-splits").setup({
      resize_mode = {
        silent = true,
        hooks = {
          on_enter = function()
            vim.notify("Entering resize mode")
          end,
          on_leave = function()
            vim.notify("Exiting resize mode, bye")
          end,
        },
      },
      -- Ignored buffer types (only while resizing)
      ignored_buftypes = {
        "nofile",
        "quickfix",
        "prompt",
      },
      -- Ignored filetypes (only while resizing)
      ignored_filetypes = { "NvimTree" },
    })
    -- recommended mappings
    -- resizing splits
    -- these keymaps will also accept a range,
    -- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
    vim.keymap.set("n", "<M-h>", require("smart-splits").resize_left)
    vim.keymap.set("n", "<M-j>", require("smart-splits").resize_down)
    vim.keymap.set("n", "<M-k>", require("smart-splits").resize_up)
    vim.keymap.set("n", "<M-l>", require("smart-splits").resize_right)
    vim.keymap.set(
      "n",
      "<leader>wr",
      require("smart-splits").start_resize_mode,
      { desc = "Enter smart rezise mode. <ESC> to exit." }
    )
    -- moving between splits
    vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
    vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
    vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
    vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
    -- swapping buffers between windows
    vim.keymap.set("n", "<leader>wh", require("smart-splits").swap_buf_left)
    vim.keymap.set("n", "<leader>wj", require("smart-splits").swap_buf_down)
    vim.keymap.set("n", "<leader>wk", require("smart-splits").swap_buf_up)
    vim.keymap.set("n", "<leader>wl", require("smart-splits").swap_buf_right)
  end,
}
