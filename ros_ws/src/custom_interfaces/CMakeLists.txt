cmake_minimum_required(VERSION 3.10)
project(custom_interfaces)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

find_package(rosidl_default_generators REQUIRED)
find_package(action_msgs REQUIRED)
find_package(geometry_msgs REQUIRED)

rosidl_generate_interfaces(${PROJECT_NAME}
  "srv/QuantumPathPlan.srv"
  "action/FollowJointTrajectory.action"
  DEPENDENCIES action_msgs geometry_msgs
)

ament_package()

