# Managing Groups

Important group management commands for this lesson:

* **_groups_**: print the groups a user is in.
* **_groupadd_**: create a new group.
* **_groupdel_**: delete a group.
* **_groupmod_**: modify a group definition on the system.
* **_gpasswd_**: administer _/etc/group_ and _/etc/gshadow_ files.
 -  which store group information. It allows you to add or remove users from a group and set the password for a group

## Print all the groups a user is in

```bash
groups
> ilyasse adm cdrom sudo dip www-data plugdev lpadmin lxd sambashare
groups <user>
<user> : <groups...>
```

## Create and modify groups

To add a group in Linux, use the `groupadd` command:

```bash
sudo groupadd developer
# check the groups file
cat /etc/group | grep developer
> developer:x:1002:
```

When a group is created, a unique group ID gets assigned to that group. You can verify that the group appears (and see its group ID) by looking in the /etc/group file.

If you want to create a group with a specific group ID (GID), use the `--gid` or `-g` option:

```bash
sudo groupadd -g 1002 developer
```

## Change the group ID

You can change the group ID of any group with the `groupmod` command and the **--gid** or **-g** option:

```bash
# syntax:
groupmod [OPTION] GROUP
# usage:
sudo groupmod -g 1003 developer
sudo groupmod --gid 1003 developer
```

## Rename a group

You can rename a group using `groupmod` with the **--new-name** or **-n** option:

```bash
sudo groupmod -n tester developer
sudo groupmod --new-name tester developer
```

Verify all these changes from the **_/etc/group_** file.

## Add and remove users from a group

Suppose you have existing users named _ilyasse_ and _trafy_, and you want to add them to the developer group. Use the `usermod` command with the **--append** **--groups** options (-a and -G for short):

```bash
sudo usermod -aG developer ilyasse
sudo usermod --append --groups developer trafy
# --- OR ---
sudo gpasswd -a ilyasse developer
```
> [!NOTE]  
> To avoid reboot the system after adding group to yourself
> ```bash
> newgrp developer
> ```

To remove a specific user from a group, you can use the `gpasswd` command to modify group information

```bash
# syntax
sudo gpasswd -d <user> <group>
# e.g, remove ilyasse user from developer group
sudo gpasswd -d ilyasse developer
sudo gpasswd --delete ilyasse developer
> Removing user ilyasse from group developer
```

* **-d**, **--delete** <u>user</u>   
    * Remove the <u>user</u> from the named group.

## Delete a group

```bash
sudo groupdel developer
```

get groups file

```bash
cat /etc/passwd | grep ilyasse
> ilyasse:x:1000:1000:ILYASSE,,,:/home/ilyasse:/bin/bash
>   |_ user        |
>                  |_ Primary group ID
```
