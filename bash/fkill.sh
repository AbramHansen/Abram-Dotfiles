#!/bin/bash
fkill () {
    ps -e -o pid,comm --no-headers | fzf -1 -q "$1" | awk '{print $1}' | xargs -r kill -9
}
