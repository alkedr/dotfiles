# Agent Notes

This repo contains personal macOS dotfiles and a small bootstrap script.

- `install.zsh` installs Homebrew if needed, installs apps/tools including Claude Code, Codex, Cursor CLI, fzf, and tmux, writes `~/.gitconfig`, symlinks `tmux.conf` to `~/.tmux.conf`, and makes `~/.zshrc` source this repo's `zshrc`.
- Prefer each AI CLI's official/recommended installer over installing all AI CLIs via Homebrew. Currently that means Claude Code via Anthropic's native installer, Codex via npm, and Cursor CLI via Cursor's install script.
- `zshrc` configures Homebrew and `~/.local/bin` paths, Python cache location, shell completion, fzf/fzf-tab, keybindings, Git aliases/helpers, prompt, and history behavior.
- `tmux.conf` configures tmux history, prefix, pane/window indexing, and mouse support.
- `README.md` is currently a brief TODO list for future dotfiles work.

Keep changes small and direct. If your changes make this file inaccurate or incomplete, update `AGENTS.md` in the same change.
