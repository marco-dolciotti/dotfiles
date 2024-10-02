#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

# Get the absolute path of the file
file_path=$(realpath "$1")
echo $file_path
# Extract the filename from the provided path
file_name=$(basename "$file_path")
echo $file_name
# Get the directory of the file without $HOME
file_dir=$(dirname "$file_path")
file_dir=${file_dir/$HOME}
echo $file_dir

# Create the ~/dotfiles directory if it doesn't exist
mkdir -p ~/dotfiles
echo mkdir -p ~/dotfiles

# Create a directory structure inside ~/dotfiles that mirrors the original file's directory structure
mkdir -p ~/dotfiles"$file_dir"
echo mkdir -p ~/dotfiles"$file_dir"

# Move the file into this new directory structure inside ~/dotfiles
mv $file_path ~/dotfiles"$file_dir"/
echo mv $file_path ~/dotfiles"$file_dir"/

# Use GNU Stow to create a symlink in the original directory
cd ~/dotfiles
echo cd ~/dotfiles
stow -v .
echo stow -v --target="$file_dir" "${file_dir:1}"

echo "File $file_name has been moved to ~/dotfiles/$file_dir and linked back to $file_dir."
echo echo "File $file_name has been moved to ~/dotfiles/$file_dir and linked back to $file_dir."

