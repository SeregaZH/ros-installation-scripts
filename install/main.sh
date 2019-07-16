#!/usr/bin/bash
# TODO move it to parameters file
BASE_DIR='/home/main'
TRTL_PATH='/catkin_ws'

REBUILD_PX4=${1:-keep}
ROS_DISRTO=${2:-'melodic'}

DIR="$(dirname "$0")"
sudo apt update
sudo apt-get update
sudo bash ${DIR}/ros-install.sh ${ROS_DISRTO}

if [[ ${REBUILD_PX4} = rebuild ]]
then
   sudo rm -rf "$BASE_DIR"
fi

if ! [[ -d "$BASE_DIR" ]]
then
   sudo mkdir -p "$BASE_DIR"
fi

if [[ ${REBUILD_PX4} = rebuild ]]
then
   TRTL_FULL_PATH="$BASE_DIR$TRTL_PATH"
   sudo bash ${DIR}/px4-sitl-install.sh ${BASE_DIR}
   sudo bash ${DIR}/catkin-install.sh empty ${TRTL_FULL_PATH}
   sudo bash ${DIR}/turtlebot-install.sh ${ROS_DISRTO} ${TRTL_FULL_PATH}
   sudo bash ${DIR}/ardupilot-install.sh ${BASE_DIR}
   sudo bash ${DIR}/aion-robotics-install.sh ${BASE_DIR}
fi

sudo bash ${DIR}/ros-bridge-install.sh ${ROS_DISRTO}