#!/usr/bin/bash
# TODO move it to parameters file
BASE_DIR='/home/main'
TRTL_PATH='/catkin_ws'

DIR="$(dirname "$0")"
sudo bash ${DIR}/ros-install.sh

REBUILD_PX4=${1:-keep}
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
   sudo bash ${DIR}/turtlebot-install.sh ${TRTL_FULL_PATH}
   sudo bash ${DIR}/ardupilot-install.sh ${BASE_DIR}
   sudo bash ${DIR}/aion-robotics-install.sh ${BASE_DIR}
fi

sudo bash ${DIR}/ros-bridge-install.sh