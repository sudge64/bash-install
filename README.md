# bash-install
 A collection of bash scripts to setup my Linux installations just as I prefer them. This project can be considered a sequel/replacement for my [`ansible_configuration`](https://github.com/sudge64/ansible_configuration) repo.

## Behind the Curtain

This collection of scripts is driven by a main script, `installer.sh` that sources different distro dependent scripts depending on the contents found within each individual `os-release` file.

From there, distro specific settings and packages can be applied and installed, respectively.

My dotfiles are kept within the `files` directory.

The names of the packages to be installed are held within text files in the `packages` directory. They are organized by package manager first and whether they are **cli** or **graphical** tools second. The flatpak packages are organized by category.

## Installation

First, you must clone the repository. Change into the repo directory. Change the permissions on the script files so that they are executable. Finally, excute the `installer.sh` script with `sudo`.

1. `git clone https://github.com/sudge64/bash-install`
2. `cd bash-install`
3. `chmod a+x *.sh`
4. `sudo ./installer.sh`

