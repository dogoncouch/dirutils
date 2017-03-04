#!/bin/bash

#_MIT License
#_
#_Copyright (c) 2017 Dan Persons
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

GOTHERE=0
RECURSIVE=0
MAXDEPTH=1

while getopts ":d:r" o; do
    case "${o}" in
        r)
            RECURSIVE=1
            ;;
        d)
            GOTHERE=1
            MAXDEPTH= ${OPTARG}
            ;;
    esac
done
# shift $(expr $OPTIND - 1)
# shift $((OPTIND-1))

if [ ${RECURSIVE} ]; then
    if [ ${GOTHERE} ]; then
        OURDIRS=eval find . -mindepth 1 -maxdepth ${MAXDEPTH} -type d
        # for f in [ eval find . -mindepth 1 -maxdepth ${MAXDEPTH} -type d ]; do
        #     ( cd ${f} && $1 )
        # done
    else
        OURDIRS=eval find . -mindepth 1 -type d
        # for f in [ eval find . -mindepth 1 -type d ]; do
        #     ( cd ${f} && $1 )
        # done
    fi
else
    OURDIRS=eval find . -mindepth 1 -maxdepth 1 -type d
    #     ( cd ${f} && $1 )
    # done

    # find . -mindepth 1 -maxdepth ${MAXDEPTH} -type d -exec bash -c $1
fi

for d in ${OURDIRS}; do
    cd ${d} && $1
done
