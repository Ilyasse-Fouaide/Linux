#!/bin/bash

a=5;
b=$((a + 5))

echo $b # b = 10

((b++))

echo $b  # b = 11

((b--))

echo $b  # b = 10

((b+=5))

echo $b  # b = 15

c=$((b*=2))
echo $c
echo $((c/=5))
echo $((c%=5))
