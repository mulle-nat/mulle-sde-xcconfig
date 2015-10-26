#! /bin/sh

START="${1:-.}"

find "${START}" -name "mulle-configuration" -mindepth 1 -type d -print  | while read -r line
do
   echo "$line" >&2
   (cd "$line" ; git pull origin master )
done


