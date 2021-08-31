#!/usr/bin/env bash

[ -z "$1" ] && echo "Add ssh name..." && exit 1

USER=$1

# build the static site into ./public folder
hugo || echo "The build failed. Exiting..." && exit 2 

# touch all the files just because
find public -exec touch {} ';'

# copy the files to the server
rsync -rv --update public/ "$USER"@trueblocks.io:/home/"$USER"/Websites/trueblocks.io/

