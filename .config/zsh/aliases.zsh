# ============================================================================
#                               Aliases
# ============================================================================
alias v="nvim"
alias vim="nvim"
alias vi="nvim"
alias oldvim="vim"
export EDITOR=nvim
alias icat="kitty +kitten icat"
alias lg="lazygit"
alias r="ranger"
alias ra="ranger"
alias sv="sudo nvim"
alias sr="sudo ranger"
alias wpm="python -m wpm"
alias hour="date +'%H:%M'"
alias yt-mp3="youtube-dl --extract-audio --audio-quality 0 --audio-format mp3"
alias redshift='psql "host=$REDSHIFT_HOST user=$REDSHIFT_USERNAME dbname=$REDSHIFT_DB port=$REDSHIFT_PORT password=$REDSHIFT_PASSWORD"'
alias ecr42="aws ecr get-login --region us-east-1 --no-include-email --profile default | sh"
alias P="cd ~/Projects/"
alias p="cd ~/Projects/"
alias clean-docker="docker container rm $(docker container ls -aq)"
alias k="kitty --single-instance -d=$PWD"
alias ts="date +"%Y%m%d""
alias esbulk="go run ~/Misc/esbulk/cmd/esbulk/esbulk.go"
alias n="nnn -Ce"

ctags=/usr/local/bin/ctags
python=~/.miniconda3/bin/python
