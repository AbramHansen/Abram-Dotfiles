# python
alias python="python3"
alias py="python3"
alias pdb="python3 -m pdb"

# vi
alias vi="nvim"
alias vim="nvim"
alias diff="nvim -d"
alias bvi='busybox vi -c "set tabstop=4" -c "set autoindent" -c "set expandtab" -c "set ignorecase" -c "set showmatch"'

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

# less
alias less="less -i --mouse -R --use-color -Ddy -Dub -DEr -DNk -DPc"
