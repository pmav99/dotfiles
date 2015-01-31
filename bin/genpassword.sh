#!/bin/sh

if which apg &> /dev/null; then
    apg -m 8 -x 12 -s -a 1
else
    echo '<apg> is not installed. Please install it.'
fi
