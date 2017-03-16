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
    inall grep -i copyright *.py
    at ~/.config git init
