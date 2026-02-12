#!/bin/bash

set -e

mkdir /tmp/devops-test || { echo "Dir already exists"; exit 1; }

cd /tmp/devops-test || { echo "Failed to change directory"; exit 1; }

touch news.txt || { echo "Unable to create file"; exit 1; }

echo "everthing worked!"
 
