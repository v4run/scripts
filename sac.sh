#!/bin/bash
if [ -z "$1" -o -z "$2" -o -z "$3" ]; then
    echo -e "Usage: \n\tsac <source> <pattern> <destination>"
    exit 2
else
    mkdir -p $3
    find $1 -iname $2 -exec cp --parents {} $3 \;
fi