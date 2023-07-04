local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = false,
  symbols = { added = "", modified = "", removed = "" }, -- changes diff symbols
  cond = hide_in_width,
}

local filetype = {
  "filetype",
  icons_enabled = false,
}

local location = {
  "location",
  colored = false,
  padding = 0,
}

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

--    black:   '#282c34'
--    red:     '#e06c75'
--    green:   '#98c379'
--    yellow:  '#e5c07b'
--    blue:    '#61afef'
--    magenta: '#c678dd'
--    cyan:    '#56b6c2'
--    white:   '#BBBBBB'

local colors = {
  color2 = "#202124", --black
  color3 = "#e6c97b", --yellow
  --color4 = "#c678dd", --magenta
  color4 = "#bbbbbb",
  -- color5 = "#3e4451", --also black
  color5 = "#202124", --also black
  color13 = "#98c379",--green
  color10 = "#61afef",--blue
  color8 = "#e06c75", --red
  color9 = "#bbbbbb", --less black
}


lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard" },
    always_divide_middle = true,
    theme = { 
      normal = {
        c = { fg = colors.color9, bg = colors.color2 },
        a = { fg = colors.color2, bg = colors.color10, gui = "bold" },
        b = { fg = colors.color4, bg = colors.color5 },
      },
      insert = {
        a = { fg = colors.color2, bg = colors.color13, gui = "bold" },
        b = { fg = colors.color4, bg = colors.color5 },
      },
      visual = {
        a = { fg = colors.color2, bg = colors.color3, gui = "bold" },
        b = { fg = colors.color4, bg = colors.color5 },
      },
      replace = {
        a = { fg = colors.color2, bg = colors.color8, gui = "bold" },
        b = { fg = colors.color4, bg = colors.color5 },
      },
      inactive = {
        c = { fg = colors.color4, bg = colors.color2 },
        a = { fg = colors.color4, bg = colors.color5, gui = "bold" },
        b = { fg = colors.color4, bg = colors.color5 },
      }
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {"branch"},
    lualine_c = { diagnostics },
    lualine_x = { diff, spaces, "encoding", filetype },
    lualine_y = { "location" },
    lualine_z = { "progress" },
  },
}
