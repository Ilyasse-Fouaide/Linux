#!/bin/bash

# basic example
for i in 1 2 3 4; do
    echo $i
done

echo "--------------------";

myarray=("ilyasse" "sami" "ahmed")
# echo ${myarray[@]}

for i in ${myarray[@]}; do
    echo $i;
    sleep 0.5;
done

echo "--------------------";

# {1..10}: from 1 to 10
for i in {1..10}; do
    res=$(expr $i % 2);
    # if the i % 2 == 0 then print it
    if [ $res -eq 0 ]; then
        echo $i;
    fi
done

echo "--------------------";

# fetch the log directory
for file in log/*; do
    # if the content of log/ directory is not exutable
    if [ ! -x $file ]; then
        # add the execute mod for the user
        chmod u+x $file;
        # and create a tar.gz file
        tar czfv $file.tar.gz $file
    # if the content of log/ directory is exutable
    else
        # create a tar.gz file
        tar czfv $file.tar.gz $file
    fi
done
