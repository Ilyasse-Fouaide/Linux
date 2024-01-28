#!/bin/bash

git_status="$(git status -s)"

check_git_status() {
    if [ -n "$git_status" ]; then
        echo "*"
    else
        echo "up to date";
    fi
}

check_git_status
