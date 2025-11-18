function gropen {
    local search=$1
    local directory=$2
    if [[ -z $directory ]]; then
        directory="."
    fi

    preview_command='sh -c "batcat --theme=base16 --style=numbers --color=always --line-range $(($(echo {} | cut -d: -f2)-5)):$(($(echo {} | cut -d: -f2)+100)) --highlight-line $(echo {} | cut -d: -f2) $(echo {} | cut -d: -f1)"'

    local selected_line=$(grep -iIRn "$search" "$directory" 2>/dev/null | fzf --preview "$preview_command")

    # open the file in neovim with line selected
    if ! [[ -z $selected_line ]]; then 
        local filename=$(echo "$selected_line" | cut -d: -f1)
        local line_number=$(echo "$selected_line" | cut -d: -f2)
        nvim "+$line_number" "$filename" 
    fi
}
