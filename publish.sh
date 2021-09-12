#!/usr/bin/env bash

# if user provides a user id, push ./public to the website
[ -z "$1" ] && echo "Add ssh name to publish the site..." && exit 1

name=$1

if ! which rsync > /dev/null; then
	echo "You need rysnc to run this script"
        exit 2
fi

# build the static site into ./public folder
hugo --cleanDestinationDir \
|| { echo "The build failed. Exiting..." ; exit 3; } 

if ! which redoc-cli > /dev/null; then
  echo "You need redoc-cli to build the API docs. Skipping API..."
else
  echo "building API site..."
  redoc-cli bundle \
  --options.disableGoogleFont=true \
  content/api/openapi.yaml -o public/api/index.html
fi

# copy the files to the server if the user presents a user id
echo "Copying to trueblocks webserver..."
rsync --quiet -rv \
--update public/ "$name"@trueblocks.io:/home/"$name"/Websites/trueblocks.io/

echo "Done."
