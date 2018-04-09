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
    echo "Usage: ${0##*/} [-hvd] [-t <seconds>] <command>"
    echo
    echo "Optional arguments:"
    echo "  -h                      Print this help message"
    echo "  -v                      Print the version number"
    echo "  -d                      Show datestamps"
    echo "  -t <seconds>            Set execution interval (default 1 second)"
}

# Set the command line options
SLEEPTIME=1

while getopts ":hvdt:" o; do
    case "${o}" in
        d)
            SHOWDATE=1
            ;;
        t)
            SLEEPTIME=${OPTARG}
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
            exit 0
            ;;
    esac
done
shift $((OPTIND-1))

COMMAND="${@}"


while true; do
    if [ ${SHOWDATE} ]; then
        echo
        date
    fi
    ${COMMAND}
    sleep ${SLEEPTIME}
done
