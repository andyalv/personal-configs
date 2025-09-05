# # -------------------------------- START UP -------------------------------- #
# # Add DNS entry for Windows host
# if ! $(cat /etc/hosts | grep -q 'winhost'); then
#   echo 'Adding DNS entry for Windows host in /etc/hosts'
#   echo '\n# Windows host - added via ~/.zshrc' | sudo tee -a /etc/hosts
#   echo -e "$(grep nameserver /etc/resolv.conf | awk '{print $2, "   winhost"}')" | sudo tee -a /etc/hosts
# fi
# # -------------------------------- START UP -------------------------------- #



# -------------------------------- PATH -------------------------------- #
# Since I come from bash add variables to PATH
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:/snap/bin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.rustup/bin:$PATH"
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
export PATH="/mnt/c/Users/andre/AppData/Local/SumatraPDF:$PATH" # SumatraPDF
export PATH="/mnt/c/Program Files/Git/cmd:$PATH"

[[ -f /etc/profile ]] && source /etc/profile
# -------------------------------- PATH -------------------------------- #




# -------------------------------- ZSH CONFIG -------------------------------- #
# Path to my Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Oh My Zsh Theme
# Can be set to "random"
ZSH_THEME="dst" 

# Case-sensitive completion.
# CASE_SENSITIVE="true"

# Hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Change the auto-update behavior for ZSH
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# How often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Disable colors in ls
DISABLE_LS_COLORS="true"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Disable marking untracked files for GIT under VCS as dirty. This makes repository 
# status check for large repositories much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# History command output date format
HIST_STAMPS="dd/mm/yyyy"

# PLUGINS
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
 	git
 	zsh-autosuggestions
 	copyfile
 	dirhistory
 	history
 	you-should-use
 )

source $ZSH/oh-my-zsh.sh

# NOTE: Any keybindings must be set after sourcing Oh My Zsh, otherwise TMUX
# won't use them when loading a new terminal
# Thanks to this dude for explaining it: 
# https://stackoverflow.com/a/68509233/22472473
#
# Keybindings for autosuggestions
bindkey '^y' autosuggest-accept
bindkey '^x' autosuggest-execute
# -------------------------------- ZSH CONFIG -------------------------------- #




# -------------------------------- FREQUENT PATHS (CD) -------------------------------- #
# Personal directories
alias personal="cd '/mnt/c/Users/andre/Documents/[01] Personal'"
alias docs='cd /mnt/c/Users/andre/Documents/'
alias downloads='cd /mnt/c/Users/andre/Downloads/'
alias windows='cd /mnt/c/Users/andre'

# School-related directories
alias semester="cd '/mnt/c/Users/andre/Documents/[02] Escolar/[01] Universidad/[09] Noveno Semestre'"
alias semesters="cd '/mnt/c/Users/andre/Documents/[02] Escolar/[01] Universidad'"
alias snotes="cd '/mnt/c/Users/andre/Documents/[02] Escolar/[01] Universidad/notas-escolares'"
alias nsnotes="cd '/mnt/c/Users/andre/Documents/[02] Escolar/[01] Universidad/notas-escolares' && nvim ."
# -------------------------------- FREQUENT PATHS (CD) -------------------------------- #




# -------------------------------- ALIAS -------------------------------- #
# Terminal basics
alias omzr='omz reload'
alias zshconf='nvim ~/.zshrc'
alias zshconfr="echo 'Sourcing ~/.zshrc' && source ~/.zshrc"
alias tmuxconf='nvim ~/.tmux.conf'
alias nvimconf='cd ~/.config/nvim/ && nvim .'

# Windows DNS script
alias wdns='powershell.exe -Command "sudo python C:\Users\andre\nextdns.py"'

# 1Password SSH (Windows)
alias ssh="ssh.exe"
alias ssh-add="ssh-add.exe"

# Windows alias
# alias php="php.exe"
# alias psql="psql.exe"
alias java="java.exe"
alias adb="adb.exe"
alias gh="gh.exe"
alias git="git.exe"
alias tailscale="tailscale.exe"
# alias npm="npm.cmd"
# alias node="node.exe"

# Glazewm (windows tiling manager)
alias glazewmconf='cd /mnt/c/Users/andre/.glzr/glazewm/ && nvim /mnt/c/Users/andre/.glzr/glazewm/config.yaml'
# -------------------------------- ALIAS -------------------------------- #




# -------------------------------- Oh My Posh! -------------------------------- #
export POSH_THEMES_PATH='/mnt/c/Program Files (x86)/oh-my-posh/themes'

# Oh my posh!
if command -v oh-my-posh > /dev/null; then
    eval "$(oh-my-posh init zsh --config $POSH_THEMES_PATH/pure.omp.json)"
else
    echo "oh-my-posh no encontrado en el PATH"
fi
# -------------------------------- Oh My Posh! -------------------------------- #




# -------------------------------- Regular Config -------------------------------- #
# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Variables
export WIN_DOWNLOADS='/mnt/c/Users/andre/Downloads/'
export WIN_DOCS='/mnt/c/Users/andre/Documents/'
export WIN_PERSONAL="/mnt/c/Users/andre/Documents/[01] Personal/"
export WIN="/mnt/c/Users/andre"
# -------------------------------- Regular Config -------------------------------- #

# Disable Ctrl+S (XOFF) and Ctrl+Q (XON) flow control
bindkey -r '\C-s'
setopt noflowcontrol
unsetopt flowcontrol
stty -ixon -ixoff  # Also disable it in the terminal settings

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
