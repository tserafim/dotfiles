# Inspired on https://github.com/paulirish/dotfiles

# Load zplugin - Zsh plugin manager
source ~/.zplugin/bin/zplugin.zsh

# Load plugins
zplugin load denysdovhan/spaceship-prompt
zplugin load zsh-users/zsh-autosuggestions
zplugin load zsh-users/zsh-syntax-highlighting
zplugin load zdharma/zsh-diff-so-fancy
zplugin ice pick"z.sh"
zplugin load rupa/z

# Load oh-my-zsh plugins
zplugin snippet OMZ::plugins/dnf/dnf.plugin.zsh
zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh
zplugin snippet OMZ::plugins/tmux/tmux.plugin.zsh
zplugin snippet OMZ::plugins/vi-mode/vi-mode.plugin.zsh

# Load oh-my-zsh core lib. Maybe move this to my own files?
zplugin snippet OMZ::lib/history.zsh
zplugin snippet OMZ::lib/directories.zsh
zplugin snippet OMZ::lib/functions.zsh
zplugin snippet OMZ::lib/git.zsh
zplugin snippet OMZ::lib/grep.zsh
zplugin snippet OMZ::lib/key-bindings.zsh
zplugin snippet OMZ::lib/misc.zsh

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"
zplugin snippet OMZ::lib/correction.zsh

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
zplugin snippet OMZ::lib/completion.zsh

# I am testing the config below
# Might move to some better place(e.g. '~/$ZSH_CUSTOM/my_config.zsh') if I like it
# oh-my-zsh sets auto_pushd. I don't like it
unsetopt auto_pushd

# Do not add duplicate command in history
setopt hist_ignore_all_dups

# move cursor in insert mode
bindkey "^[f" forward-word
bindkey "^[b" backward-word

# source other dotfiles
for file in ~/.{aliases,exports,extras}; do
    [ -e "$file" ] && source $file;
done
unset file

# fzf fedora package installs shell fuzzy auto-completion and key bindings
# but bindings are not enabled by default. So we have to source the file
# that holds the bindings
source /usr/share/fzf/shell/key-bindings.zsh
