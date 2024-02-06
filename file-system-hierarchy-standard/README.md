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

This `/boot` directory contains everything required for the boot process, such as the Linux kernel, the `/boot` stores data that is used before the kernel begins executing user-mode programs.

> [!CAUTION]  
> Do not remove /boot directory, by doing that your system is unable to boot again

## /dev : Device files

The `/dev` directory is the location of special or device files. which  represent devices that are attached to the system

## /etc : Host-specific system configuration

The `/etc` directory is reserved for configuration files that are local to the machine. No binaries are to be placed in `/etc`. 

## /lib : Essential shared libraries and kernel modules

The `/lib` directory should contain only those libraries needed to execute the binaries in `/bin` and `/sbin`. These shared library images are particularly important for booting the system and executing commands within the root file system.

## /media : Mount point for removeable media

This directory contains subdirectories which are used as mount points for removeable media such as floppydisks, cdroms and zip disks.

## /mnt : Mount point for a temporarily mounted filesystem

The `/mnt` directory is reserved for temporarily mounted file systems. For all removeable media, use the `/media` directory.

> [!NOTE]  
> This directory must not be used by installation programs.
