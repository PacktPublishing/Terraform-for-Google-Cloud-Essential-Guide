#!/bin/sh 
grep  -lrnw  . -e $1 --exclude terraform.tfstate* --exclude-dir .terraform \
| xargs -i@ sed -i s/$1/\<PROJECT_ID\>/g @