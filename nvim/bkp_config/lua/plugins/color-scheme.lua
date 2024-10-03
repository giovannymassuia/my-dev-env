-- This plugin provides a dark color scheme for neovim, which can be used to change the appearance of the editor.

return {
	"catppuccin/nvim",
	config = function()
		vim.cmd.colorscheme("catppuccin-mocha")
	end
}
