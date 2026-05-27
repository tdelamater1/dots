#!/bin/bash

cheatsheet() {
cat <<'EOF'
[sway] Super + h/j/k/l                  focus left / down / up / right
[sway] Super + Shift + h/j/k/l          move window left / down / up / right
[sway] Super + a/s/d/Space              switch to workspace 1 / 2 / 3 / 4
[sway] Super + 1-6                      switch to workspace 5-10
[sway] Super + Shift + a/s/d/Space      move window to workspace 1-4
[sway] Super + h / v                    split horizontal / vertical
[sway] Super + f                        fullscreen toggle
[sway] Super + s                        tabbed layout
[sway] Super + d                        toggle split layout
[sway] Super + Shift+Space              floating toggle
[sway] Super + Space                    focus floating / tiling
[sway] Super + a                        focus parent container
[sway] Super + r  then h/l/k/j          resize pane
[sway] Super + x                        lock screen
[sway] Super + Shift+x                  suspend
[sway] Super + Shift+s                  toggle laptop dock
[sway] Super + Shift+c                  reload sway config
[sway] Super + Shift+r                  restart sway
[sway] Super + Shift+q                  exit sway
[sway] Super + Return                   terminal (alacritty)
[sway] Super + p                        launcher (rofi)
[sway] Super + '                        chromium
[sway] Super + Shift+p                  screenshot area (grimshot)
[sway] Super + w                        kill focused window
[sway] Super + /                        searchable cheatsheet (this)
[bash] Ctrl+r                           fuzzy search shell history (fzf)
[bash] Ctrl+t                           fuzzy find files in current directory (fzf)
[bash] Alt+c                            fuzzy cd into subdirectory (fzf)
[bash] Ctrl+f                           ripgrep + fzf file content search, opens in nvim
[tmux] Ctrl+a |                         split pane horizontal
[tmux] Ctrl+a -                         split pane vertical
[tmux] Ctrl+a h/j/k/l                   move between panes
[tmux] Ctrl+a m                         zoom / unzoom pane
[tmux] Ctrl+a ^                         last window
[tmux] Ctrl+a r                         reload tmux config
[tmux] Ctrl+a f                         open fzf picker of ~/projects ~/work ~/personal — select to create/switch tmux session
[tmux] Ctrl+a w                         show all sessions and windows
[tmux] Ctrl+a Ctrl+s                    save sessions (resurrect)
[tmux] Ctrl+a Ctrl+r                    restore sessions (resurrect)
[tmux] Ctrl+a [  then v / y             copy mode: select / yank to clipboard
[neovim] Space                          show which-key popup
[neovim] Space + ff                     find files (telescope)
[neovim] Space + fg                     live grep / ripgrep
[neovim] Space + fb                     switch buffers
[neovim] Space + fs                     find git files
[neovim] Space + fh                     help tags
[neovim] Space + e  or  -               file explorer (oil)
[neovim] Space + h                      clear highlights
[neovim] Shift+l / Shift+h             next / previous buffer
[neovim] Shift+q                        close buffer
[neovim] Ctrl+h/j/k/l                   move between windows
EOF
}

cheatsheet | fzf \
  --prompt="  bindings > " \
  --layout=reverse \
  --border=rounded \
  --height=100% \
  --color="bg:#1a1a1a,fg:#bbbbbb,hl:#61afef,prompt:#98c379,border:#3e4451" \
  --bind="enter:execute(echo {})+abort" \
  --no-sort
