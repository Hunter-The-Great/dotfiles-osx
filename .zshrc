alias rc='nvim ~/.zshrc'
alias wrt='sudo nvim /etc/motd'
alias starWars='telnet towel.blinkenlights.nl'
alias entry='cd ~/library/babel; nvim journal'
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias config="cd ~/.config/ghostty; nvim config"

path+=("/Users/Benjamin/bin")
path+=("/Users/Benjamin/scripts")
path+=('/Users/Benjamin/go/bin')

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun completions
[ -s "/Users/Benjamin/.bun/_bun" ] && source "/Users/Benjamin/.bun/_bun"
