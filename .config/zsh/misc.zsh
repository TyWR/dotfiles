function pywal() {
    # generate color scheme from current wallpaper
    current_wallpaper="$(osascript -e 'tell app "finder" to get posix path of (get desktop picture as alias)')"
    wal -i $current_wallpaper -n --saturate $1
}

function theme() {
    cp ~/.config/themes/$1/colors-kitty.conf ~/.cache/wal/colors-kitty.conf
	cp ~/.config/themes/$1/colors.sh ~/.cache/wal/colors.sh
}
