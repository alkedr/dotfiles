#!/bin/zsh

set -eux

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
export PATH="$HOME/.local/bin:/opt/homebrew/bin:$PATH"

# Replace $dst with a symlink to $src. If $dst already exists as a real
# directory (e.g. an app created it on first launch), move it aside first.
link_dir() {
  local src="$1" dst="$2"
  [ "$(readlink "$dst")" = "$src" ] && return 0
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    mv "$dst" "$dst.bak.$(date +%s)"
  fi
  mkdir -p "$(dirname "$dst")"
  ln -s "$src" "$dst"
}

# Install homebrew
command -v brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Apps
[ -d /Applications/iTerm.app ] || brew install --cask iterm2
[ -d /Applications/Rectangle.app ] || brew install --cask rectangle
[ -d /Applications/IINA.app ] || brew install --cask iina
[ -d "/Applications/Visual Studio Code.app" ] || brew install --cask visual-studio-code

# VS Code config: whole User dir lives in this repo (see vscode/.gitignore)
link_dir "$SCRIPT_DIR/vscode" "$HOME/Library/Application Support/Code/User"
installed_extensions="$(code --list-extensions)"
while read -r ext; do
  [ -z "$ext" ] && continue
  echo "$installed_extensions" | grep -qxF "$ext" || code --install-extension "$ext"
done < "$SCRIPT_DIR/vscode/extensions.txt"

# AI CLIs
command -v claude || curl -fsSL https://claude.ai/install.sh | bash
command -v npm || brew install node
command -v codex || npm install -g @openai/codex
command -v agent || curl https://cursor.com/install -fsS | bash

# Claude Code config: whole ~/.claude lives in this repo (see claude/.gitignore)
link_dir "$SCRIPT_DIR/claude" ~/.claude

# fzf
command -v fzf || brew install fzf
[ -d ~/code/fzf-tab ] || git clone https://github.com/Aloxaf/fzf-tab.git ~/code/fzf-tab

# ripgrep
command -v rg || brew install ripgrep

# tmux
command -v tmux || brew install tmux
ln -sF "$SCRIPT_DIR/tmux.conf" ~/.tmux.conf

# Git
cat > ~/.gitconfig << 'EOF'
[user]
	name = Sasha Kedryk
	email = alexander.kedrik@gmail.com

[init]
	defaultBranch = main
EOF


echo "source '$SCRIPT_DIR/zshrc' || echo 'failed to source zshrc'" > ~/.zshrc
