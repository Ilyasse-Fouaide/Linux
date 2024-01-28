#!/bin/bash

# basic function
git_status="$(git status -s)"

check_git_status () {
    if [ -n "$git_status" ]; then
        echo "*"
    else
        echo "up to date";
    fi
}

check_git_status

echo "--------------------------"

# passing argument
fn () {
    echo "hello $1, you have $2 years old";
}

fn "ilyasse" 20;

echo "--------------------------"

# returning value
fn2 () {
    echo "hello $1"
    return 5
}

fn2 "ilyasse"
echo The previous function has a return value of $?
