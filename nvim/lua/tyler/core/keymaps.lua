-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts) -- leader key
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts) -- window left
keymap("n", "<C-j>", "<C-w>j", opts) -- window down
keymap("n", "<C-k>", "<C-w>k", opts) -- window up
keymap("n", "<C-l>", "<C-w>l", opts) -- window right

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts) -- shrink vertically
keymap("n", "<C-Down>", ":resize +2<CR>", opts) -- grow vertically
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts) -- shrink horizontally
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts) -- grow horizontally

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts) -- next buffer
keymap("n", "<S-h>", ":bprevious<CR>", opts) -- previous buffer

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts) -- clear highlights

-- marks! 
keymap("n", "<leader>m", ":delm m<CR>", opts) -- delete the m mark
keymap("n", "<leader>M", ":delm M<CR>", opts) -- delete the m mark

-- Close buffers
--keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
--keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
--keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
-- keymap("v", "<", "<gv", opts)
--keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
-- keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts) -- toggle tree view

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts) -- find files
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts) -- live grep
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts) -- projects
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts) -- buffers
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts) -- help tags
keymap("n", "<leader>fs", "<cmd>Telescope git_files<cr>", opts) -- find under source control

-- Git
--keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
--keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
--keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- DAP
-- keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
-- keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
-- keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
-- keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
-- keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
-- keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
-- keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
