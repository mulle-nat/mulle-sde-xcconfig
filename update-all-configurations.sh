#! /bin/sh


find . -name "mulle-configuration" -type d -print  | while read -r line
do
   echo "$line" >&2
   (cd "$line" ; git pull origin )
done


