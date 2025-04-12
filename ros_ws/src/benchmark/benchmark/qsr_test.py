import rclpy
from rclpy.node import Node
from custom_interfaces.srv import QuantumPathPlan
import time

class BenchmarkNode(Node):
    def __init__(self):
        super().__init__('benchmark_node')
        self.client = self.create_client(QuantumPathPlan, 'quantum_path')
        while not self.client.wait_for_service(timeout_sec=1.0):
            self.get_logger().info('Service not available, waiting...')

    def quantum_benchmark(self):
        request = QuantumPathPlan.Request()
        request.start = [0.0, 0.0]
        request.goal = [1.0, 1.0]
        future = self.client.call_async(request)
        rclpy.spin_until_future_complete(self, future)
        return future.result().path

def main(args=None):
    rclpy.init(args=args)
    node = BenchmarkNode()
    
    # 量子测试
    q_start = time.time()
    q_result = node.quantum_benchmark()
    q_time = time.time() - q_start
    
    # 经典测试（需实现classical_planner）
    # c_start = time.time()
    # c_result = classical_planner.plan()
    # c_time = time.time() - c_start
    
    print(f"Quantum Time: {q_time:.4f}s")
    # print(f"Classical Time: {c_time:.4f}s")
    # print(f"QSR: {c_time/q_time:.2f}x")
    
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()

