# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="muse"

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
plugins=(rails2 git ruby bundler osx fu)

# bindkey for backward search (doesn't work per default in vi-mode)
#bindkey -v
#bindkey '\e[3~' delete-char
#bindkey '^R' history-incremental-search-backward

# Customize to your needs...
export PATH=/usr/local/heroku/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bib:/usr/local/sbin

# Initialise rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Oracle Development: ruby-oci8
export DYLD_LIBRARY_PATH=/opt/oracle/instantclient_11_2
export NLS_LANG=GERMAN_GERMANY.UTF8
export NLS_COMP=LINGUISTIC
export NLS_SORT=BINARY_CI
source $ZSH/oh-my-zsh.sh

VIM_EDITOR_NORC='vim -u NORC'
EDITOR="$HOME/.std_editor"; export EDITOR

# Ruby settings from Compeon
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_FREE_MIN=500000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000

# Activate vi mode
set -o vi

# Map history backward search (Ctrl-R in emacs mode) to [command-mode]?
bindkey '^R' history-incremental-pattern-search-backward

alias m='mvim'
alias gti=git

mvim_fc() {
  mvim $(git status | grep 'both modified' |cut -d: -f2 | head -1)
}
rslv_fc() {
  git add $(git status | grep 'both modified' |cut -d: -f2 | head -1)
}
