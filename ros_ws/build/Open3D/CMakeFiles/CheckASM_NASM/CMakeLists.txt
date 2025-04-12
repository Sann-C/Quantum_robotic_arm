cmake_minimum_required(VERSION 4.0.0)
set(CMAKE_MODULE_PATH "/home/sann/ros_ws/Open3D/cmake;/home/sann/ros_ws/Open3D/3rdparty/cmake")
project(CheckASM_NASM ASM_NASM)
file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/result.cmake"
  "set(CMAKE_ASM_NASM_COMPILER \"${CMAKE_ASM_NASM_COMPILER}\")\n"
  
  )