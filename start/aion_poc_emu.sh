#!/usr/bin/env bash
# TODO move this to parameters file
BASE_DIR='/home/main'
AION_DIR='/aion/aion_io'

source "$BASE_DIR$AION_DIR/devel/setup.bash"
roslaunch aion_r1_gazebo gazebo.launch