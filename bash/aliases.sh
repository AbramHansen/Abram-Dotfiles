# python
alias python="python3"
alias py="python3"
alias pdb="python3 -m pdb"

# neovim
alias vi="nvim"
alias vim="nvim"
alias diff="nvim -d"

# ls
alias ll='ls -lChAgGF'
alias la='ls -AF'
alias l='ls -CF'

# file managment
alias cp='cp -i'
alias mv='mv -i'

# ollama
alias qwen="ollama run qwen2.5-coder"

# fzf
alias fzf='fzf --color=16 --prompt="" --info=inline-right --multi --bind "ctrl-a:toggle-all" --marker="*"'
alias fzfp='fzf --color=16 --prompt="" --info=inline-right --multi --bind "ctrl-a:toggle-all" --marker="*" --preview="batcat -p --theme base16 --color=always --line-range=:250 {}"'

# batcat
alias batcat="batcat -p --theme base16"
alias bat="batcat -p --theme base16"
