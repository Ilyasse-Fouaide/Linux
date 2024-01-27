#!/bin/bash

if grep -qsi "ubuntu" /etc/os-release; then
    echo "You have Ubuntu.";
fi

# grep -q stand fot Quiet;  do  not  write  anything  to  standard  output.
# Exit  immediately  with  zero  status if any match is found, even if an error
# was detected
# ------------------------------------------------------------------------------
# grep -s stand for Silent; or grep --no-messages
# Suppress error messages about nonexistent or unreadable files.
