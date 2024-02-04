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
> > newgrp developer

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
