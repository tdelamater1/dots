vim.opt.exrc = true                             -- load .nvim.lua from project directories
vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1                           -- more space in the neovim command line for displaying messages
-- vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
-- vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                          -- pop up menu height
-- vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 1                         -- always show tabs
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 2000                        -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2                             -- insert 2 spaces for a tab
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = true                   -- set numbered lines relative to current line
vim.opt.laststatus = 3                          -- show 3 lines of status
-- vim.opt.showcmd = false
-- vim.opt.ruler = false
vim.opt.numberwidth = 4                         -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.scrolloff = 7                           -- is one of my fav
vim.opt.sidescrolloff = 15                      -- is one of my fav
vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications
vim.opt.fillchars.eob=" "
vim.opt.shortmess:append "c"
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")
vim.opt.spelllang = "en,cjk"

-- tmux extended-keys re-encodes control chars within bracketed paste.
-- Handle both xterm modifyOtherKeys and csi-u formats.
vim.paste = (function(overridden)
  return function(lines, phase)
    local fixed = {}
    for _, line in ipairs(lines) do
      line = line:gsub("\x1b%[27;5;105~", "\t"):gsub("\x1b%[105;5u", "\t")
      line = line:gsub("\x1b%[27;5;106~", "\n"):gsub("\x1b%[106;5u", "\n")
      local parts = vim.split(line, "\n", { plain = true })
      for _, part in ipairs(parts) do
        table.insert(fixed, part)
      end
    end
    return overridden(fixed, phase)
  end
end)(vim.paste)

-- LSP Diagnostics Configuration
vim.diagnostic.config({
  virtual_text = false,      -- Disable inline text at the end of the line
  signs = true,             -- Keep icons in the left gutter column
  underline = true,         -- Keep colored underlines under the errors
  update_in_insert = false, -- Do not look for errors while you are actively typing
  float = { border = "rounded" }, -- Add borders to floating diagnostic windows
})

