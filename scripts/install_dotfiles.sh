#!/usr/bin/env bash
sudo apt install stow
cd $HOME/dotfiles
git add -A
git commit -m "to revert after installation overwrites dotfiles"
stow --adopt .
git reset --hard HEAD
