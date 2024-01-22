#!/bin/bash

branch=2;
isInMAin=0;

if [ $branch -eq 1 ]; then
  echo "you are in the right place";
else
  echo "you arn't in the right place";
fi

echo "---------------------------------"

# or you can use it like this:
# if [ ! $isInMAin -eq 1 ]; then
if [ $isInMAin -ne 1 ]; then
  echo "you are not in the main branch";
fi
