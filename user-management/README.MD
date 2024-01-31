# User management

## What are Users in Linux?

A user in Linux is associated with a user account, which consists of several properties defining their identity and privileges within the system. These properties are a username, `UID` (User ID), `GID` (Group ID), `home directory`, default `shell`, and `password`.

## Type of Users in Linux

**System users** are created by the system during installation and are used to run system services and applications.

**Regular users** are created by the administrator and can access the system and its resources based on their permissions.

## How to Create Users

Lets create a new user ilyasse with home directory /home/ilysse and set /bin/bash to be hes default shell.

```bash
sudo useradd -m -s /bin/bash ilyasse
```

* `-m`: '--create-home' Create the user's home directory if it does not exist
* `-s`: '--shell' The name of a new user's login shell

1. Creating a User with a Specific User ID

    ```bash
    sudo useradd -u 1500 -m ilyasse
    ```
2. Creating a User with a Specific User ID, home directory and the default shell

    ```bash
    sudo useradd -u 1500 -d /home/ilyasse -s /bin/bash ilyasse
    ```

3. Create a New User With Several Groups

    ```bash
    sudo useradd -m -s /bin/bash -G sudo,www-data ilyasse
    ```


To be able to log in as the newly created user, you need to set the user password. You can do that by running the `passwd` command followed by the username:

```bash
sudo passwd ilyasse
> Changing password for user ilyasse.
> New password: <password>
> Retype new password: <password>
> passwd: all authentication tokens updated successfully.
```
## How to modify a user account

`usermod` command or modify user is a command in Linux that is used to change the properties of a user in Linux through the command line. After creating a user we have to sometimes change their attributes like password or login directory etc. so in order to do that we use the `usermod` command. The information of a user is stored in the following files:

* /etc/passwd
* /etc/group
* /etc/shadow
* /etc/login.defs
* /etc/gshadow
* /etc/login.defs

When we execute usermod command in terminal the command make the changes in these files itself.

> [!NOTE]  
> usermod command needs to be executed only as a root user.

1. To add a comment for a user

    ```bash
    sudo usermod -c "This is test user" ilyasse
    ```

2. To change the home directory of a user

    ```bash
    sudo usermod -d /home/test ilyasse
    ```

3. To change user login name

    ```bash
    sudo usermod -l ilyasse_updated ilyasse
    ```
4. To create a shell for the user

    ```bash
    sudo usermod -s /bin/bash ilyasse
    ```

5. Add or modify User Groups in Linux

    ```bash
    sudo usermod -aG group_name ilyasse
    ## multi groups
    sudo usermod -aG group1,group2,group3 ilyasse
    ```

## How delete a user

```bash
# remove with the home dir
sudo userdel -r ilyasse
sudo userdel --remove ilyasse
# keep the home dir
sudo userdel ilyasse
```

* `-r` or `--remove` :Files in the user's home directory will be removed along with the home directory itself

## Verifying

1. `id` command

    Print user and group IDs.

    ```bash
    id
    > uid=1000(ilyasse) gid=1000(ilyasse) groups=1000(ilyasse),4(adm),24(cdrom),27(sudo),30(dip),33(www-data),46(plugdev),122(lpadmin),135(lxd),136(sambashare)
    ```

    print only the effective user ID

    ```bash
    id -u
    > 1000
    ```

    print only the effective group ID

    ```bash
    id -g
    > 1000
    ```

    print only the effective user ID for Specific User

    ```bash
    id -u root
    id -u ilyasse
    ```
