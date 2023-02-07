# ============================================================================
#                               Aliases
# ============================================================================
alias v="nvim"
alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"
export EDITOR=nvim
alias lg="lazygit"
alias r="ranger"
alias ra="ranger"
alias sv="sudo nvim"
alias sr="sudo ranger"
alias wpm="python -m wpm"
alias hour="date +'%H:%M'"
alias ecr42="aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 041667147252.dkr.ecr.us-east-1.amazonaws.com"
alias P="cd ~/Projects/"
alias p="cd ~/Projects/"
alias ts="date +"%Y%m%d""
alias python=python3.11
alias pip=pip3.11
alias drun="docker-compose build > /dev/null && docker-compose run"
alias dbuild="docker-compose build"
alias 42mongo="sh ~/.mongo-connect"
alias ghconfig="v ~/.ssh/config"
alias de="v ~/Documents/deutsch"
alias awsconfig="v ~/.aws/config"
alias tmux="tmux -2"
alias tk="tmux kill-window"
alias tls="tmux list-sessions"
alias tks="tmux kill-session -t"
alias tas="tmux attach-session -t"
alias ta="tmux attach-session -t"
alias tn="tmux new -s"
alias rsc="bash ~/.redshift-connect"
alias pcat="parquet-tools cat"

ctags=/usr/local/bin/ctags
