# dirutils
CLI tools for command execution and directory/file manipulation.

# Commands
    inall - Execute a command in all subdirectories of the current working directory
    at - Execute a command from within a specified directory
    follow - Execute a command at intervals (default 1 second)
    unsplit - Add files together end to end
    sush - Execute a multi-line command with sudo privileges

# Usage:
    inall [-hvr] [-d <depth>] <command>
    (-r executes recursively; -d executes to a max depth)
    
    at [-hv] <directory> <command>

    follow [-hvd] [-t <seconds>] <command>

    unsplit [-hvz] <outfile> <infile1> <infile2> [<infile3>] ...

    sush [-hv] '<commands>'

# Installing
See the latest instructions on the [releases page](https://github.com/dogoncouch/dirutils/releases)

# Examples
    inall du -sh
    inall git status | more
    at ~/.config git init
    follow date
    follow -d -t 5 ls -l
    unsplit myfullmodule.py xaa.py xab.py xac.py
    unsplit -z /root/fullauth.log auth.log.2.gz auth.log.1 auth.log
    sush 'apt update;apt upgrade'
    sush 'whoami;uid'

# Tips
To get the most out of these utilities, it is best to change your bash aliases to functions. Functions are more suited to most applications than aliases, according to `` bash `` documentation.

Replace this line in your `` ~/.bashrc `` :
    
    alias ls='ls --color=auto'

With this:
    
    ls() {
        ls --color=auto "${@}"
    }
    export -f ls

Functions are the new aliases, according to bash's documentation. The `` export -f `` is what makes the function work with subscripts like inall and at.

Note: `` ls `` is used in some configuration scripts and Makefiles. Exporting `` ls `` functions is not recommended for root, as it might cause some install scripts to fail.
