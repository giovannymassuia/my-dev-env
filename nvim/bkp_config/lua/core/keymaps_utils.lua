local keymap = vim.keymap -- for conciseness
local M = {}

local function bind(op, outer_opts)
	outer_opts = vim.tbl_extend("force", { noremap = true, silent = true }, outer_opts or {})
  -- the noremap = true is needed to prevent recursive mappings
  -- recursive mappings are when a mapping triggers another mapping

	return function(lhs, rhs, desc, opts)
		opts = vim.tbl_extend("force", outer_opts, opts or {})
		opts = vim.tbl_extend("force", { desc = desc }, opts)
		keymap.set(op, lhs, rhs, opts)
	end
end

function whichkey_label(key, label)
	require("which-key").register({
		[key] = { name = label, _ = "which_key_ignore" },
	})
end

M.map = bind("")
M.nmap = bind("n", { noremap = false })
M.nnoremap = bind("n")
M.vnoremap = bind("v")
M.xnoremap = bind("x")
M.inoremap = bind("i")
M.tnoremap = bind("t")
M.keylabel = whichkey_label

return M
