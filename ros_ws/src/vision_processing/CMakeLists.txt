cmake_minimum_required(VERSION 3.10)
project(vision_processing)

# 设置 C++ 标准
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 17)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# 查找 ROS 2 依赖
find_package(ament_cmake REQUIRED)
find_package(rclpy REQUIRED)
find_package(open3d REQUIRED) # 假设存在对应的 ROS 包，若没有需手动处理依赖
find_package(qiskit REQUIRED) # 假设存在对应的 ROS 包，若没有需手动处理依赖

# 安装 Python 脚本
install(PROGRAMS
  src/vision_processing/qvision.py
  DESTINATION lib/${PROJECT_NAME}
)

# 导出包信息
ament_package()

