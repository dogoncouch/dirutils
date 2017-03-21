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

# inall v1.0

# Set the command line options
MAXDEPTH=1
while getopts ":d:r" o; do
    case "${o}" in
        r)
            RECURSIVE=1
            ;;
        d)
            RECURSIVE=1
            GOTHERE=1
            MAXDEPTH=${OPTARG}
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
