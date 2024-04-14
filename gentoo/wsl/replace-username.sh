#!/bin/bash
mkdir output -p

setopt globdots
for file in *; do 
    if [ -f "$file" ] && [ "$file" != "$0" ]; then
       sed 's/<username>/<put_username_here>/g' "$file" > "output/$file"; 
    fi
done
