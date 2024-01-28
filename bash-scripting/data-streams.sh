#!/bin/bash

if [ ! -d ~/Documents/Linux/log/data-stream ]; then
    echo -e "--- creating log dir for you ... ---"
    mkdir ~/Documents/Linux/log/data-stream
fi

access_log=~/Documents/Linux/log/data-stream/access.log
errors_log=~/Documents/Linux/log/data-stream/errors.log

git=/usr/bin/git

if [ -f $git ]; then
    git branch 2>> $errors_log 1>> $access_log
fi
