#! /bin/bash

sudo apt update
sudo apt install build-essential g++ python-dev autotools-dev libicu-dev build-essential libbz2-dev -y
sudo apt install python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential -y
sudo apt install python-empy python-nose -y
sudo apt install python-catkin-tools -y
sudo apt install cmake -y
sudo apt install python-numpy -y
sudo rosdep init
rosdep update
sudo apt install gcc-aarch64-linux-gnu g++-aarch64-linux-gnu -y
