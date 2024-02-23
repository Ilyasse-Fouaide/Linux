# Initial Server Setup with Ubuntu

## Introduction

When you first create a new Ubuntu 20.04 server, you should perform some important configuration steps as part of the initial setup. These steps will increase the security and usability of your server.

## Step 1 — Logging in as root

To log into your server, you will need to know your **server’s public IP address**, You will also need to ssh to your remote server [All you need about ssh to remote server](../../ssh-essentials/README.MD)

## Step 2 — Creating a New User

Once you are logged in as root, you’ll be able to add the new user account. In the future, we’ll log in with this new account instead of root.

This command wil create a user name `ilyasse` with default shell */bin/bash* and add it to sudo group to be able run the commands as *superuser*, but you should replace *ilyasse* with your **name**

```bash
sudo useradd -s /bin/bash -G sudo ilyasse
```
## Step 3 — Setting Up a Basic Firewall

Ubuntu servers can use the UFW firewall to make sure only connections to certain services are allowed

First you will need to enable the Firewall

```bash
ufw enable
```

We need to make sure that the firewall allows SSH connections so that we can log back in next time. We can allow these connections by typing:

```bash
ufw allow 22/tcp
```

We need alse to allow the *HTTP/HTTPS* traffic.

```bash
ufw allow 80/tcp
ufw allow 443/tcp
```

## Next step

- [Install LEMP stack](../install-lemp-stack/README.md)
