#!/bin/bash

# Create directory if not exists
mkdir -p ~/.gitman

# Copy all necessary files to ~/.gitman
cp -r ./gitman/* ~/.gitman

# Make the script executable
chmod +x ~/.gitman/gitman.sh

# Add the path to the shell configuration file
if [[ "$SHELL" == *"bash"* ]]; then
    echo 'export PATH=$PATH:$HOME/.gitman' >> ~/.bashrc
    source ~/.bashrc
elif [[ "$SHELL" == *"zsh"* ]]; then
    echo 'export PATH=$PATH:$HOME/.gitman' >> ~/.zshrc
    source ~/.zshrc
fi
