# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
POWERLEVEL9K_COLOR_SCHEME='light'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
#POWERLEVEL9K_MODE='awesome-fontconfig'
ZSH_THEME="powerlevel9k/powerlevel9k"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails2 git ruby bundler osx)

# bindkey for backward search (doesn't work per default in vi-mode)
#bindkey -v
#bindkey '\e[3~' delete-char
#bindkey '^R' history-incremental-search-backward

# Initialise rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export FUCHS_DEV=$HOME/Sites/fuchs
# Customize to your needs...
#export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin
export PATH=/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bib:/usr/local/sbin:/Users/olivernoack/Library/Python/3.7/bin

#export PATH=/usr/local/bin:$PATH



# Oracle Development: ruby-oci8
export DYLD_LIBRARY_PATH=/opt/oracle/instantclient_12_1
export OCI_DIR=/opt/oracle/instantclient_12_1
export NLS_LANG=GERMAN_GERMANY.UTF8
export NLS_COMP=LINGUISTIC
export NLS_SORT=BINARY_CI
source $ZSH/oh-my-zsh.sh

VIM_EDITOR_NORC='vim -u NORC'
EDITOR="$HOME/.std_editor"; export EDITOR

# Map history backward search (Ctrl-R in emacs mode) to [command-mode]?
#bindkey '^R' history-incremental-pattern-search-backward

alias v='vim'
alias gti=git
# my favorite typo
# push has an alias tpush with "git config --global alias.tpush push"
# push has an alias tpush with "git config --global alias.tpull pull"
alias gi=git
alias cleanup-local-branches='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# chromedriver bugfix?!
LANG=en_US.UTF-8

hash -d fu="$HOME/Sites/fuchs"
alias fu='~fu'

hash -d pf="$HOME/Sites/pfreundt"
alias pf='~pf'
setopt cdablevars

[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"
