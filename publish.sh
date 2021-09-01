#!/usr/bin/env bash

[ -z "$1" ] \
  && echo "Add ssh name..." && exit 1

if ! which redoc-cli > /dev/null; then
  echo "You need redoc-cli to build the API docs. Skipping API..."
  else
    redoc-cli bundle \
    --options.disableGoogleFont=true\
    content/api/openapi.yaml -o content/api/index.html
fi
  

if ! which rsync > /dev/null; then
	echo "You need rysnc to run this script"
        exit 2
fi

USER=$1

# build the static site into ./public folder
hugo --cleanDestinationDir \
|| { echo "The build failed. Exiting..." ; exit 3; } 

# touch all the files just because
#find public -exec touch {} ';'

# copy the files to the server
rsync -rv --update public/ "$USER"@trueblocks.io:/home/"$USER"/Websites/trueblocks.io/

