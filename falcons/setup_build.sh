#!/bin/bash

# Setup your sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
# Set up your keys
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo apt-get update
sudo apt-get upgrade -y

sudo apt install -y ros-melodic-desktop-full

# initialize ros dependency
sudo rosdep init
rosdep update

# setup ros environment, export variables and enable wrappers
source $my_env_setup_dir/environment.shinc
# falcons_dir
# my_env_setup_dir

# dependencies recomnded by ros
sudo apt install -y python-rosinstall python-rosinstall-generator python-wstool build-essential
# dependencies of falcons build
sudo apt-get install -y `cat $my_env_setup_dir/apt_packages.txt`


# emulate directory for proper linking
cd /home
sudo mkdir robocup
sudo chown $USER robocup
sudo chgrp $USER robocup
cd robocup
mkdir falcons
cd falcons
ln -s $falcons_dir/code .
ln -s $falcons_dir/data .
ln -s $falcons_dir/teamplayData .
cd $falcons_dir


# git hooks
cd $falcons_dir/code/.git/hooks
ln -s ../../scripts/pre-commit
ln -s ../../scripts/commit-msg


# first build
falcons_build_full


# pip packages
sudo pip install `cat $my_env_setup_dir/pip_packages.txt`
