#!/usr/bin/bash

# script parameters
CATKIN_PATH=${1:-'catkin_ws/'}
SRC_PATH=${2:-'src/'}

echo $CATKIN_PATH
echo $SRC_PATH

# create catkin workplace
FULL_PATH="$CATKIN_PATH$SRC_PATH"
if [ -d $FULL_PATH ]
then
    echo "The directory $FULL_PATH exists remove the directory"
    sudo rm -r $FULL_PATH
fi

sudo mkdir -p $FULL_PATH