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
    wallpaper ~/.config/themes/$1/wp.jpg
}
