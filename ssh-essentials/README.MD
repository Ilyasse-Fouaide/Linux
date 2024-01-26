# Introduction

SSH _(Secure Shell)_ is a secure protocol used as the primary means of connecting to Linux servers remotely.

## Generating and Working with SSH Keys

This section will cover how to generate SSH keys on a client machine and distribute the public key to servers where they should be used.

### Generating an SSH Key Pair

Generating a new SSH public and private key pair on your local computer is the first step towards authenticating with a remote server without a password

```sh
$ ssh-keygen
  # You can use the -t option to specify the type of key to create.
$ ssh-keygen -t rsa
  # You can use the -b option to specify the length (bit size) of the key
$ ssh-keygen -t rsa -b 4096
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

```shell
  # with ed25519 key pairs.
$ ssh-copy-id -i ~/.ssh/id_25519.pub user@host-ip-address
  # with rsa key pairs
$ ssh-copy-id -i ~/.ssh/id_rsa.pub user@host-ip-address
```

### Log In to Your Remote Server

```bash
$ ssh -i ~/.ssh/id_rsa user@host-ip-address
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
$ scp ~/.ssh/id_rsa.pub root@192.168.1.34:/home/user/.ssh/authorized_keys
  # if you want to copy for example image file from your local machine ↩
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

### What is the SSH agent?

`ssh-agent` is a key manager for SSH. It holds your keys and certificates in memory, unencrypted, and ready for use by ssh. It saves you from typing a passphrase every time you connect to a server. It runs in the background on your system, separately from ssh, and it usually starts up the first time you run ssh after a reboot.

> In Unix, `ssh-agent` is a background program that handles passwords for SSH private keys. The ssh-add command prompts the user for a private key password and adds it to the list maintained by ssh-agent. Once you add a password to ssh-agent, you will not be prompted for it when using SSH or `scp` to connect to hosts with your public key.

To use ssh-agent and ssh-add, follow the steps below:

1. At the terminal, enter:

```bash
$ eval $(ssh-agent)
# --- you can verify with this command ---
$ ps -aux | grep ssh-agent
# output:
> user     3497  0.0  0.1   7976  5632 ?        S    10:02   0:00 /usr/bin/ssh-agent -D -a /run/user/1000/keyring/.ssh
> user     9014  0.0  0.0   7976  1908 ?        Ss   19:29   0:00 ssh-agent
# --- or you can verify with this commands
echo $SSH_AGENT_PID
echo $SSH_AUTH_SOCK
# output
> 9014
> /tmp/ssh-Jln2ng5l98v4/agent.9014
```

2. Add your private key to the `ssh-agent`

```bash
$ ssh-add ~/.ssh/id_ed25519
```

3. Get a list of all the keys currently added to ssh-agent using:

```bash
$ ssh-add -l
# output
> 256 SHA256:<KEY_ID> example-user@localhost (ED25519)
```

4. Try to connect to your remote server without asking for `passphrase` in every time

```bash
$ ssh -i ~/.ssh/id_25519 user@host-ip-address
```

> [!IMPORTANT]  
> The ssh agent allow you to to cache you private key, that way you need to type your `passphrase` once per your terminal session, if you exit your terminal and enter again you need to start the `ssh-agent` again and add your private key to the agent

### Explain `eval $(ssh-agent)`

`eval` is for evaluating and executing expressions as commands.

```bash
$ x=pwd
$ echo $x
# output
> pwd
$ eval $x
# output
> /home/user
```

To understand what `ssh-agent` command do lets print it out:

```bash
$ echo $(ssh-agent)
# output
> SSH_AUTH_SOCK=/tmp/ssh-XXXXXXVSIpuN/agent.9619; export SSH_AUTH_SOCK;
> SSH_AGENT_PID=9620; export SSH_AGENT_PID; echo Agent pid 9620;
```

ssh-agent it print a string/text that export `SSH_AUTH_SOCK` and `SSH_AGENT_PID`, the export command it write in the env variables to access the variables from anywhere.

To run it as a string you can run this command:

```bash
$ eval `ssh-agent`
# --- or ---
$ eval $(ssh-agent)
```

So, when you run eval $(ssh-agent), you're not just printing the output of ssh-agent to the terminal; you're actually setting up the SSH agent and its associated environment variables, making it ready for use within your shell session.

### SSH agent forwarding

`SSH agent forwarding` is a mechanism that allows you to use your local SSH key on a remote machine, typically when connecting through an intermediate server. This can be useful in scenarios like, where you have multiple servers (`web_server` and `back_end` server) and you want to securely access the back-end server from the web_server.

Imagine you have two instances in `AWS (EC2)`: one named `web_server` and the other named `back_end`. Your goal is to establish a secure connection to the back_end server from the web_server. Initially, you might think of generating key pairs for the back_end server and connecting to the web_server. However, a potential security concern arises. If an attacker manages to compromise your web_server, they could gain unauthorized access to the back_end server.

To address this security risk, a more secure approach is required.

Here's a step-by-step explanation:

1. Local Machine (Your Computer):

  * Generate RSA key pairs for web_server and back-end server:

    ```bash
    $ ssh-keygen -t rsa -b 4096
    ```

  * Copy the public key to the web_server and the back_end server:
    ```bash
    $ ssh-copy-id -i ~/.ssh/id_rsa.pub ec2-user@web-server-ip-addr
    $ ssh-copy-id -i ~/.ssh/id_rsa.pub ec2-user@back-end-ip-addr
    ```

  * Add the RSA private key to the SSH agent:
    ```bash
    $ eval $(ssh-agent)
    $ ssh-add ~/.ssh/id_rsa
      # Verify the key is added
    $ ssh-add -l
    # output:
    > 256 SHA256:<KEY_ID> example-user@localhost (ED25519)
    ```

2. Connect to the Web Server (AWS instance named web_server):

  ```bash
  $ ssh -A ec2-user@web-server-ip-addr
  ```

3. On the Web Server:

  * Check if the your private key is forwarded correctly:
    ```bash
    $ ssh-add -l
    # same output
    > 256 SHA256:<KEY_ID> example-user@localhost (ED25519)
    ```

  * Connect to the Back-End Server:
    ```bash
    $ ssh -A ec2-user@back-end-ip-addr
    ```
    * This step utilizes agent forwarding, allowing the web_server to use your local SSH agent. You don't need to copy the private key to the web_server, maintaining a more secure setup.

By using SSH agent forwarding, your private key never leaves your local machine, and you can securely connect through intermediate servers. It's crucial to keep your systems and SSH keys secure, regularly update them, and follow best practices for securing your servers.
