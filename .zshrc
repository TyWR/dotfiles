export ZSH="$HOME/.oh-my-zsh"

# Import oh my zsh
source $ZSH/oh-my-zsh.sh

plugins=(
    zsh-autosuggestions
    vi-mode
    docker
)

autoload -U compinit && compinit

# Import aliases
source $HOME/.config/zsh/aliases.zsh

# Import miscellaneous functions
source $HOME/.config/zsh/misc.zsh

# Import environment variables
source $HOME/.config/zsh/env.zsh

# Import custom theme
source $HOME/.config/zsh/themes/tywr.zsh

# Import syntax highlighting
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


