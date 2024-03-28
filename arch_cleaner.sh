#!/bin/bash

# Clean package cache
sudo yay -Scc
# Remove unused packages (orphans)
sudo yay -Rns $(yay -Qtdq)

# Clean the cache in your /home directory
rm -rf ~/.cache/*

# Remove old config files
rm -rf ~/.local/share/*

# Remove duplicates, empty files, empty directories and broken symlinks
rmlint /home/$(whoami) 
./rmlint.sh

# Remove old logs
sudo journalctl --vacuum-size=50M