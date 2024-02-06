# Filesystem Hierarchy Standard (FHS)

```
/
├── bin -> usr/bin
├── boot
├── cdrom
├── dev
├── etc
├── home
├── lib -> usr/lib
├── lib32 -> usr/lib32
├── lib64 -> usr/lib64
├── libx32 -> usr/libx32
├── lost+found
├── media
├── mnt
├── opt
├── proc
├── root
├── run
├── sbin -> usr/sbin
├── snap
├── srv
├── swapfile
├── sys
├── tmp
├── usr
└── var
```

## /bin : Essential user command binaries (for use by allusers)

The `/bin` contains commands that may be used by both the system administrator and by users

> There must be no subdirectories in /bin.

## /boot : Static files of the boot loader

This `/boot` directory contains everything required for the boot process, such as the Linux kernel

> This `/boot` stores data that is used before the kernel begins executing user-mode programs.

> [!CAUTION]  
> Do not remove /boot directory, by doing that your system is unable to boot again
