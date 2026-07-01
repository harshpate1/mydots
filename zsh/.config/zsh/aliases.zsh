# -------- Aliases --------

# Better ls
alias ls='eza --icons'

# Detailed Listing
alias ll='eza -lh --icons --git'

# Detailed listing including hidden files
alias la='eza -lah --icons --git'

# Tree View
alias tree='eza --tree --icons'

# Reuse ls completions for eza (avoids defining a separate completion function)
compdef eza=ls

# Better cat
alias cat='bat'

# Core Utilities
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias df='df -h'

# Navigation
alias -- -='cd -'  # -- prevents - being parsed as a flag; cd - jumps to previous directory

# Editor
alias vs='vscodium'
alias n='nvim'

# Git
alias glog='PAGER="less -F -X" git log'                              # -F quit if one screen, -X no clear on exit
alias gadog='PAGER="less -F -X" git log --all --decorate --oneline --graph'
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# Video
alias stream='mpv av://v4l2:/dev/video4 --fullscreen --demuxer-lavf-o=input_format=mjpeg,framerate=30 --profile=low-latency --untimed'

# Games
alias minecraft='cd ~/Games/Minecraft && \
__NV_PRIME_RENDER_OFFLOAD=1 \
__GLX_VENDOR_LIBRARY_NAME=nvidia \
__VK_LAYER_NV_optimus=NVIDIA_only \
VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json \
gamemoderun java -jar SKlauncher.jar'
# alias lutris='prime-run lutris & disown'
alias steam='prime-run steam & disown'

# Hyprland
alias cur='hyprctl setcursor'

# Package Management Utils
alias ps='pacman -Ss'
alias pq='pacman -Qs'
alias pi='sudo pacman -S'
alias pr='sudo pacman -Rns'
alias s='yay -Ss'
alias yq='yay -Qs'
alias yi='yay -S'
alias yr='yay -Rns'
alias pacup='sudo pacman -Syu'
alias yup='yay -Syu'
alias topgrade='topgrade'
alias p='pacsea'

# Applications
alias sysdman='systemd-manager-tui'
alias caffeine='killall hypridle'
alias bt='bluetuith'
alias btop='btop'
alias nvtop='nvtop'
alias cava='cava'
alias tufw='tufw'
alias typtea='typtea'
alias astro='astroterm'
alias pastel='pastel'
# alias envx='envx tui'
alias photoai='OpenPhotoAI & disown'

# Gtk
alias gtktheme='gsettings set org.gnome.desktop.interface gtk-theme'
alias gtkcolor='gsettings set org.gnome.desktop.interface color-scheme' #"prefer-dark" or "prefer-light"

# Troubleshoot
alias mpdup='systemctl --user enable --now mpd'

# Git
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gu="git pull"
alias gl="git log"
alias gb="git branch"
alias gi="git init"
alias gcl="git clone"
alias gap="git add --patch"
