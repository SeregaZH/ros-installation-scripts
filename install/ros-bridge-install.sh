#!/usr/bin/env bash

# install rosbridge

ROS_DISRTO=${1:-'melodic'}
sudo apt-get install ros-${ROS_DISRTO}-rosbridge-suite -y

