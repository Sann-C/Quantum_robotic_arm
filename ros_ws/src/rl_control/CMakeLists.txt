cmake_minimum_required(VERSION 3.8)
project(rl_control)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

find_package(ament_cmake REQUIRED)
find_package(rclpy REQUIRED)
find_package(sensor_msgs REQUIRED)
find_package(pennylane REQUIRED)
find_package(torch REQUIRED)
find_package(stable_baselines3 REQUIRED)

install(DIRECTORY
  src/
  DESTINATION include/${PROJECT_NAME}
)

ament_package()

