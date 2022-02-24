# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
# then
#     PATH="/$HOME/.local/bin:$HOME/bin:$PATH"
# fi

# Path to your oh-my-zsh installation.
export ZSH="/home/grey/.oh-my-zsh"

# Themes
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=powerlevel10k/powerlevel10k
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Plugins
plugins=(
  sudo
  dnf

  zsh-autosuggestions
  zsh-syntax-highlighting
  # command-not-found

  git
  # nvm
  yarn
  docker

  extract
)

source $ZSH/oh-my-zsh.sh

# User configuration & environment

# export MANPATH="/usr/local/man:$MANPATH"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
alias loadnvm='NVM_DIR="$HOME/.nvm"; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$(yarn global bin):/$HOME/.local/bin:$HOME/bin:$PATH"
export SPICETIFY_INSTALL="/home/grey/spicetify-cli"
export PATH="$SPICETIFY_INSTALL:$PATH"

eval "$(hub alias -s)"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nano'
# else
#   export EDITOR='nvim'
# fi
export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
# 
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"s
alias vim="nvim"
alias config='/usr/bin/git --git-dir=/home/grey/.cfg/ --work-tree=/home/grey'
alias please='sudo'

source ~/.secret.sh
function list_installed_pkgs {
  rpm -qa --queryformat '%10{size} - %-25{name} \t %{version} \t %{os} \n' | sort -n | awk '{print $1/1024/1024, $2, $3, $4}'
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
