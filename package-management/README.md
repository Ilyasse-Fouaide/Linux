# Package Management in Linux

## Table of content

* [Comparison of Package Managers](#A)
    * [APT](#Aa)
    * [DNF/YUM](#Ab)
    * [Pcman](#Ac)
* [Using APT to Manage Packages in Debian and Ubuntu](#B)

## Comparison of Package Managers <a id="A"></a>

There are lots of package managers in Linux, each working a bit differently. Here is a list of common package managers, along with their supported distributions, package file formats, and a description

### APT <a id="Aa"></a>

Using APT to Manage Packages in Debian and Ubuntu

* Distributions: Ubuntu, Debian, and Kali Linux
* Commands: `apt`, `apt-get`, `apt-cache`
* Underlying package management tool: **_dpkg_**
* Package file format: `.deb`

### DNF/YUM <a id="Ab"></a>

Using DNF to Manage Packages in CentOS/RHEL 8 and Fedora

* Distributions: RHEL/CentOS 8, Fedora 22, and later versions of both distributions
* Commands: `dnf`, `yum`
* Underlying package management tool: **_RPM_** (RPM Package Manager)
* Package file format: `.rpm`

### Pacman <a id="Ac"></a>

Using Pacman to Manage Packages in Arch

Distributions: Arch-based, including Arch and Manjaro
Command: `pacman`
Package file format: `.tar.xz` (and other compressed tar formats)

## Using APT to Manage Packages in Debian and Ubuntu <a id="B"></a>

### Installing Packages

Installs the specified package and all required dependencies. Replace [package] with the name of the package you wish to install. The `apt` install command is interchangeable with `apt-get` install.

```bash
sudo apt install [package]
# for multi Packages
sudo apt install package1 package2 ...
```

**Before installing packages**, it’s highly recommended to obtain updated package version and dependency information and upgrade packages and dependencies to those latest version.

```bash
sudo apt update && sudo apt upgrade
```

Additional options, commands, and notes:

* Install a specific version by adding an equal sign after the package, followed by the version number you’d like to install.

    ```bash
    sudo apt install [package]=[version]
    ```
* Reinstall a package and any dependencies by running the following command. This is useful if an installation for a package becomes corrupt or dependencies were somehow removed.

    ```bash
    sudo apt reinstall [package]
    ```
