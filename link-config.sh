create_symlink() {
    if [ "$#" -ne 2 ]; then
        echo "Error: Missing arguments."
        return 1
    fi

    local abram_dotfiles_dir=$(dirname "$(realpath "$0")")
    local source_name="$1"
    local destination_path="$2"

    if [ ! -e "$abram_dotfiles_dir/$source_name" ]; then
        echo "Error: Folder '$source_name' does not exist."
        return 1
    fi

    # Check if the symlink already exists and remove it if necessary
    if [ -L "$destination_path" ] || [ -d "$destination_path" ]; then
        echo "Removing existing symlink or directory: $destination_path"
        rm "$destination_path"
    fi

    # Create the symlink
    ln -s "$abram_dotfiles_dir/$source_name" "$destination_path"
    echo "Symlink created: $destination_path -> $abram_dotfiles_dir/$source_name"
}

create_symlink "nvim" ~/.config/nvim
create_symlink "bash" ~/.config/bash
create_symlink "tmux" ~/.config/tmux
create_symlink "htop" ~/.config/htop
create_symlink "gdb" ~/.config/gdb
create_symlink "git" ~/.config/git
create_symlink "yazi" ~/.config/yazi
create_symlink "readline/inputrc.sh" ~/.inputrc

sudo bash -c "$(declare -f create_symlink); create_symlink 'keyd' '/etc/keyd'"
sudo systemctl restart keyd
