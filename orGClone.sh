#!/bin/bash

echo "********** all repos in "$1":"

repos=$(gh repo list $1 | grep $1 | cut -f 1 | cut -d "/" -f 2)
idx=1
while IFS= read -r line; do
    echo "-->"$idx:$line
    ((idx = idx + 1))
    git clone https://github.com/$1/$line.git
done <<<"$repos"
