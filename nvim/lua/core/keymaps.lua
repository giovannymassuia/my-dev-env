local nnoremap = require("core.keymaps_utils").nnoremap
local inoremap = require("core.keymaps_utils").inoremap

--------------------------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
inoremap("jk", "<Esc>", "Exit insert mode")

-- clear search highlights
nnoremap("<leader>nh", ":nohl<CR>", "Clear search highlights")

-- delete single character without copying into register
nnoremap("x", '"_x', "Delete character before cursor")

-- start end of line
nnoremap("L", "$", "Move to end of line")
-- nnoremap("H", "0", "Move to start of line")
nnoremap("H", "^", "Move to start of line (first non-blank character)")

-- increment/decrement numbers
nnoremap("<leader>+", "<C-a>", "Increment number")
nnoremap("<leader>-", "<C-x>", "Decrement number")

-- window management
nnoremap("<leader>sv", "<C-w>v", "Split window vertically") -- split window vertically
nnoremap("<leader>sh", "<C-w>s", "Split window horizontally") -- split window horizontally
nnoremap("<leader>se", "<C-w>=", "Make splits equal size") -- make split windows equal width & height
nnoremap("<leader>sx", "<cmd>close<CR>", "Close current split") -- close current split window

-- buffer navigation
nnoremap("<leader>bn", "<cmd>bn<CR>", "Go to next buffer") -- go to next buffer
nnoremap("<leader>bp", "<cmd>bp<CR>", "Go to previous buffer") -- go to previous buffer
-- go to buffer index
nnoremap("<leader>b1", "<cmd>buffer 1<CR>", "Go to buffer 1")
nnoremap("<leader>b2", "<cmd>buffer 2<CR>", "Go to buffer 2")
nnoremap("<leader>b3", "<cmd>buffer 3<CR>", "Go to buffer 3")
nnoremap("<leader>b4", "<cmd>buffer 4<CR>", "Go to buffer 4")
nnoremap("<leader>b5", "<cmd>buffer 5<CR>", "Go to buffer 5")

--------------------------------------
-- Plugin Keymaps -------------------

-- alpha dashboard
nnoremap("<leader>oh", "<cmd>Alpha<CR>", "Open dashboard")

-- tab management
-- nnoremap("<leader>to", "<cmd>tabnew<CR>", "Open new tab") -- open new tab
-- nnoremap("<leader>tx", "<cmd>tabclose<CR>", "Close current tab") -- close current tab
-- nnoremap("<leader>tn", "<cmd>tabn<CR>", "Go to next tab") --  go to next tab
-- nnoremap("<leader>tp", "<cmd>tabp<CR>", "Go to previous tab") --  go to previous tab
-- nnoremap("<leader>tf", "<cmd>tabnew %<CR>", "Open current buffer in new tab") --  move current buffer to new tab

-- Map Oil to <leader>e
nnoremap("<leader>eo", "<cmd>lua require('oil').toggle_float()<CR>", "Open Oil float explorer")

-- vim maximazer
nnoremap("<leader>m", ":MaximizerToggle<CR>", "Maximize current window")

-- telescope
local builtin = require("telescope.builtin")
nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>", "Fuzzy find files in cwd")
nnoremap("<leader>fr", "<cmd>Telescope oldfiles<cr>", "Fuzzy find recent files")
nnoremap("<leader>fb", builtin.buffers, "Open buffers")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>", "Find string in cwd")
nnoremap("<leader>fs", builtin.lsp_document_symbols, "Show symbols in file")
nnoremap("<leader>fh", "<cmd>Telescope git_status<cr>", "Git options")
nnoremap("<leader>fc", "<cmd>Telescope grep_string<cr>", "Find string under cursor in cwd")

-- nvim-tree
whichkey_label("e", "File Explorer")
nnoremap("<leader>ee", "<cmd>NvimTreeFocus<CR>", "Toggle file explorer") -- toggle file explorer
nnoremap("<leader>et", "<cmd>NvimTreeToggle<CR>", "Toggle file explorer") -- toggle file explorer
nnoremap("<leader>ef", "<cmd>NvimTreeFindFile<CR>", "Toggle file explorer on current file") -- toggle file explorer on current file
nnoremap("<leader>ec", "<cmd>NvimTreeClose<CR>", "Collapse file explorer") -- collapse file explorer
nnoremap("<leader>er", "<cmd>NvimTreeRefresh<CR>", "Refresh file explorer") -- refresh file explorer

-- noice
nnoremap("<leader>nn", "<cmd>Noice<CR>", "Open noice")
nnoremap("<leader>nd", "<cmd>NoiceDismiss<CR>", "Close noice")
nnoremap("<leader>nt", "<cmd>NoiceTelescope<CR>", "Open noice in telescope")
nnoremap("<leader>nl", "<cmd>NoiceLast<CR>", "Open last noice")

-- debugger
whichkey_label("<leader>d", "Debugger")
nnoremap("<leader>db", "<cmd>DapToggleBreakpoint<CR>", "Add breakpoint to line")
nnoremap("<leader>dr", "<cmd>DapContinue<CR>", "Run or continue debugger")

-- tests
whichkey_label("<leader>t", "Tests")
nnoremap("<leader>tr", "<cmd>Neotest run<CR>", "Run tests nearest to cursor")
nnoremap("<leader>tf", "<cmd>Neotest run file<CR>", "Run tests in current file")
nnoremap("<leader>tf", "<cmd>Neotest run last<CR>", "Run last test")
nnoremap("<leader>ts", "<cmd>Neotest summary<CR>", "Show test summary")
nnoremap("<leader>to", "<cmd>Neotest output<CR>", "Show test output")
nnoremap(
	"<leader>tw",
	"<cmd>lua require('neotest').run.run({ jestCommand = 'npm test -- --watch ' })<cr>",
	"Run tests in watch mode"
)
nnoremap("<leader>td", "<cmd>lua require('neotest').run.run({ strategy = 'dap' })<cr>", "Run tests with debugger")
