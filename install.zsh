#!/bin/zsh

set -eux

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
export PATH="$HOME/.local/bin:/opt/homebrew/bin:$PATH"

# Install homebrew
command -v brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Apps
[ -d /Applications/iTerm.app ] || brew install --cask iterm2
[ -d /Applications/Rectangle.app ] || brew install --cask rectangle

# AI CLIs
command -v claude || curl -fsSL https://claude.ai/install.sh | bash
command -v npm || brew install node
command -v codex || npm install -g @openai/codex
command -v agent || curl https://cursor.com/install -fsS | bash

# fzf
command -v fzf || brew install fzf
[ -d ~/code/fzf-tab ] || git clone https://github.com/Aloxaf/fzf-tab.git ~/code/fzf-tab

# tmux
command -v tmux || brew install tmux
ln -sF "$SCRIPT_DIR/tmux.conf" ~/.tmux.conf

# Git
cat > ~/.gitconfig << 'EOF'
[user]
	name = Alex Kedryk
	email = alexander.kedrik@gmail.com

[init]
	defaultBranch = main
EOF


echo "source '$SCRIPT_DIR/zshrc' || echo 'failed to source zshrc'" > ~/.zshrc
