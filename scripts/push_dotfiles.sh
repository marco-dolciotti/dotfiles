#!/usr/bin/env bash
cd $HOME/dotfiles
git add -A
git commit -m "dotfiles updated ""$(date)"
git push
