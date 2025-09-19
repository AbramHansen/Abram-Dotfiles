function gropen {
    local search=$1
    local directory=$2
    if [[ -z $directory ]]; then
        directory="."
    fi

    local filename=$(grep -r "$search" "$directory" | fzf | cut -d: -f1)

    # open the file in neovim with the searched for text highlighted
    if ! [[ -z $filename ]]; then
        nvim -c "/$search" $filename
    fi
}
