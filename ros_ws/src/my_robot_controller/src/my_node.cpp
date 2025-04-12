#include "rclcpp/rclcpp.hpp"

class MyController : public rclcpp::Node {
public:
  MyController() : Node("my_controller_node") {
    RCLCPP_INFO(this->get_logger(), "控制器节点已启动!");
  }
};

int main(int argc, char** argv) {
  rclcpp::init(argc, argv);
  auto node = std::make_shared<MyController>();
  rclcpp::spin(node);
  rclcpp::shutdown();
  return 0;
}
