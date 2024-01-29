#!/usr/bin/env bash

echo "1-Arch"
echo "2-CentOs"
echo "3-Debian"
echo "4-Red-hat"
echo "5-Kali"
echo "6-Something else ..."

read -p "choose your distro: " distro

case $distro in
    1)
        echo "Arch is rolling release."
    ;;

    2)
        echo "CentOs is a popular server"
    ;;

    3)
        echo "Debian is a community distrobution"
    ;;

    4)
        echo "Read Hat is popular server"
    ;;

    5)
        echo "Kali is a ... "
    ;;

    6)
        echo "Something else ..."
    ;;

    *)
        echo "Please choose number from 1 to 6"
    ;;
esac
