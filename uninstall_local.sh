#!/bin/bash

# Remove the gitman directory from home
rm -r ~/.gitman

# Remove the path from the shell configuration file
if [[ "$SHELL" == *"bash"* ]]; then
    sed -i '/export PATH=$PATH:$HOME\/.gitman/d' ~/.bashrc
    source ~/.bashrc
elif [[ "$SHELL" == *"zsh"* ]]; then
    sed -i '/export PATH=$PATH:$HOME\/.gitman/d' ~/.zshrc
    source ~/.zshrc
fi
