# Inspired on https://github.com/paulirish/dotfiles

#Configure antigen
ANTIGEN_COMPDUMP=$HOME/.zcompdump

# Load antigen - Zsh plugin manager
source $HOME/.antigen/antigen.zsh

# Load antigen bundles

# oh-my-zsh libs
# libs that I use from oh-my-zsh: lib/{completion,functions,git,key-bindings,misc}
# maybe I should stop using them and use my own stuff?
# antigen use oh-my-zsh

# oh-my-zsh plugins
antigen bundle django
antigen bundle docker
antigen bundle docker-compose
antigen bundle extract
antigen bundle git
antigen bundle ssh-agent
antigen bundle tmux
antigen bundle vi-mode

# other bundles
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zdharma/zsh-diff-so-fancy
antigen bundle rupa/z
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

# theme
antigen theme denysdovhan/spaceship-prompt

antigen apply

# ========================================================================
# stuff above this line comes from my migration from oh-my-zsh to zplugin to antigen
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
# ignore case completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' rehash true      # automatically find new executables in $PATH.May be a problem if there $PATH has network folders

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
setopt hist_ignore_all_dups
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

# keybindings
bindkey '^P' history-substring-search-up   # ctrl-p history search
bindkey '^N' history-substring-search-down # ctrl-n history search
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# source other dotfiles
for file in ~/.{aliases,exports,extras,functions,local.env}; do
    [ -e "$file" ] && source $file;
done
unset file

# fzf fedora package installs shell fuzzy auto-completion and key bindings
# but bindings are not enabled by default. So we have to source the file
# that holds the bindings
source /usr/share/fzf/shell/key-bindings.zsh
