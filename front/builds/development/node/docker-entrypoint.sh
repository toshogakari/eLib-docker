#!/bin/sh
set -ex

if [ "$1" = "sh" -o "$1" = "bash" ]; then
    exec "bash"
fi

if [ "$1" = "npm" -o "$2" = "start" ]; then
    cd /app
    exec "$@"
fi
