# dirutils
CLI tools for executing commands in subdirectories and specified directories.

# Commands
    inall - Execute a command in all subdirectories of the current working directory
    at - Execute a command from within a specified directory
    follow - Execute a command at intervals (default 1 second)
    unsplit - Add files together end to end

# Usage:
    inall [-h] [-r] [-d <depth>] <command>
    (-r executes recursively; -d executes to a max depth)
    
    at [-h] <directory> <command>

    follow [-h] [-d] [-t <seconds>] <command>

    unsplit [-h] [-z] <outfile> <infile1> <infile2> [<infile3>] ...

# Installing
See the latest instructions on the [releases page](https://github.com/dogoncouch/dirutils/releases)

# Examples
    inall du -sh
    inall git status | more
    at ~/.config git init
    follow date
    follow -d -t 5 ls -l
    unsplit myfullmodule.py aaa.py aab.py aac.py

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
