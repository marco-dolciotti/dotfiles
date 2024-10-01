if status is-interactive

    # Commands to run in interactive sessions can go here
	set fish_cursor_insert 'line'

	# binds alt-left and alt-right to navigate the directory history
	bind \e\[1\;3D prevd
	bind \e\[1\;3C nextd
	
end
# Set environment variables


# Set default editor
set -x EDITOR nvim

# delete fish greeting
set fish_greeting

# my notes folder
set -x MYNOTES "$HOME/obsidian_linux_vault/linux"

# Aliases
alias ls 'ls --color -G'
alias ll 'ls --color -lah'
alias la 'ls --color -a'
alias vi 'nvim'
alias vim 'nvim'
alias .. 'cd ..'
alias ... 'cd ../..'
alias l. 'ls --color -a | grep ^\..+'
alias please 'sudo $(history | head -1)'
alias update 'sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove' 
alias du "du -h --max-depth=1"
alias fd 'fdfind'
alias fcd 'cd "$(find . -type d | fzf)"'
alias fvim 'vim "$(fzf)"'
alias mynotes 'vim "$(find $MYNOTES | fzf)"'

# Functions
function mkcd
    mkdir -p $argv
    cd $argv
end

# Enable syntax highlighting
set -g fish_syntax_highlighting

# History settings
set -x HISTFILE ~/.config/fish/fish_history
set -x HISTSIZE 1000
set -x SAVEHIST 1000

#set PATH for nvim
export PATH="$PATH:/opt/nvim-linux64/bin"

#set PATH for intellij idea
export PATH="$PATH:/home/marco/ideaIU-2024.1.4/idea-IU-241.18034.62/bin"

#set PATH for doom emacs
export PATH="$PATH:/home/marco/.config/emacs/bin"

# Set PATH for custom scripts
set -x PATH $HOME/.local/bin $PATH

starship init fish | source

#function lfcd to use lf to move directories
function lfcd --wraps="lf" --description="lf - Terminal file manager (changing directory on exit)"
    # `command` is needed in case `lfcd` is aliased to `lf`.
    # Quotes will cause `cd` to not change directory if `lf` prints nothing to stdout due to an error.
    cd "$(command lf -print-last-dir $argv)"
end	
