#!/bin/bash

set -e
source /opt/ros/dashing/setup.bash
source /turtlebot3_ws/install/setup.bash
export ROS_DOMAIN_ID=30
export TURTLEBOT3_MODEL=burger

echo "start..."
ros2 run turtlebot3_teleop teleop_keyboard
