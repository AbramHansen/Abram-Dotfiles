# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
else
    color_prompt=
fi

source ~/.config/bash/color-aliases.sh
source ~/.config/bash/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

set_prompt() {
    local git_branch="$(__git_ps1 ' (%s)')"
    BLINKING_LINE_CURSOR="\[\e[5 q\]"
    PS1="${YELLOW}\u@\h${WHITE}:${BLUE}\w${PURPLE}${git_branch}${YELLOW}\$ ${RESET}${BLINKING_LINE_CURSOR}"
}

if [ "$color_prompt" = yes ]; then
    PROMPT_COMMAND=set_prompt
else
    PS1="\u@\h:\w\$ "
fi
unset color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;\w\a\]$PS1"
        ;;
    *)
        ;;
esac
