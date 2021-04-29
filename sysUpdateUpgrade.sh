#! /usr/bin/env bash

# Program for automatic updating of the system.

# Checking if there is an internet connection.
if ! wget -q --spider https://www.google.com; then
    echo 'There is no internet connection.[Exit]'
    exit 1;
fi

# Packages list update
if sudo apt update; then
    echo 'Updated package list.[OK]'
else
    echo 'Failed, the package list has not been updated.[Exit]'
    exit 1
fi

# Packages upgrade
if sudo apt -y upgrade; then
    echo 'Packages upgraded successfully.[OK]'
else
    echo 'Failed, the packages have not been upgraded.[Exit]'
    exit 1
fi

# Cleaning /var/cache/apt/archives
if sudo apt clean; then
    echo 'Unnecessary files removed.[OK]'
else
    echo 'Failed to remove unnecessary files.[Exit]'
    exit 1
fi
