#!/usr/bin/env bash

# freshen the readme files
./rdme-local.sh

if ! which redoc-cli > /dev/null; then
  echo "You need redoc-cli to build the API docs. Skipping API..."
else
  redoc-cli bundle \
    --options.disableGoogleFont=true \
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

echo

# if user provides a user id, push ./public to the website
[ -z "$1" ] && echo "Add ssh name to publish the site..." && exit 1

# copy the files to the server if the user presents a user id
echo "Copying to trueblocks webserver..."
rsync --quiet -rv --update public/ "$USER"@trueblocks.io:/home/"$USER"/Websites/trueblocks.io/

echo "Done."
