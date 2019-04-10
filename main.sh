#!/usr/bin/bash

sudo bash ./ros-install.sh

REBUILD_PX4=${1:-keep}
if [ $REBUILD_PX4 = rebuild ]
then
   sudo bash ./catkin-install.sh
   sudo bash ./px4-sitl-install.sh
fi

sudo apt-get install python-jinja2 -y
sudo pip install numpy toml

