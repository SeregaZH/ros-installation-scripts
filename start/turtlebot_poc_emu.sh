#!/usr/bin/env bash

# TODO move this to parameters file
BASE_DIR='/home/main'
TRTL_PATH='/catkin_ws'

source "$BASE_DIR$TRTL_PATH/devel/setup.bash"
export TURTLEBOT3_MODEL=burger
roslaunch turtlebot3_gazebo turtlebot3_empty_world.launch