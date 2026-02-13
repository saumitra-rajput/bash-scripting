#!/bin/bash

#This scritp will do the back of scripts folder in /home/ubuntu/

set -e

src="/home/ubuntu/github-repo/bash-scripting/scripts/"

dest="/home/ubuntu/"

format="$(date '+%Y-%m-%d-%H-%M')"

echo "$src"
echo "$dest"
echo "$format"

zip -r "$dest/backup-$format.zip" "$src" > /dev/null
