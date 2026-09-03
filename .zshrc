HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY

setopt AUTO_CD
setopt CORRECT_ALL
setopt EXTENDED_GLOB

sysupg() {
  paru || return 1
  paru --needed -S bat eza git zoxide zsh-autocomplete zsh-autosuggestions zsh-completions zsh-syntax-highlighting
  paru -c
  local DOTFILES_DIR="/home/quackise/Git Repositories/dotfiles"
  echo "Updating dotfiles"
  timeout 15s git -C "$DOTFILES_DIR" pull
  if [[ $? == 124 ]]; then
    echo "Timed out"
  fi
}
alias cc='clear'
alias ff='fastfetch'

fpath=(/usr/share/zsh/plugins/zsh-completions/src $fpath)
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(zoxide init zsh)"

PROMPT="%F{cyan}%~ %(!.%F{red}#.%F{magenta}$)%f "
