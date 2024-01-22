#!/bin/bash

branch=2;
isInMAin=0;

# if the branch is equal 1
if [ $branch -eq 1 ]; then
  # print message
  echo "you are in the right place";
# if branch not equal to
else
  # it will print this message
  echo "you arn't in the right place";
fi

#- seperate file
echo "---------------------------------";

# or you can use it like this:
# if [ ! $isInMAin -eq 1 ]; then
if [ $isInMAin -ne 1 ]; then
  echo "you are not in the main branch";
fi

#- seperate file
echo "---------------------------------";

# check if the config file exists
if [ -f ~/Documents/Linux/.git/config ]; then
  # if exists print this
  echo "you git repository exists";
else
  # if doesn't print this message
  echo "your git repository doesn't exists";
fi

### more checks:
# -eq: equal
# -ne: not equal
# -gt: greater then
# -lt: less then
