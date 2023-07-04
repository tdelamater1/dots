local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
   options = {
     separator_style = "slant",
     modified_icon = "",
   },
}

-- bufferline.setup {
--   options = {
--     close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
--     right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
--     offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
--     separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
--     modified_icon = "",
--     max_name_length = 14,
--     max_prefix_length = 13,
--     tab_size = 20,
--     show_buffer_close_icons = false,
--     show_close_icon = false,
--   },
-- 
--   highlights = {
--     fill = {
--       fg = { attribute = "fg", highlight = "#ff0000" },
--       bg = { attribute = "bg", highlight = "BufTabLineCurrent" },
--     },
--     background = {
--       fg = { attribute = "fg", highlight = "TabLine" },
--       bg = { attribute = "bg", highlight = "Tabline" },
--     },
-- 
--     buffer_visible = {
--       fg = { attribute = "fg", highlight = "TabLine" },
--       bg = { attribute = "bg", highlight = "TabLine" },
--     },
-- 
--     close_button = {
--       fg = { attribute = "fg", highlight = "TabLine" },
--       bg = { attribute = "bg", highlight = "TabLine" },
--     },
--     close_button_visible = {
--       fg = { attribute = "fg", highlight = "TabLine" },
--       bg = { attribute = "bg", highlight = "TabLine" },
--     },
-- 
--     tab_selected = {
--       fg = { attribute = "fg", highlight = "Normal" },
--       bg = { attribute = "bg", highlight = "Normal" },
--     },
--     tab = {
--       fg = { attribute = "fg", highlight = "TabLine" },
--       bg = { attribute = "bg", highlight = "TabLine" },
--     },
--     tab_close = {
--       fg = { attribute = "fg", highlight = "TabLineSel" },
--       bg = { attribute = "bg", highlight = "Normal" },
--     },
-- 
--     duplicate_selected = {
--       fg = { attribute = "fg", highlight = "TabLineSel" },
--       bg = { attribute = "bg", highlight = "TabLineSel" },
--     },
--     duplicate_visible = {
--       fg = { attribute = "fg", highlight = "TabLine" },
--       bg = { attribute = "bg", highlight = "TabLine" },
--     },
--     duplicate = {
--       fg = { attribute = "fg", highlight = "TabLine" },
--       bg = { attribute = "bg", highlight = "TabLine" },
--     },
-- 
--     modified = {
--       fg = { attribute = "fg", highlight = "TabLine" },
--       bg = { attribute = "bg", highlight = "TabLine" },
--     },
--     modified_selected = {
--       fg = { attribute = "fg", highlight = "Normal" },
--       bg = { attribute = "bg", highlight = "Normal" },
--     },
--     modified_visible = {
--       fg = { attribute = "fg", highlight = "TabLine" },
--       bg = { attribute = "bg", highlight = "TabLine" },
--     },
-- 
--     separator = {
--       fg = { attribute = "bg", highlight = "TabLine" },
--       bg = { attribute = "bg", highlight = "BufTabLineCurrent" },
--     },
--     separator_selected = {
--       fg = { attribute = "bg", highlight = "Normal" },
--       bg = { attribute = "bg", highlight = "Normal" },
--     },
--     indicator_selected = {
--       fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
--       bg = { attribute = "bg", highlight = "Normal" },
--     },
--   },
-- }
