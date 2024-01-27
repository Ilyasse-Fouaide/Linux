# Bash Scripting

### Where I store my scripts ?

On most systems, some standard directories such as `/usr/local/bin`. Adding our script to any of these directories enables us to run the script from the command line. All users can use it from the command line

For scripts intended for personal use, we’d be better off putting them in a directory under our home directory, `~/.local/bin`

> [!NOTE]  
> You can also make you own custom directory, add it to PATH variable, and then use the scripts under this directory from the command line.  
For example, let’s include `~/.my-scripts/bin`, in the PATH variable.

```bash
chmod +x /home/user/.my-scripts/bin/your-script
PATH=$PATH:/home/user/.my-scripts/bin
export PATH
```


Once we append this directory to the PATH variable, all the scripts and executables from this directory will be available for use from the command line.

> To avoid doing this on every reboot and make this addition permanent, we can run the above two commands automatically when the shell is initialized.

1. Apply only to your user account

    ```bash
    nano ~/.bashrc
    ### Add this two lines ###
    +------------- [~/.bashrc] --------------+
    | PATH=$PATH:/home/user/.my-scripts/bin  |
    | export PATH                            |
    +----------------------------------------+
    ```

    `~/.bashrc`: This file is typically used for configuring the behavior of interactive shells. It's specific to Bash, and changes made here will affect only the user who owns the .bashrc file.

2. Applying to all users.

    ```bash
    sudo nano /etc/profile
    ### Add this two lines ###
    +------------ [etc/profile] -------------+
    | PATH=$PATH:/home/user/.my-scripts/bin  |
    | export PATH                            |
    +----------------------------------------+
    ```

    This is suitable if you want the changes to be system-wide, applying to all users.

Choose the location based on your specific requirements. For individual user configurations, `~/.bashrc` or `~/.profile` is often preferred. If you want a system-wide configuration, you might consider modifying `/etc/profile`.
