#!/bin/bash

if [ ! -d ./log ]; then
  mkdir log;
fi

ls ./ >> log/success.log;

echo "status: $?";
