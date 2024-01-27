#!/usr/bin/bash

n=1;

while [ $n -le 10 ]; do
    echo $n;
    n=$(( n + 1 ));
    sleep 0.5;
done
