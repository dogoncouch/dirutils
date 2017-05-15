#!/bin/bash

# MIT License
# 
# Copyright (c) 2017 Dan Persons <dpersonsdev@gmail.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

VERSION="1.2"

usage() {
    echo "Usage: ${0##*/}"
    echo
    echo "Optional arguments:"
    echo "  -h                      Print this help message"
    echo "  -v                      Print the version number"
    echo "  -u                      Single user install in ~/bin"
}

while getopts ":hvu" o; do
    case "${o}" in
        h)
            usage
            exit 0
            ;;
        v)
            echo "${0##*/}-$VERSION"
            exit 0
            ;;
        u)
            SINGLEUSER=1
            ;;
        *)
            usage
            exit 0
            ;;
    esac
done
shift $((OPTIND-1))


if [ ! ${SINGLEUSER} ]; then

    if [ -w /usr/local/bin ]; then
        echo Installing dirutils in /usr/local/bin
        cp inall.sh /usr/local/bin/inall
        cp at.sh /usr/local/bin/at
        cp follow.sh /usr/local/bin/follow
        cp unsplit.sh /usr/local/bin/unsplit
        cp sush.sh /usr/local/bin/sush
        if [ -w /usr/share/man ]; then
            echo Installing documentation
            cp doc/inall.1 /usr/share/man/man1
            cp doc/at.1 /usr/share/man/man1
            cp doc/follow.1 /usr/share/man/man1
            cp doc/unsplit.1 /usr/share/man/man1
            cp doc/sush.1 /usr/share/man/man1
            mkdir -p /usr/share/doc/dirutils
            cp -n README.md /usr/share/doc/dirutils
            cp -n LICENSE /usr/share/doc/diruils
        else
            echo Documentation not installed - no permissions in /usr/share/man
        fi
    else
        echo No write privileges in /usr/local/bin. Try single user install
    fi

else

    echo Installing dirutils in ~/bin
    mkdir -p ~/bin
    cp inall.sh ~/bin/inall
    cp at.sh ~/bin/at
    cp follow.sh ~/bin/follow
    cp unsplit.sh ~/bin/unsplit
    cp sush.sh ~/bin/sush
    if [ -w /usr/share/man ];then
        echo Installing documentation
        cp doc/inall.1 /usr/share/man/man1
        cp doc/at.1 /usr/share/man/man1
        cp doc/follow.1 /usr/share/man/man1
        cp doc/unsplit.1 /usr/share/man/man1
        cp doc/sush.1 /usr/share/man/man1
        mkdir -p /usr/share/doc/dirutils
        cp -n README.md /usr/share/doc/dirutils
        cp -n LICENSE /usr/share/doc/diruils
    else
        echo Documentation not installed - no permissions in /usr/share/man
    fi
    echo Note: Add ~/bin to PATH variable
    echo "(echo PATH=\$PATH:~/bin >> ~/.profile)"
    echo in ~/.profile.

fi
