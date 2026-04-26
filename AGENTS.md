# Agent Notes

This repo contains personal macOS dotfiles and a small bootstrap script.

- `install.zsh` installs Homebrew if needed, installs apps/tools including Claude Code, Codex, fzf, and tmux, writes `~/.gitconfig`, symlinks `tmux.conf` to `~/.tmux.conf`, and makes `~/.zshrc` source this repo's `zshrc`.
- `zshrc` configures Homebrew path, Python cache location, shell completion, fzf/fzf-tab, keybindings, Git aliases/helpers, prompt, and history behavior.
- `tmux.conf` configures tmux history, prefix, pane/window indexing, and mouse support.
- `README.md` is currently a brief TODO list for future dotfiles work.

Keep changes small and direct. If your changes make this file inaccurate or incomplete, update `AGENTS.md` in the same change.
