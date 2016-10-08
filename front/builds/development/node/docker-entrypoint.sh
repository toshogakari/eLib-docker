#!/bin/sh
set -ex

if [ "$1" = "sh" -o "$1" = "bash" ]; then
    exec "bash"
fi

if [ "$1" = "node" -o "$2" = "node" ]; then
    cd /usr/src/app
    exec "$@"
fi
