#!/usr/bin/env bash

USER=$1

# build the static site into ./public folder
hugo

# touch all the files just because
find public -exec touch {} ';'

# copy the files to the server
scp -pr public/* $USER@trueblocks.io:/home/$USER/Websites/trueblocks.io/

