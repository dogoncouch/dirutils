#!/bin/bash -i

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
    echo "Usage: ${0##*/} [-hvr] [-d <depth>] <command>"
    echo
    echo "Optional arguments:"
    echo "  -h                      Print this help message"
    echo "  -v                      Print the version number"
    echo "  -r                      Execute recursively"
    echo "  -d <depth>              Execute to maximum depth <depth>"
}

# Set the command line options
MAXDEPTH=1
while getopts ":rhvd:" o; do
    case "${o}" in
        r)
            RECURSIVE=1
            ;;
        d)
            RECURSIVE=1
            GOTHERE=1
            MAXDEPTH=${OPTARG}
            ;;
        h)
            usage
            exit 0
            ;;
        v)
            echo "${0##*/}-$VERSION"
            exit 0
            ;;
        *)
            usage
            exit 1
            ;;
    esac
done
shift $((OPTIND-1))

# Set the command to use from arguments
OURCMD="${@}"

# Check for color terminal:
if [ "$(tput colors)" -ge 256 ]; then
    DCOLORS=1
fi

# Check for recursive operation:
if [ ${RECURSIVE} ]; then
    if [ ${GOTHERE} ]; then
        # If a max depth has been specified:
        for dir in `find . -mindepth 1 -maxdepth "${MAXDEPTH}" -type d`; do
            if [ ${DCOLORS} ]; then
                (cd "${dir}" ; echo ; echo -e "==== \e[94m\e[1m${dir}\e[0m:" ; ${OURCMD})
            else
                (cd "${dir}" ; echo ; echo -e "==== ${dir}:" ; ${OURCMD})
            fi
        done
    else
        # Recursive with no max depth:
        for dir in `find . -mindepth 1 -type d`; do
            if [ ${DCOLORS} ]; then
                (cd "${dir}" ; echo ; echo -e "==== \e[94m\e[1m${dir}\e[0m:" ; ${OURCMD})
            else
                (cd "${dir}" ; echo ; echo -e "==== ${dir}:" ; ${OURCMD})
            fi
        done
    fi
else
    # Not recursive: max depth of 1:
    for dir in `find . -mindepth 1 -maxdepth 1 -type d`; do
            if [ ${DCOLORS} ]; then
                (cd "${dir}" ; echo ; echo -e "==== \e[94m\e[1m${dir}\e[0m:" ; ${OURCMD})
            else
                (cd "${dir}" ; echo ; echo -e "==== ${dir}:" ; ${OURCMD})
            fi
    done
fi
