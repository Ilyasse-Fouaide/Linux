#!/bin/bash

osInfo=/etc/os-release;

# it will work if the osInfo file match ubuntu or debian
if grep -qsi "ubuntu" $osInfo || grep -qsi "debian" $osInfo; then
    echo "You have Ubuntu.";
fi

# grep -q stand fot Quiet;  do  not  write  anything  to  standard  output.
# Exit  immediately  with  zero  status if any match is found, even if an error
# was detected
# ------------------------------------------------------------------------------
# grep -s stand for Silent; or grep --no-messages
# Suppress error messages about nonexistent or unreadable files.
