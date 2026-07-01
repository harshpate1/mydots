#                        █████                        
#                       ░░███                         
#      █████████  █████  ░███████   ████████   ██████ 
#     ░█░░░░███  ███░░   ░███░░███ ░░███░░███ ███░░███
#     ░   ███░  ░░█████  ░███ ░███  ░███ ░░░ ░███ ░░░ 
#       ███░   █ ░░░░███ ░███ ░███  ░███     ░███  ███
#  ██  █████████ ██████  ████ █████ █████    ░░██████ 
# ░░  ░░░░░░░░░ ░░░░░░  ░░░░ ░░░░░ ░░░░░      ░░░░░░  


fastfetch

# --------------- History ------------------

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS


# -------- Shell Behaviour ----------
setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT #sort file10 afte file9, not after file1

# --------------------- Smart Directory Navigation -----------

# Initialize zoxide
eval "$(zoxide init zsh)"

# -------------------- Completion -----------------

# Load completion system
autoload -Uz compinit

# Initialize completion with cached metadata file
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

# Enable interactive completion menu selection
zstyle ':completion:*' menu select

# make completion case-insensitive
# ex: "doc" can complete to "Documents"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ------------------ FZF - Fuzzy Finder -----------------------
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
fi

# ------------------ Modular Config Files ----------------------

# fzf configuration
source "$ZDOTDIR/fzf.zsh"

# Aliases
source "$ZDOTDIR/aliases.zsh"

# Custom keybindings
source "$ZDOTDIR/bindings.zsh"

# Plugins and plugin manager
source "$ZDOTDIR/plugins.zsh"

# Prompt/theme
source "$ZDOTDIR/prompt.zsh"

# -------- Environment --------
export MPD_HOST=127.0.0.1
export MPD_PORT=6600
unset MPD_SOCKET

source <(fzf --zsh)

# -------- Yazi (same as bash) --------
y() {
  local tmp cwd
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [[ -n "$cwd" && "$cwd" != "$PWD" ]] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

# -------- Conda (zsh-native) --------
__conda_setup="$('/home/harsh/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [[ $? -eq 0 ]]; then
  eval "$__conda_setup"
else
  [[ -f "/home/harsh/miniconda3/etc/profile.d/conda.sh" ]] && \
    source "/home/harsh/miniconda3/etc/profile.d/conda.sh"
fi
unset __conda_setup
