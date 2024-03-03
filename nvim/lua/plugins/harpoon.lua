return {
  {
    "ThePrimeagen/harpoon",
    lazy = true,
    config = function()
      -- Harpoon keybinds --
      local harpoon_ui = require("harpoon.ui")
      local harpoon_mark = require("harpoon.mark")

      require("which-key").register({
        ["<leader>h"] = { name = "[H]arpoon", _ = "which_key_ignore" },
      })

      -- Open harpoon ui
      vim.keymap.set("n", "<leader>ho", harpoon_ui.toggle_quick_menu, { desc = "Open harpoon ui" })

      -- Add current file to harpoon
      vim.keymap.set("n", "<leader>ha", harpoon_mark.add_file, { desc = "Add current file to harpoon" })

      -- Remove current file from harpoon
      vim.keymap.set("n", "<leader>hr", harpoon_mark.rm_file, { desc = "Remove current file from harpoon" })

      -- Remove all files from harpoon
      vim.keymap.set("n", "<leader>hc", harpoon_mark.clear_all, { desc = "Remove all files from harpoon" })

      -- Quickly jump to harpooned files
      vim.keymap.set("n", "<leader>1", function() harpoon_ui.nav_file(1) end)
      vim.keymap.set("n", "<leader>2", function() harpoon_ui.nav_file(2) end)
      vim.keymap.set("n", "<leader>3", function() harpoon_ui.nav_file(3) end)
      vim.keymap.set("n", "<leader>4", function() harpoon_ui.nav_file(4) end)
      vim.keymap.set("n", "<leader>5", function() harpoon_ui.nav_file(5) end)
    end,
  },
}
