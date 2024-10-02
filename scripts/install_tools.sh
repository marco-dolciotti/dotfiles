#!/usr/bin/env bash

# create a temporary file
tempfile=$(mktemp)
trap "rm  $tempfile" EXIT # autocloses file

# print a comment in the file explaining how this shtick works
echo "# this is the list of useful tools i could think of,
# just delete the tools you don't need, or add new ones


" >> $tempfile

# load the list of tools in the tempfile
cat ~/dotfiles/tools_list.txt >> $tempfile

# open the editor
if [ ! -z "$EDITOR" ]
then
    "$EDITOR" "$tempfile"
elif command -v nvim
then
    nvim "$tempfile"
elif command -v vim
then
    vim "$tempfile"
elif command -v nano
then
    nano "$tempfile"
else
    echo "no editor found"
    exit 1
fi

# delete comment lines
sed -i '/^#/d' $tempfile 

# pipe the tools into package manager
if command -v apt
then
    sudo apt update
    cat $tempfile | xargs -d '\n' sudo apt install
elif command -v apt-get
then
    sudo apt-get update
    cat $tempfile | xargs -d '\n' sudo apt-get install
elif command -v pacman
then
    sudo pacman -Sy
    cat $tempfile | xargs -d '\n' sudo pacman -S install
else
    echo "no package manager found"
    exit 1
fi

echo "everything is installed"
exit 0



