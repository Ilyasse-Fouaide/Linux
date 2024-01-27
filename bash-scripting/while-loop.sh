#!/bin/bash

n=1;

while [ $n -le 10 ]; do
    echo "$n at $(date +"%Hh:%Mm:%Ss")";
    n=$(( n + 1 ));
    sleep 5;
done
