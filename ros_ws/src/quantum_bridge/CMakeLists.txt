cmake_minimum_required(VERSION 3.8)
project(quantum_bridge)

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# 查找ROS 2依赖
find_package(ament_cmake REQUIRED)
find_package(rclcpp REQUIRED)
find_package(custom_interfaces REQUIRED)
find_package(qiskit REQUIRED) # 假设qiskit有对应的ROS包，若没有则需要手动处理依赖
find_package(Aer REQUIRED) # 假设Aer有对应的ROS包，若没有则需要手动处理依赖

# 添加可执行文件
add_executable(service_node src/quantum_bridge/service_node.py)
ament_target_dependencies(service_node rclcpp custom_interfaces qiskit Aer)

# 安装可执行文件
install(TARGETS
  service_node
  DESTINATION lib/${PROJECT_NAME}
)

# 导出包信息
ament_package()

