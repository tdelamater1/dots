
local colorscheme = "base16-default-dark"
local backupscheme = "slate"

local success, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not success then
  local backupsuccess, _ = pcall(vim.cmd, "colorscheme " .. backupscheme)
    if not backupsuccess then
      vim.notifty("colorscheme " .. colorscheme .. " was not found.")
      return
    end
    vim.notifty("colorscheme " .. colorscheme .. " was not found. Defaulting to backup.")
    return
end
