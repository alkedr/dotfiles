#!/bin/zsh

set -eux

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Install homebrew
command -v brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Apps
[ -d /Applications/iTerm.app ] || brew install --cask iterm2
[ -d /Applications/Rectangle.app ] || brew install --cask rectangle

# fzf
command -v fzf || brew install fzf
[ -d ~/code/fzf-tab ] || git clone https://github.com/Aloxaf/fzf-tab.git ~/code/fzf-tab

# tmux
command -v tmux || brew install tmux
ln -sF "$SCRIPT_DIR/.tmux.conf" ~/.tmux.conf

# Git
cat > ~/.gitconfig << 'EOF'
[user]
	name = Alex Kedryk
	email = alexander.kedrik@gmail.com

[init]
	defaultBranch = main
EOF


echo "source $SCRIPT_DIR/zshrc || echo \"failed to source zshrc\"" > ~/.zshrc
