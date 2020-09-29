export ZSH="$HOME/.oh-my-zsh"
export CONFIG="$HOME/.config"

source $ZSH/oh-my-zsh.sh

# Import Conda
source $CONFIG/zsh/conda.zsh

# Import paths
source $CONFIG/zsh/path.zsh

# Import aliases
source $CONFIG/zsh/aliases.zsh

# Import miscellaneous functions
source $CONFIG/zsh/misc.zsh

# Import environment variables
source $CONFIG/zsh/env.zsh

# Import custom theme
source $CONFIG/zsh/themes/tywr.zsh

# Import custom plugins
source $CONFIG/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $CONFIG/zsh/plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh
source $CONFIG/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $CONFIG/zsh/plugins/git/git.plugin.zsh
