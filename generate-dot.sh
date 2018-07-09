#! /bin/sh
# ###########################################################################
# (c) 2010 Mulle kybernetiK
# GPL License
# coded by Nat!
# ###########################################################################

open=${1:-yes}
shift
style=${1:-html}
shift
command=${1:-all}
shift
output=${1:-xcconfig}
shift


STYLEFILES="Debug.xcconfig Release.xcconfig"
TARGETFILES=`ls -1 *[A-Za-z0-9_]IOS.xcconfig *[A-Za-z0-9_]OSX.xcconfig 2> /dev/null`


includes_of_files()
{
   egrep '^#include' "$*" | sed 's/#include \"\(.*.xcconfig\)\"/\1/'
}


recursive_includes_of_files()
{
   local stack

   stack="$1"
   shift

   for i in $*
   do
      stack="$stack $i"
      includes=`includes_of_files $i`
      stack=`recursive_includes_of_files "$stack" $includes`
   done
command=${1:-all}
shift
   echo "$stack"
}


create_node_label()
{
   local name
   local orientation
   local file

   name=$1
   shift
   style="$1"
   shift
   file=${1:-$name.xcconfig}
   shift

   if [ "$style" = "html" ]
   then
      echo "<<TABLE>"
      echo "<TR><TD COLSPAN=\"2\" BGCOLOR=\"blue\"><FONT COLOR=\"white\">$name</FONT></TD></TR>"

      definitions=`egrep -v '//|#include' "$file" | sed 's/^[ \t]*//;s/[ \t]*$//' | sed '/^$/d' | sed 's/^\([^ =]*\) *= *\(.*\)$/\1=\2/' | tr ' ' '\`' `

      for i in $definitions
      do
         key=`echo $i | tr '\`' ' ' | sed 's/^\([^ =]*\) *= *\(.*\)$/\1/'`
         val=`echo $i | tr '\`' ' ' | sed 's/^\([^ =]*\) *= *\(.*\)$/\2/'`
         echo "<TR><TD>$key</TD><TD>$val</TD></TR>"
      done
      echo "</TABLE>>"
   else
      echo "\"$name\""
   fi
}


make_key()
{
   echo "$1" | tr '.+-*/$#,;:!&{}[]()' '__________________'
}


create_dot_file()
{
   local name
   local orientation
   local style

   name="$1"
   shift
   orientation="$1"
   shift
   style="$1"
   shift

   echo "digraph $name
{"
   if [ "$orientation" = "LR" ]
   then
      echo "   rankdir=LR;"
   fi

   if [ "$style" = "html" ]
   then
      echo "   node [shape=none];"
   else
      if [ "$style" != "" ]
      then
         echo "   node [shape=$style];"
      fi
   fi
   echo ""

   for i in $*
   do
      name=`basename $i .xcconfig`
      includes=`egrep '^#include' "$i" | sed 's/#include \"\(.*\).xcconfig\"/\1/'`
      echo "   `make_key $name` [label=`create_node_label $name $style`];"
      for x in $includes
      do
         dst=`basename $x .xcconfig`
         echo "   `make_key $name` -> `make_key $dst` [ label=\"#include\" ];"
      done
   done
   echo "}"
}


create_dot_files_recursive()
{
   local name
   local orientation
   local style

   name="$1"
   shift
   orientation="$1"
   shift
   style="$1"
   shift

   create_dot_file "$name" "$orientation" "$style" `recursive_includes_of_files "" $*`
}


if [ "$command" = "all" ]
then
   create_dot_files_recursive "styles" "LR" "$style"  $STYLEFILES > styles.dot

   targets=""
   for i in $TARGETFILES
   do
      name=`basename $i .xcconfig`
      file="$name.dot"
      echo "Generating dotfile \"$file\" for $i"
      create_dot_files_recursive "target_$name" "LR" "$style" $i > $file
      targets="$targets $file"
   done
   if [ "$open" = "yes" ]
   then
   	  open styles.dot $targets
   fi
else
   if [ $# -gt 0 ]
   then
      create_dot_files_recursive "custom" "LR" "$style" $* > xcconfig.dot
   fi
fi


