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
export PATH="$(yarn global dir):/$HOME/.local/bin:$HOME/bin:$HOME/.config/Code/User/globalStorage/sigbots.pros/install/pros-cli-linux/:$HOME/.config/Code/User/globalStorage/sigbots.pros/install/pros-toolchain-linux/bin::$PATH"
export DENO_INSTALL="/home/chrono/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/home/chrono/.oh-my-zsh"

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

  git
  yarn
  rust

  extract
)

source $ZSH/oh-my-zsh.sh

# User configuration & environment

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nvim'
fi

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
# alias config='/usr/bin/git --git-dir=/home/chrono/.cfg/ --work-tree=/home/chrono'

export SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
source ~/.secret.sh
source "$HOME/.cargo/env"
function list_installed_pkgs {
  rpm -qa --queryformat '%10{size} - %-25{name} \t %{version} \t %{os} \n' | sort -n | awk '{print $1/1024/1024, $2, $3, $4}'
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
