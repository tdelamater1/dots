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

-- movement
keymap("n", "<C-d>", "15jzz", opts) -- window left
keymap("n", "<C-u>", "15kzz", opts) -- window left
-- find
keymap("n", "n", "nzz", opts) -- find next
keymap("n", "N", "Nzz", opts) -- find previous


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
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-q>", ":bdelete<CR>", opts)

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


-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts) -- find files
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts) -- live grep
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts) -- buffers
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts) -- help tags
keymap("n", "<leader>fs", "<cmd>Telescope git_files<cr>", opts) -- find under source control

-- Git
--keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
--keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
--keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- DAP keymaps live in lua/tyler/plugins/go.lua (set after plugins load)

-- Diagnostics
keymap("n", "<leader>cd", vim.diagnostic.open_float, { silent = true, desc = "Show line diagnostics" })

