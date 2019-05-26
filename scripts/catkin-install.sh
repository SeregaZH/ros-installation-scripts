#!/usr/bin/bash

# colored console echo in yellow
# TODO rewrite to reuse this code
YEL='\033[0;33m'
NC='\033[0m'
function echo_yel() {
    echo -e "$YEL $1 $NC"
}

# script parameters
CATKIN_PATH=${1:-'catkin_ws/'}
SRC_PATH=${2:-'src/'}

echo_yel $CATKIN_PATH
echo_yel $SRC_PATH

# create catkin workplace
FULL_PATH="$CATKIN_PATH$SRC_PATH"
if [ -d $FULL_PATH ]
then
    echo_yel "The directory $FULL_PATH exists remove the directory"
    sudo rm -rf $FULL_PATH
fi

sudo mkdir -p $FULL_PATH

CURDIR=$PWD
cd $CATKIN_PATH
/bin/bash catkin_init
cd $CURDIR