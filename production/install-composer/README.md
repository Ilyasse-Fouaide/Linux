# How To Install Composer on Ubuntu 

## Introduction

In this quickstart guide, we’ll install **Composer** on an Ubuntu 22.04 server.


## Step 1 — Install Dependencies

Start by updating your package manager cache and installing the required dependencies, including `php-cli`:

```bash
sudo apt update
sudo apt install php-cli unzip
```

## Step 2 — Download and Install Composer

Make sure you’re in your **home** directory, then retrieve the Composer installer using `curl`:

```bash
cd ~
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
```

Next, we’ll verify that the downloaded installer matches the SHA-384 hash for the latest installer found on the Composer Public Keys / Signatures page.

Using `curl`, fetch the latest signature and store it in a shell variable:

```bash
HASH=`curl -sS https://composer.github.io/installer.sig`
```

Now execute the following PHP code to verify that the installation script is safe to run:

```bash
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
```

You’ll see the following output:

```
Installer verified
```

> [!NOTE]  
> If the output says `Installer corrupt`, you’ll need to **repeat** the download and verification process until you have a verified installer.

The following command will download and install Composer as a system-wide command named `composer`, under `/usr/local/bin:`

```bash
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
```

You’ll see output similar to this:

```
Output
All settings correct for using Composer
Downloading...

Composer (version 2.3.5) successfully installed to: /usr/local/bin/composer
Use it: php /usr/local/bin/composer
```

To test your installation, run:

```bash
composer
```

```
Output
   ______
  / ____/___  ____ ___  ____  ____  ________  _____
 / /   / __ \/ __ `__ \/ __ \/ __ \/ ___/ _ \/ ___/
/ /___/ /_/ / / / / / / /_/ / /_/ (__  )  __/ /
\____/\____/_/ /_/ /_/ .___/\____/____/\___/_/
                    /_/
Composer version 2.3.5 2022-04-13 16:43:00

Usage:
  command [options] [arguments]

Options:
  -h, --help                     Display help for the given command. When no command is given display help for the list command
  -q, --quiet                    Do not output any message
  -V, --version                  Display this application version
      --ansi|--no-ansi           Force (or disable --no-ansi) ANSI output
  -n, --no-interaction           Do not ask any interactive question
      --profile                  Display timing and memory usage information
      --no-plugins               Whether to disable plugins.
      --no-scripts               Skips the execution of all scripts defined in composer.json file.
  -d, --working-dir=WORKING-DIR  If specified, use the given directory as working directory.
      --no-cache                 Prevent use of the cache
  -v|vv|vvv, --verbose           Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug
...
```

This verifies that Composer was successfully installed on your system and is available system-wide.

## Next step:

- [Install laravel](../install-laravel/README.md)
