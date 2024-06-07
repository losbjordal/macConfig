# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouragqed to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

## -------- custom function and alias ----------------- #
function pw(){
    SECONDS=$(date '+%s')
    GENRAND=$((RANDOM))
    echo $(expr $SECONDS \* $GENRAND) | shasum |  sed 's/|/ /' | awk '{print $1, $8}' | base64 | cut -c 1-24
}

alias kk='kustomize build --enable-helm|yq'
alias ll="ls -la"
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
alias isodate='(date '+%Y%m%d%H%M')'
alias pass='(date +%s | shasum | base64 | head -c 32 ; echo)'
alias date='date -Iseconds'
alias yless='yq -C eval-all | less -R'
e64(){print $1|base64}
d64(){print $1|base64 -d}

## ------- prompt ----- ##
#autoload -Uz vcs_info
#precmd() { vcs_info }

#zstyle ':vcs_info:git:*' formats '%b '

#setopt PROMPT_SUBST
#PROMPT='%F{white}%*%f %F{green}%~%f %F{red}( ${vcs_info_msg_0_})%f
#'

PROMPT='%F{white}%*%f %F{green}%~%f
'
# %F{yellow}>%f '
export GPG_TTY=$(tty)

## ----- home ------ ##

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export PATH="$HOME/go/bin:/opt/homebrew/opt/postgresql@16/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"


## ----------- completion ------------ ##
# https://thevaluable.dev/zsh-completion-guide-examples/
# kubectl autocompletion
#if [ $commands[kubectl] ]; then source <(kubectl completion zsh); compdef _kubectl kubectl; fi
# helm autocompletion
#if [ $commands[helm] ]; then source <(helm completion zsh); compdef _helm helm; fi
# oc autocompleteion
#if [ $commands[oc] ]; then source <(oc completion zsh); compdef _oc oc; fi
# flux completion
#if [ $commands[flux] ]; then source <(flux completion zsh); compdef _flux flux; fi
#if [ $commands[argocd] ]; then source <(argocd completion zsh); compdef _argocd argocd; fi
#if [ $commands[velero] ]; then source <(velero completion zsh); compdef _velero velero; fi
autoload bashcompinit && bashcompinit
source $(brew --prefix)/etc/bash_completion.d/az
autoload -Uz compinit && compinit
