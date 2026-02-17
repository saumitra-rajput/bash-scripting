#!/bin/bash

# try and catch method

set -euo pipefail



mkdir test1 || { echo "File already exists"; }

echo "IMP work"
