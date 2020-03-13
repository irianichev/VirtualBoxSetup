#!/usr/bin/env sh
exists() {
    command -v "$1" >/dev/null 2>&1
}

if exists virtualbox; then
    echo VirtualBox already installed
else
    sudo add-apt-repository multiverse && sudo apt-get update
    sudo apt install -y virtualbox
fi
# virtualbox
