cmake_minimum_required(VERSION 3.8)
project(quantum_bridge)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

find_package(ament_cmake REQUIRED)
find_package(rclpy REQUIRED)
find_package(custom_interfaces REQUIRED)

install(DIRECTORY
  src/
  DESTINATION include/${PROJECT_NAME}
)

install(PROGRAMS
  scripts/service_node.py
  DESTINATION lib/${PROJECT_NAME}
)

ament_package()


