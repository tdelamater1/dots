#!/bin/bash

b=$'\033[1m'
d=$'\033[2m'
y=$'\033[93m'
c=$'\033[96m'
r=$'\033[0m'

row() { printf "  ${y}%-30s${r} %s\n" "$1" "$2"; }
hdr() { printf "\n  ${b}${c}%s${r}\n  ${d}────────────────────────────────────────────────────${r}\n" "$1"; }

hdr "Navigation  (Caps = Mod3)"
row "Caps + h/j/k/l"               "focus left / down / up / right"
row "Caps + Shift + h/j/k/l"       "move window left / down / up / right"

hdr "Workspaces  (Caps = Mod3)"
row "Caps + a / s / d / Space"     "switch to workspace 1 / 2 / 3 / 4"
row "Caps + 1 – 6"                 "switch to workspace 5 – 10"
row "Caps + Shift + a/s/d/Space"   "move window to workspace 1 – 4"
row "Caps + Shift + 1 – 6"        "move window to workspace 5 – 10"

hdr "Layout  (Super)"
row "Super + h / v"                "split horizontal / vertical"
row "Super + f"                    "fullscreen toggle"
row "Super + s"                    "tabbed layout"
row "Super + d"                    "toggle split layout"
row "Super + Shift+Space"          "floating toggle"
row "Super + Space"                "focus floating ↔ tiling"
row "Super + a"                    "focus parent container"

hdr "Resize Mode  (Super+r, then:)"
row "h / l"                        "shrink / grow width"
row "k / j"                        "shrink / grow height"
row "Enter or Esc"                 "exit resize mode"

hdr "System  (Super)"
row "Super + x"                    "lock screen"
row "Super + Shift+x"              "suspend"
row "Super + Shift+s"              "toggle laptop dock"
row "Super + Shift+c"              "reload sway config"
row "Super + Shift+r"              "restart sway"
row "Super + Shift+q"              "exit sway"

hdr "Apps  (Super)"
row "Super + Return"               "terminal (alacritty)"
row "Super + p"                    "launcher (rofi)"
row "Super + '"                    "chromium"
row "Super + Shift+p"              "screenshot area (grimshot)"
row "Super + w"                    "kill focused window"

printf "\n  ${d}press any key to close${r}\n\n"

read -s -n 1
