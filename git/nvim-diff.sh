#!/bin/bash
nvim -d "$1" "$2" \
    -c "wincmd h | file REMOTE: $1" \
    -c "wincmd l | file LOCAL: $2"
