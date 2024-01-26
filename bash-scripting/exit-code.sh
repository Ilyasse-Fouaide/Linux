#!/bin/bash

if [ ! -d ./log ]; then
  mkdir log;
fi

# the `>>` mean: redirect output
ls ./ >> log/success.log;

echo "status: $?";
