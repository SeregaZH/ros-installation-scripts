#!/usr/bin/env bash

# colored console echo in yellow
# TODO rewrite to reuse this code
YEL='\033[0;33m'
NC='\033[0m'
function echo_yel() {
    echo -e "$YEL $1 $NC"
}

# script parameters
ACTION=${1:-empty} #possible values : empty (default) or init
CATKIN_PATH=${2:-'catkin_ws'}
SRC_PATH=${3:-'src'}

echo_yel ${CATKIN_PATH}
echo_yel ${SRC_PATH}

# create catkin workplace
FULL_PATH="$CATKIN_PATH/$SRC_PATH"
if [[ -d ${FULL_PATH} ]]
then
    echo_yel "The directory $FULL_PATH exists remove the directory"
    sudo rm -rf ${FULL_PATH}
fi

sudo mkdir -p ${FULL_PATH}

CURDIR=$PWD
cd ${CATKIN_PATH}

#init workplace if required else use empty workplace
if [[ ${ACTION} = init ]]
then
    sudo /bin/bash -c "source /opt/ros/melodic/setup.bash; catkin_init_workspace"
fi

cd ${CURDIR}