fastfetch

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -------------------------------
# Zsh configuration - Arch + Hyprland
# -------------------------------

# Imposta Zsh come shell predefinita
export SHELL=/usr/bin/zsh

# -------------------------------
# Powerlevel10k
# -------------------------------
# Assicurati di aver installato il tema: 
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

ZSH_THEME="powerlevel10k/powerlevel10k"

# -------------------------------
# Plugin Oh-My-Zsh
# -------------------------------
# Assicurati di avere Oh-My-Zsh installato: 
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

plugins=(
  git              # comandi git semplificati
  zsh-autosuggestions   # suggerimenti automatici dei comandi
  zsh-syntax-highlighting # evidenziazione sintassi comandi
  extract          # estrazioni zip/tar/gz ecc.
  sudo             # corregge sudo automaticamente se sbagli
  history          # ricerca nella cronologia
)

# Carica Oh-My-Zsh
source ~/.oh-my-zsh/oh-my-zsh.sh

# -------------------------------
# Alias utili
# -------------------------------
alias ll='ls -lah'
alias gs='git status'
alias gd='git diff'
alias gp='git pull'
alias gpush='git push'
alias update='sudo pacman -Syu && yay -Syu'

# -------------------------------
# Completamento automatico
# -------------------------------
autoload -U compinit
compinit

# -------------------------------
# Variabili d'ambiente utili
# -------------------------------
export EDITOR=nano
export VISUAL=nano
export LANG=en_US.UTF-8
export PATH="$HOME/.local/bin:$PATH"

# -------------------------------
# Zsh options
# -------------------------------
#setopt auto_cd             # cambia directory senza 'cd'
setopt correct             # corregge comandi sbagliati
setopt hist_ignore_dups    # ignora duplicati in cronologia
setopt share_history       # condivide cronologia tra terminali

# -------------------------------
# Powerlevel10k instant prompt
# -------------------------------
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# ctrl + space to accept
bindkey '^ ' autosuggest-accept
export PATH=$PATH:/home/simosw/.spicetify
