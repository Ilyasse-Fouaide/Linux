# Bash Scripting

### Where I store my scripts ?

On most systems, some standard directories such as `/usr/local/bin`. Adding our script to any of these directories enables us to run the script from the command line. All users can use it from the command line

For scripts intended for personal use, we’d be better off putting them in a directory under our home directory, `~/.local/bin`

> [!NOTE]  
> You can also make you own custom directory, add it to PATH variable, and then use the scripts under this directory from the command line.  
For example, let’s include `~/my-scripts/bin`, in the PATH variable.

```bash
chmod +x /home/user/.my-scripts/bin/your-script
PATH=$PATH:/home/user/.my-scripts/bin
export PATH
```

Once we append this directory to the PATH variable, all the scripts and executables from this directory will be available for use from the command line.

> To avoid doing this on every reboot and make this addition permanent, we can run the above two commands automatically when the shell is initialized.

```bash
nano ~/.bashrc
### Add this two lines ###
+++++++++++++++ [~/.bashrc] ++++++++++++++
| PATH=$PATH:/home/user/.my-scripts/bin  |
| export PATH                            |
++++++++++++++++++++++++++++++++++++++++++
```
