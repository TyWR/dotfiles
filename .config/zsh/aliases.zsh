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
alias yt-mp3="youtube-dl --extract-audio --audio-quality 0 --audio-format mp3"
alias ecr42="aws ecr get-login --region us-east-1 --no-include-email --profile default | sh"
alias P="cd ~/Projects/"
alias p="cd ~/Projects/"
alias clean-docker="docker container rm $(docker container ls -aq)"
alias ts="date +"%Y%m%d""
alias esbulk="go run ~/Misc/esbulk/cmd/esbulk/esbulk.go"
alias python=python3
alias pip=pip3
alias drun="docker-compose build > /dev/null && docker-compose run"
alias dbuild="docker-compose build"
alias 42mongo="sh ~/.mongo-connect"
alias ghconfig="v ~/.ssh/config"

ctags=/usr/local/bin/ctags
