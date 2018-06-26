# Inspired on https://github.com/paulirish/dotfiles

# Load zplugin - Zsh plugin manager
source ~/.zplugin/bin/zplugin.zsh

# Load plugins
export SPACESHIP_ROOT=~/.zplugin/plugins/denysdovhan---spaceship-prompt
zplugin load denysdovhan/spaceship-prompt
zplugin load zsh-users/zsh-autosuggestions
zplugin load zsh-users/zsh-syntax-highlighting
zplugin load zdharma/zsh-diff-so-fancy
zplugin ice pick"z.sh"
zplugin load rupa/z

# Load oh-my-zsh plugins
zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh
zplugin snippet OMZ::plugins/tmux/tmux.plugin.zsh
zplugin snippet OMZ::plugins/vi-mode/vi-mode.plugin.zsh

# Load oh-my-zsh core lib. Maybe move this to my own files?
zplugin snippet OMZ::lib/directories.zsh
zplugin snippet OMZ::lib/functions.zsh
zplugin snippet OMZ::lib/git.zsh
zplugin snippet OMZ::lib/key-bindings.zsh
zplugin snippet OMZ::lib/misc.zsh

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
# zplugin snippet OMZ::lib/completion.zsh

# I am testing the config below
# Might move to some better place(e.g. '~/$ZSH_CUSTOM/my_config.zsh') if I like it
# Do not add duplicate command in history
setopt hist_ignore_all_dups

# move cursor in insert mode
bindkey "^[f" forward-word
bindkey "^[b" backward-word

# ========================================================================
# stuff above this line comes from my migration from oh-my-zsh to zplugin
# I am removing/reducing stuff above this line and putting it down here or
# in my other dotfiles(aliases,...)

## completion settings
# Enable completion
autoload -Uz compinit
compinit

# complete when cursor is in middle of word
setopt complete_in_word

# completion style definition
zstyle ':completion:*' menu select      # enhanced selection of completion alternatives

autoload -U colors && colors

# change directory by writing its name
setopt auto_cd

# make a cd push the old directory onto the directory stack
# https://www.refining-linux.org/archives/55-ZSH-Gem-20-Changing-directories-the-pros-way.html
setopt auto_pushd

# disable beep on error
setopt no_beep

# spell checking and autocorrection
# https://www.refining-linux.org/archives/39-ZSH-Gem-4-Spell-checking-and-auto-correction.html
setopt correct_all

# History configuration
HISTFILE=$HOME/.zsh_history
HISTORY_IGNORE="(exit|fg|history|ls|pwd)"
HISTSIZE=50000                # number of lines to store in memory
SAVEHIST=10000                # number of lines to store in $HISTFILE
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

# source other dotfiles
for file in ~/.{aliases,exports,extras,functions,local.env}; do
    [ -e "$file" ] && source $file;
done
unset file

# fzf fedora package installs shell fuzzy auto-completion and key bindings
# but bindings are not enabled by default. So we have to source the file
# that holds the bindings
source /usr/share/fzf/shell/key-bindings.zsh
