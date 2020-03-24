# Profile file. Runs on login

# Adds `~/.local/bin` to $PATH
export PATH=$HOME/.local/bin:$PATH

# set CAPSLOCK to ESC
setxkbmap -option caps:escape

# change keyboard layout
setxkbmap br,us -option grp:alt_space_toggle

sxhkd &
