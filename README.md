# dirutils
CLI tools for executing commands in remote directories and subdirectories.

# Commands
    inall - Execute a command in all subdirectories of the current working directory
    at - Execute a command from within a specified directory

# Usage:
    inall i [-r] -[d &lt;depth&gt;] &lt;command&gt;
(-r executes recursively, -d specifies max depth)
    
    at &lt;directory&gt; &lt;command&gt;

# Installing
    git clone https://github.com/dogoncouch/dirutils.git
    cd dirutils
    sudo ./setup.sh

# Examples
    inall grep -i copyright *.py
    at ~/.config git init
