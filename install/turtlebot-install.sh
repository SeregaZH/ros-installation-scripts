#!/usr/bin/env bash

# script parameters
ROS_DISRTO=${1:-'melodic'}
CATKIN_TURTLE_PATH=${2:-'catkin_ws'}

sudo apt-get install -y ros-melodic-joy \
      ros-${ROS_DISRTO}-teleop-twist-joy \
      ros-${ROS_DISRTO}-teleop-twist-keyboard \
      ros-${ROS_DISRTO}-laser-proc \
      ros-${ROS_DISRTO}-rgbd-launch \
      ros-${ROS_DISRTO}-depthimage-to-laserscan \
      ros-${ROS_DISRTO}-rosserial-arduino \
      ros-${ROS_DISRTO}-rosserial-python \
      ros-${ROS_DISRTO}-rosserial-server \
      ros-${ROS_DISRTO}-rosserial-client \
      ros-${ROS_DISRTO}-rosserial-msgs \
      ros-${ROS_DISRTO}-amcl \
      ros-${ROS_DISRTO}-map-server \
      ros-${ROS_DISRTO}-move-base \
      ros-${ROS_DISRTO}-urdf \
      ros-${ROS_DISRTO}-xacro \
      ros-${ROS_DISRTO}-compressed-image-transport \
      ros-${ROS_DISRTO}-rqt-image-view \
      ros-${ROS_DISRTO}-navigation \
      ros-${ROS_DISRTO}-interactive-markers

CURDIR=$PWD

# clone turtlebot3 repositories to src directory
SRC_PATH="$CATKIN_TURTLE_PATH/src"
echo $SRC_PATH
if [[ -d "$SRC_PATH" ]]
then
    sudo rm -rf "$SRC_PATH"
fi

sudo mkdir -p ${SRC_PATH}
cd ${SRC_PATH}
sudo git clone https://github.com/OpenSLAM-org/openslam_gmapping.git
sudo git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
sudo git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
sudo git clone https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
cd ..
echo $PWD
# build turtlebot3
sudo /bin/bash -c "source /opt/ros/melodic/setup.bash; catkin_make"
cd ${CURDIR}