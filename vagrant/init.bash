#!/usr/bin/bash

function install_essentials() {
    sudo apt-get update && apt-get install -y \
        build-essential \
        cmake \
        gdb \
        as31 \
        vim \
        emacs \
        nasm &&
        apt-get autoclean -y
}

install_essentials
