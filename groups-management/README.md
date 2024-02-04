# Managing Groups

```bash
groups
> ilyasse adm cdrom sudo dip www-data plugdev lpadmin lxd sambashare
groups <user>
<user> : <groups...>
```

create group

```bash
sudo groupadd developer
# check the groups file
cat /etc/group | grep developer
> developer:x:1002:
```

assign user to developer group

```bash
sudo usermod -aG developer ilyasse
```
> [!NOTE]  
> To avoid reboot the system after adding group to yourself
> ```bash
> newgrp developer
> ```

remove user from a group

```bash
# syntax
sudo gpasswd -d <user> <group>
# e.g, remove ilyasse user from developer group
sudo gpasswd -d ilyasse developer
```

* **-d**, **--delete** <u>user</u>   
    * Remove the <u>user</u> from the named group.

delete group

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
