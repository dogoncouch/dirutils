#!/bin/bash

#_MIT License
#_
#_Copyright (c) 2017 Dan Persons <dpersonsdev@gmail.com>
#_
#_Permission is hereby granted, free of charge, to any person obtaining a copy
#_of this software and associated documentation files (the "Software"), to deal
#_in the Software without restriction, including without limitation the rights
#_to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#_copies of the Software, and to permit persons to whom the Software is
#_furnished to do so, subject to the following conditions:
#_
#_The above copyright notice and this permission notice shall be included in all
#_copies or substantial portions of the Software.
#_
#_THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#_IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#_FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#_AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#_LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#_OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#_SOFTWARE.
#_

# dirutils v1.1

# To Do: add remote host support with scp (grep for ':' to check)

usage() {
    echo "Usage: ${0##*/} [-h] <directory> <command>"
    echo
    echo "Optional arguments:"
    echo "  -h                      Print this help message"
}

while getopts ":h" o; do
    case "${o}" in
        h)
            usage
            exit 0
            ;;
        *)
            usage
            exit 0
            ;;
    esac
done

if [ -d "${1}" ]; then
    (cd "${1}" ; shift ; "${@}");
fi
