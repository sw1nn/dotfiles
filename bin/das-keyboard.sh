#!/bin/sh

if [ -z "$DISPLAY" ]; then
    export DISPLAY=:0
fi

xmodmap ~/.Xmodmap
