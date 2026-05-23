local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local wk = require("which-key")
      wk.setup({})
      wk.add({
        { "<leader>e",  desc = "File explorer" },
        { "<leader>f",  group = "find" },
        { "<leader>ff", desc = "Find files" },
        { "<leader>fg", desc = "Live grep" },
        { "<leader>fp", desc = "Projects" },
        { "<leader>fb", desc = "Buffers" },
        { "<leader>fh", desc = "Help tags" },
        { "<leader>fs", desc = "Git files" },
        { "<leader>h",  desc = "Clear highlights" },
        { "<leader>m",  desc = "Delete mark m" },
        { "<leader>M",  desc = "Delete mark M" },
        { "-",          desc = "Open parent dir (oil)" },
        { "<C-h>",      desc = "Window left",     mode = "n" },
        { "<C-j>",      desc = "Window down",     mode = "n" },
        { "<C-k>",      desc = "Window up",       mode = "n" },
        { "<C-l>",      desc = "Window right",    mode = "n" },
        { "<C-Up>",     desc = "Shrink height",   mode = "n" },
        { "<C-Down>",   desc = "Grow height",     mode = "n" },
        { "<C-Left>",   desc = "Shrink width",    mode = "n" },
        { "<C-Right>",  desc = "Grow width",      mode = "n" },
        { "<S-l>",      desc = "Next buffer",     mode = "n" },
        { "<S-h>",      desc = "Previous buffer", mode = "n" },
        { "<S-q>",      desc = "Close buffer",    mode = "n" },
      })
    end,
  },
  {'nvim-telescope/telescope.nvim', tag = '0.1.2', dependencies = { 'nvim-lua/plenary.nvim' }},
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup({
        view_options = { show_hidden = true },
      })
      vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>",           { desc = "File explorer" })
      vim.keymap.set("n", "-",         "<cmd>Oil<CR>",           { desc = "Open parent dir (oil)" })
    end,
  },
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
  'nvim-lualine/lualine.nvim',
  {
    'RRethy/nvim-base16',
    lazy = false,
    priority = 1000,
    config = function()
        require('base16-colorscheme').setup({
          base00 = '#1a1a1a', base01 = '#2c313c', base02 = '#3e4451', base03 = '#6c7891',
          base04 = '#565c64', base05 = '#abb2bf', base06 = '#9a9bb3', base07 = '#c5c8e6',
          base08 = '#e06c75', base09 = '#61afef', base0A = '#e6c07b', base0B = '#98c379',
          base0C = '#56b6c2', base0D = '#61afef', base0E = '#c678dd', base0F = '#a06949',
        })
     end,
  },
}, {
  performance = {
    rtp = {
      paths = { "/usr/lib/nvim" },
    },
  },
})
