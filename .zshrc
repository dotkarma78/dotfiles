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
  paru
	flatpak update
	local ORPHANS=$(paru -Qdqt)
	if [[ $ORPHANS != "" ]]; then
		paru -Rns $ORPHANS
	else
		echo "No orphans to remove"
	fi
	flatpak remove --unused
  echo "Updating dotfiles"
	timeout 15s git -C "/home/dotkarma78/Git Repositories/dotfiles" pull
  if [[ $? == 124 ]]; then
    echo "Timed out"
  fi
}
alias cc='clear'
alias ff='fastfetch'

eval "$(zoxide init zsh)"

autoload -Uz compinit
compinit

source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "/usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

PROMPT="%F{cyan}%~%f %(!.%F{red}#.%F{magenta}$)%f "
