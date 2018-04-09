#!/bin/bash

# MIT License
# 
# Copyright (c) 2017 Dan Persons (dpersonsdev@gmail.com)
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

VERSION="1.3"

usage() {
    echo "Usage: ${0##*/} [-hvz] <outfile> <infile1> <infile2> [<infile3>] ..."
    echo
    echo "Optional arguments:"
    echo "  -h                      Print this help message"
    echo "  -v                      Print the version number"
    echo "  -z                      Unzip .gz files before adding"
}



# Set options:
while getopts ":hvz" o; do
    case "${o}" in
        h)
            usage
            exit 0
            ;;
        v)
            echo "${0##*/}-$VERSION"
            exit 0
            ;;
        z)
            UNZIP=1
            ;;
        *)
            usage
            exit 1
            ;;
    esac
done
shift $((OPTIND-1))

# Set output file:
OUTFILE="${1}"
shift

# Set input files:
INFILES="${@}"



# Make sure output file doesn't already exist:
if [ -f "$OUTFILE" ]; then
    echo "Output file already exists! Please delete it first."
    exit 1
fi


# Put our files together:
for infile in $INFILES; do
    if $UNZIP; then
        if [ ${infile: -3} == ".gz" ]; then
            gunzip -c $infile >> "$OUTFILE"
        else
            cat $infile >> "$OUTFILE"
        fi
    else
        cat $infile >> "$OUTFILE"
    fi
done
