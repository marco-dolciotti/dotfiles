#!/usr/bin/env bash

vault_directory='/home/marco/obsidian_linux_vault/'
date_and_time="$(date +'%Y-%m-%d %H:%M:%S')"


cd -- "$vault_directory"
git add .
git commit -m "automatic upload $date_and_time"
git push

