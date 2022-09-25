#!/bin/bash 
grep  -lrnw  . -e "<PROJECT_ID>" --exclude terraform.tfstate* --exclude-dir .terraform \
| xargs -i@ sed -i s/\<PROJECT_ID\>/$1/g @