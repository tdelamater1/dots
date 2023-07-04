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
  'folke/which-key.nvim',
  {'nvim-telescope/telescope.nvim', tag = '0.1.2', dependencies = { 'nvim-lua/plenary.nvim' }},
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
  'nvim-lualine/lualine.nvim',
  'github/copilot.vim',
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
  { 
      'lervag/vimtex',
      config = function ()
          vim.g.vimtex_compiler_method = 'latexmk'
          vim.g.vimtex_view_method = 'zathura'
          vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
      end,
  },

})
