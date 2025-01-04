#@ ssh
hosts=$(grep "^Host " ~/.ssh/config | sed 's/Host //' | tr -d ' ')
selected_host=$(echo "$hosts" | fzf --height=10% --reverse --prompt="Connect to: ")
if [ -n "$selected_host" ]; then
    ssh "$selected_host"
fi
exit

#@ ssh config
tmux rename-window "SSH CONFIG"
cd ~/.ssh/; nvim config
exit

#@ zshrc
tmux rename-window "ZSHRC"
cd ~/; nvim .zshrc
exit

#@ lazydocker
lazydocker
exit

#@ home tmux
if (do { tmux has-session -t "home" } | complete | get exit_code) == 0 {
    tmux switch-client -t "home"
} else {
    cd ~
    tmux new-session -d -s "home"
    tmux switch-client -t "home"
}
exit

#@ git graph
git log --oneline --graph --decorate --color=always | less -R
exit

#@ prettierd
prettierd restart

#@ reflog
let value = git reflog | lines | parse "{hash} {refname}@{number} {command}: {message}" | explore --peek
let choice = gum choose "Reset" "Checkout" "Exit"
if ($choice == "Reset") {
    git reset --hard $value
} else if ($choice == "Checkout") {
    git checkout $value
} else {
    exit
}
exit

#@ log
let value = git log --pretty=format:"%h|%s|%cr|%an" --date=short | lines | parse "{hash}|{message}|{relative_date}|{author}" | explore --peek
let choice = gum choose "Reset" "Checkout" "Exit"
if ($choice == "Reset") {
    git reset --hard $value
} else if ($choice == "Checkout") {
    git checkout $value
} else {
    exit
}
exit

#@ prs
gh pr list --json title,url,state,baseRefName,author,headRefName | from json

#@ python repl
python3
exit

#@ node repl
node
exit

#@ list files
zsh -c 'eza -a -lT --color always --ignore-glob="node_modules|.git|target|.turbo" | less -R'
exit

#@ commit
git add -p
let message = gum input --placeholder "Enter commit message"
if ($message == "") {
    echo "Commit message cannot be empty"
    exit 1
}
git commit -m $message
exit

#@ env
zsh -c 'find . -type f -name "*.env" | fzf | xargs nvim'
exit

#@ ghost config
tmux rename-window "GHOSTTY CONFIG"
cd /Users/drew/.config/ghostty/; nvim config
exit

#@ checkout branch
let branches = git branch --format "%(refname:short)"
let branch = $branches | fzf --prompt="Select branch: " --height=30% --reverse --preview="git log --oneline --graph --decorate --color=always {}"
git checkout $branch
exit

#@ edit
tmux rename-window "editing-pad"
nvim /Users/Benjamin/homepad.sh
exit

#@ stop docker
docker ps -a -q | lines | each { docker stop $in }

#@ nvim config
tmux rename-window "config-nvim"
cd /Users/Benjamin/.config/nvim/; nvim
exit
