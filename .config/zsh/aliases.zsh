# ============================================================================
#                               Aliases
# ============================================================================
alias v="nvim"
alias vim="nvim"
alias vi="nvim"
alias ff="nvim '+Telescope find_files'"
alias vs="nvim '+Telescope tmux sessions'"
alias ls="eza"
alias oldvim="vim"
export EDITOR=nvim
alias lg="lazygit"
alias r="ranger"
alias ra="ranger"
alias ecr42="aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 041667147252.dkr.ecr.us-east-1.amazonaws.com"
alias P="cd ~/Projects/"
alias p="cd ~/Projects/"
alias S="cd ~/Sandbox/"
alias s="cd ~/Sandbox/"
alias python=python3.11
alias pip=pip3.11
alias drun="docker compose build && docker compose run"
alias dbuild="docker compose build"
alias ghconfig="v ~/.ssh/config"
alias tmux="tmux -2"
alias ts="fuzzy_tmux_sessions"
alias tk="tmux kill-window"
alias tls="tmux list-sessions"
alias tks="tmux kill-session -t"
alias tas="tmux attach-session -t"
alias ta="tmux attach-session -t"
alias tn="tmux new -s"
alias pcat="parquet-tools cat"
alias av="aws-vault exec tanguy42"
alias nvimpython=".local/venv/nvim/bin/python"
alias bat="bat --theme ansi --style plain"
alias ala="v .config/alacritty/alacritty.toml"
alias ..="cd .."
alias og="~/.config/bin/obsidian_organize"
alias on="~/.config/bin/obsidian_new --no-name"
alias onn="~/.config/bin/obsidian_new"
alias ni="cd ~/Notes/inbox"
alias nn="cd ~/Notes/notes"

ctags=/usr/local/bin/ctags