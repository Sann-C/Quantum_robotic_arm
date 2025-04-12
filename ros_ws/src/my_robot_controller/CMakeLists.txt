cmake_minimum_required(VERSION 3.8)
project(my_robot_controller)

# 查找依赖项
find_package(ament_cmake REQUIRED)
find_package(controller_interface REQUIRED)
find_package(rclcpp REQUIRED)

# 声明可执行文件（路径必须正确！）
add_executable(my_node 
  src/my_node.cpp
)

# 链接依赖库
ament_target_dependencies(my_node
  "controller_interface"
  "rclcpp"
)

# 安装可执行文件
install(TARGETS my_node
  DESTINATION lib/${PROJECT_NAME}
)

# 必须调用
ament_package()
