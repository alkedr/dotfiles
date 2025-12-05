# Homebrew
export PATH="/opt/homebrew/bin:$PATH"


# Move pycache files out of the repositories
export PYTHONPYCACHEPREFIX=/tmp/pycache


# Shell completion
if ! typeset -f compdef >/dev/null; then
  autoload -Uz compinit
  compinit
fi


# fzf
source <(fzf --zsh)
source ~/code/fzf-tab/fzf-tab.plugin.zsh


# Up/Down search history by what’s left of cursor
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward


# Git
alias g='git'
alias gst='g status'

alias gf='g fetch'
alias gp='g pull'
alias gps='g push'
alias gpf='g push --force'

gs() {
  g switch "$@" && return
  read "?Branch '$1' doesn't exist. Create it? [Y/n] " confirm
  [[ ! "$confirm" =~ ^[Nn]$ ]] && g switch --create "$1"
}

alias gr='g rebase -i origin/main'
alias gcp='g cherry-pick'

alias gpr='gh pr create --web'


# Shell prompt
autoload -Uz vcs_info
setopt prompt_subst

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats ' %b'

precmd() { vcs_info }

PROMPT='%D{%d %H:%M}${vcs_info_msg_0_} %(?.%F{magenta}.%F{red})❯%f '


# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
