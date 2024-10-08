# Marco Dolciotti's dotfiles

these are my linux dotfiles, alongside the scripts used to automatically\
manage them, i keep them here to have version control,\
feel free to snoop around and copy stuff if you feel like it

the repo uses GNU Stow to create symlinks to all the appropriate locations,\
and the file structure mirrors that of my home directory

# How to install

## :warning: *I AM NOT AN EXPERT BASH SCRIPTER, SO BACK UP YOUR DOTFILES BEFORE USING MY SCRIPTS*

1. fork this repo to make it your own
2. remove from this repo the files you do not want overwritten in your machine
3. run the script
    ```bash
    ~/dotfiles/scripts/install_dotfiles.sh
    ```
    ## :warning: *THIS WILL OVERWRITE YOUR CURRENT DOTFILES IF YOU ALREADY HAVE THEM*
4. if you want to install my essential tools, run the script
    ```bash
    ~/dotfiles/scripts/install_tools.sh
    ```
    

# How to use

- add a file to the repo
    ```bash
    ~/dotfiles/scripts/add_dotfile.sh your_file
    ```
- save your dotfiles on remote (do this regularly, maybe with cron)
    ```bash
    ~/dotfiles/scripts/push_dotfiles.sh your_file
    ```
- load your dotfiles from remote
    ```bash
    ~/dotfiles/scripts/pull_dotfiles.sh your_file
    ```

If anyone is reading this, i hope this was useful to you :)

