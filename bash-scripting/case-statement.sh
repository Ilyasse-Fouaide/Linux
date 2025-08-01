#!/usr/bin/env bash

while true; do

    echo -e "\n--- 1-Arch ---"
    echo "--- 2-CentOs ---"
    echo "--- 3-Debian ---"
    echo "--- 4-Red-hat ---"
    echo "--- 5-Kali ---"
    echo "--- 6-quit ---"
    echo -e "--- 7-Something else ---\n"

    read -p "choose your distro: " distro

    case $distro in
        1 | "a")
            echo "Arch is rolling release."
        ;;

        2 | "b")
            echo "CentOs is a popular server"
        ;;

        3 | "c")
            echo "Debian is a community distrobution"
        ;;

        4 | "d")
            echo "Read Hat is popular server"
        ;;

        5 | "d")
            echo "Kali is a ... "
        ;;

        6 | "e" | "q") break;;

        7)
            echo "Something else ..."
        ;;

        *)
            echo "Please choose number from 1 to 6"
        ;;
    esac

done

echo "Quiting ..."
