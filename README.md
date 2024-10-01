# Marco Dolciotti's dotfiles

this are my linux dotfiles, i keep them here to have version control,\
feel free to snoop around and copy stuff if you feel like it

the repo uses GNU Stow to create symlinks to all the appropriate locations,\
and the file structure mirrors that of my home directory

# How to install

## :warning: *I AM NOT A MASTER BASH SCRIPTER, SO BACK UP YOUR DOTFILES BEFORE USING MY SCRIPTS*

1. fork this repo to make it your own
2. remove from this repo the files you do not want overwritten in your machine
3. run the script
    ```bash
    ~/dotfiles/scripts/install_dotfiles.sh
    ```
    ## :warning: *THIS WILL OVERWRITE YOUR CURRENT DOTFILES IF YOU ALREADY HAVE THEM*

# How to use

- add a file to the repo
    ```bash
    ~/dotfiles/scripts/add_dotfile.sh your_file
    ```
- save your dotfiles on remote
    ```bash
    ~/dotfiles/scripts/push_dotfiles.sh your_file
    ```
- load your dotfiles on remote
    ```bash
    ~/dotfiles/scripts/pull_dotfiles.sh your_file
    ```

If anyone is reading this, i hope this was useful to you :)

