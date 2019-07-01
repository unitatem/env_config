#!/bin/bash

sudo apt update

# terminal
sudo apt install -y guake
sudo apt install -y htop
sudo snap install emacs --classic

# swappiness
# sudo vim /etc/sysctl.conf
# vm.swappiness = 10

# git
sudo apt install -y git
git config --global core.editor "emacs"
git config --global user.email "wachowiczmariusz@gmail.com"
git config --global user.name "Mariusz Wachowicz"
sudo apt install -y gitk

# c/c++
sudo apt install -y gcc
sudo apt install -y make
sudo apt install -y g++
sudo apt install -y cmake
sudo apt install -y build-essential

# python
sudo apt install -y python3-pip

# java
sudo add-apt-repository ppa:linuxuprising/java
sudo apt update
sudo apt install -y oracle-java11-installer
sudo apt install -y oracle-java11-set-default

sudo apt install -y maven
sudo apt install -y gradle

# multimedia
sudo apt install -y vlc

# latex
sudo apt install -y texlive-full
sudo apt install -y texmaker

