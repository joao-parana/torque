#!/bin/bash

set -e

FNAME=~/output.txt

cnt=0
while [ ! -f $FNAME ]
do
  let cnt=cnt+1
  echo "Waiting for output.txt to appear..."
  sleep 2
  if [ $cnt -gt 30 ] 
  then
      echo "Timeout reached, too many iterations..."
      exit 1
  fi
done
CONTENT=`cat $FNAME`
EXPECTEDCONTENT="finished"

if [ "$CONTENT" != "$EXPECTEDCONTENT" ]
then
    echo "Unexpected content of the 'output.txt' file...:"
    cat $FNAME
    exit 2
fi

echo "output.txt file found with correct content: test passed."
