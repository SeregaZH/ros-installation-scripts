#!/usr/bin/bash
BASE_DIR='./main'
TRTL_PATH='/trtl'
sudo bash ./ros-install.sh

REBUILD_PX4=${1:-keep}
if [$REBUILD_PX4 = rebuild]
then
   sudo rmdir -f "$BASE_DIR"   
fi

if ! [ -d "$BASE_DIR"]
then
   sudo mkdir "$BASE_DIR"
fi

if [$REBUILD_PX4 = rebuild]
then
   TRTL_FULL_PATH = "$BASE_DIR$TRTL_PATH"
   sudo bash ./px4-sitl-install.sh $BASE_DIR
   sudo bash ./catkin-install.sh $TRTL_FULL_PATH
   sudo bash ./turtlebot-install.sh $TRTL_FULL_PATH
fi

sudo bash ./ros-bridge-install.sh