#!/bin/bash

# Create directory if not exists
sudo mkdir -p /usr/local/bin/gitman

# Copy all necessary files to /usr/local/bin/gitman
sudo cp -r ./gitman/* /usr/local/bin/gitman

# Make the script executable
sudo chmod +x /usr/local/bin/gitman/gitman.sh

# Create a symlink to the gitman.sh in /usr/local/bin for easy access
sudo ln -s /usr/local/bin/gitman/gitman.sh /usr/local/bin/gitman
