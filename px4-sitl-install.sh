#!/usr/bin/bash
# clone px-4 repository

CATKIN_PATH=${1:-'catkin_ws/src/'}

# clone Firmware repository
CURDIR=$PWD
cd $CATKIN_PATH
sudo git clone https://github.com/PX4/Firmware.git
cd Firmware
git submodule update --init --recursive
cd $CURDIR