-- Nice dialog boxes for neovim

return {
  "stevearc/dressing.nvim",
  config = function()
    require("dressing").setup()
  end,
}
