# dirutils
CLI tools for executing commands in subdirectories and specified directories.

# Commands
    inall - Execute a command in all subdirectories of the current working directory
    at - Execute a command from within a specified directory

# Usage:
    inall [-r] [-d <depth>] <command>
    (-r executes recursively; -d specifies a max depth)
    
    at <directory> <command>

# Installing
    git clone https://github.com/dogoncouch/dirutils.git
    cd dirutils
    sudo ./setup.sh

# Examples
    inall du -sh
    inall git status | more
    at ~/.config git init

# Tips
To get the most out of these utilities, it is best to change your bash aliases to functions. Aliases are deprecated.

Replace this line in your `` ~/.bashrc `` :
    
    alias ls='ls --color=auto'

With this:
    
    ls() {
        ls --color=auto "${@}"
    }
    export -f ls

Functions are the new aliases, according to bash's documentation. The `` export -f `` is what makes the function work with subscripts like inall and at.
