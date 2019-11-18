#!/bin/bash

set -e
source /opt/ros/dashing/setup.bash
source /turtlebot3_ws/install/setup.bash
export ROS_DOMAIN_ID=30
export TURTLEBOT3_MODEL=burger

echo "========================================"
echo "ROS_DOMAIN_ID=$ROS_DOMAIN_ID"
echo "TURTLEBOT3_MODEL=$TURTLEBOT3_MODEL"
echo "========================================"
echo ""

ros2 run turtlebot3_teleop teleop_keyboard
