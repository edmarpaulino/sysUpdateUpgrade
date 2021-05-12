#! /usr/bin/env sh

# Program for automatic updating of the system.

# Checking if there is an internet connection.
if ! wget -q --spider https://www.google.com; then
    printf '%b' 'There is no internet connection.[Exit]\n'
    exit 1;
fi

# Packages list update
if sudo apt update; then
    printf '%b' 'Updated package list.[OK]\n'
else
    printf '%b' 'Failed, the package list has not been updated.[Exit]\n'
    exit 1
fi

# Packages upgrade
if sudo apt -y upgrade; then
    printf '%b' 'Packages upgraded successfully.[OK]\n'
else
    printf '%b' 'Failed, the packages have not been upgraded.[Exit]\n'
    exit 1
fi

# Cleaning /var/cache/apt/archives
if sudo apt clean; then
    printf '%b' 'Unnecessary files removed.[OK]\n'
else
    printf '%b' 'Failed to remove unnecessary files.[Exit]\n'
    exit 1
fi
