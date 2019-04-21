#!/usr/bin/bash
BASE_DIR='/'
sudo bash ./ros-install.sh

REBUILD_PX4=${1:-keep}
if [ $REBUILD_PX4 = rebuild ]
then
   sudo bash ./catkin-install.sh $BASE_DIR
   sudo bash ./px4-sitl-install.sh $BASE_DIR
fi

sudo bash ./ros-bridge-install.sh
