#!/bin/sh

# Usage message
if [ $# -eq 0 ]
then
  echo "Usage: $0 <directory data>";
exit 1;
fi

DIR=$1;

gnuplot -e "dir='$DIR'" energias.gnuplot
