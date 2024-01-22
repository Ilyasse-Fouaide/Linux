# Introduction

SSH _(Secure Shell)_ is a secure protocol used as the primary means of connecting to Linux servers remotely.

## Generating and Working with SSH Keys

This section will cover how to generate SSH keys on a client machine and distribute the public key to servers where they should be used.

### Generating an SSH Key Pair

Generating a new SSH public and private key pair on your local computer is the first step towards authenticating with a remote server without a password

```bash
$ ssh-keygen
  # You can use the -t option to specify the type of key to create.
$ ssh-keygen -t rsa
  # You can use the -b option to specify the length (bit size) of the key
$ ssh-keygen -t -b 4096 rsa
  # ed25519 provides the highest security level
  # you can also use -C flag for specify a unique key name
$ ssh-keygen -t ed25519 -C "unique_name."
```

This procedure has generated an RSA and ED25519 SSH key pair, located in the .ssh hidden directory within your user’s home directory. These files are:

* ~/.ssh/id_rsa: The private key. DO NOT SHARE THIS FILE!
* ~/.ssh/id_rsa.pub: The associated public key. This can be shared freely without consequence.

### Copying your Public SSH Key to a Server with SSH-Copy-ID

To copy your public key to a server, allowing you to authenticate without a password.

You can copy the public key to the remote server using the following command.

```bash
  # with ed25519 key pairs.
$ ssh-copy-id -i ~/.ssh/id_25519.pub user@host-ip-address
  # with rsa key pairs
$ ssh-copy-id -i ~/.ssh/id_rsa.pub user@host-ip-address
```

To avoid having to do this every time you log in to your remote server, you can create or edit a configuration file in the ~/.ssh directory within the home directory of your local computer.

Edit or create the file now by typing:

```bash
$ nano ~/.ssh/config
```

In here, you can set host-specific configuration options. To specify your new port, use a format like this:

```bash
# ~/.ssh/config
Host any_name
    Hostname host-ip-address
    User user
    Port 22
    IdentityFile ~/.ssh/id_rsa
    # ForwardX11 yes

# and you can run it by typing this command:
$ ssh any_name
```

### Copying your Public SSH Key to a Server with SCP

```bash
$ scp /path/to/your/pub_key_file user@host-ip-addr:/home/user/.ssh/authorized_keys
  # e.g, with random ip addr
$ scp ~/.ssh/id_rsa root@192.168.1.34:/home/user/.ssh/authorized_keys
  # if you want to copy for example image file from you're local machine ↩
  # ↪ into your server
$ scp -i ~/.ssh/id_rsa /path/to/your/image.png root@192.168.1.34:/home/user/Pictures/
```

The ssh-copy-id command is an excellent tool to copy ssh public to the remote server securely.
This will connect to the remote host, authenticate with your credentials, and execute the command you specified. The connection will immediately close afterwards.


### Server-Side Configuration Options

#### Disabling Password Authentication

If you have SSH keys configured, tested, and working properly, it is probably a good idea to disable password authentication. This will prevent any user from signing in with SSH using a password.

To do this, connect to your remote server and open the `/etc/ssh/sshd_config` file with root or sudo privileges:

```bash
$ sudo nano /etc/ssh/sshd_config
```

Inside of the file, search for the PasswordAuthentication directive. If it is commented out, uncomment it. Set it to no to disable password logins.

```bash
PasswordAuthentication no
```

```bash
PubkeyAuthentication yes
AllowUsers user1 user2
PermitRootLogin no
X11Forwarding yes
PasswordAuthentication no
PermitEmptyPasswords no
```
