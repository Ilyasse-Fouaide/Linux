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

#- seperate file
echo "---------------------------------";

command=htop;
commandPath=/usr/bin/$command;

# check if htop command exists
if [ ! -f $commandPath ]; then
  echo -e "command $command does not exists.\nintall it ? sudo apt install $command";
else
  echo -e "the \033[32m$command\033[00m command found..."
fi

#- seperate file
echo "---------------------------------";

str="";

# check the length of the string is non zero
if [ -n "$str" ]; then
  echo "the string is not empty.";
else
  echo "the string is empty."
fi

#- seperate file
echo "---------------------------------";

str1="ilyasse";
str2="ilyasse";

# or you can use it like this '!=', not equal
if [ "$str1" == "$str2" ]; then
  echo "$str1 are equal to $str2";
else
  echo "$str1 are not equal to $str2";
fi

### more checks: ###
# [ -eq ]:    equal
# [ -ne ]:    not equal
# [ -gt ]:    greater then
# [ -lt ]:    less then
# [ -f ]:     file existing
# [ -n ]:     check if the lenght of the string is non zero
# [ -z ]:     check if the lenght of the string is zero
