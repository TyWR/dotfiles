function pywal() {
    # generate color scheme from current wallpaper
    current_wallpaper="$(osascript -e 'tell app "finder" to get posix path of (get desktop picture as alias)')"
    wal -i $current_wallpaper -n --saturate $1
}

function newtab() {
    prev=$PWD
    cd ~/.config/newtab/
    nohup python -m run
    cd $prev
}

function tfcolors() {
    sh $HOME/.config/zsh/scripts/tiefighters.sh
}

function wallpaper() {
    target=$1
    sc="tell application \"Finder\" to set desktop picture to POSIX file \"${target}\""
    osascript -e $sc
}

function theme() {
    cp ~/.config/themes/$1/colors-kitty.conf ~/.cache/wal/colors-kitty.conf
	cp ~/.config/themes/$1/colors.sh ~/.cache/wal/colors.sh
	cp ~/.config/themes/$1/colors.yml ~/.cache/wal/colors.yml
    wallpaper ~/.config/themes/$1/wp.jpg
    sh ~/.config/zsh/scripts/alacritty-colors.sh
    launchctl kickstart -k "gui/${UID}/homebrew.mxcl.yabai"
}

function fontsize() {
    size=$1
    sed_string="s/size: [0-9][0-9]*/size: ${size}/"
    config=$HOME/.config/alacritty/alacritty.yml
    tmp=$HOME/.config/alacritty/tmp.yml
    cat $config | sed "$sed_string" > $tmp
    cp -f $tmp $config
    rm $tmp
}

function sync-config {
    dotfiles=~/Sandbox/dotfiles
    echo "Dotfiles repo location ${dotfiles}"
    rmtrash ~/Sandbox/dotfiles/.config
    mkdir ~/Sandbox/dotfiles/.config
    names=(alacritty coc htop neofetch nvim ranger skhd status.widget themes wal yabai zathura zsh)
    for name in $names; do
        echo "Copying $name..."
        cp -R ~/.config/$name $dotfiles/.config/$name
    done
    echo "Copying .zshrc"
    cp ~/.zshrc "${dotfiles}.zshrc"
}


function topdf {
    pandoc \
            $1 \
            -f gfm \
            -o $1.pdf \
            -V geometry:margin=2cm \
            -V mainfont="Futura" \
            --pdf-engine=xelatex
    }
