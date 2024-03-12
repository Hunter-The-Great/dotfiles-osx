alias dt='cd ~/desktop'
alias ali='sudo nvim ~/.zshrc'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
alias clr='clear'
alias wrt='sudo nvim /etc/motd'
alias starWars='telnet towel.blinkenlights.nl'
alias run='osascript -e'
alias icns='sips -s format icns'
alias keyRepeat='defaults write -g ApplePressAndHoldEnabled -bool'
alias entry='cd ~/library/babel; nvim journal'
alias filePaths='defaults write com.apple.finder _FXShowPosixPathInTitle -bool'
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias config="cd ~/.config/alacritty; nvim alacritty.toml"

path+=("/Users/Benjamin/bin")

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
