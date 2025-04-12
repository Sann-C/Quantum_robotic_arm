import time
import rclpy
from rclpy.node import Node
from custom_interfaces.srv import QuantumPathPlan

def benchmark(use_quantum=True):
    rclpy.init()
    node = Node('benchmark_node')
    
    if use_quantum:
        client = node.create_client(QuantumPathPlan, 'quantum_path')
        request = QuantumPathPlan.Request()
        start = time.time()
        client.call(request)
        return time.time() - start
    else:
        # 经典规划实现示例
        start = time.time()
        time.sleep(0.1)  # 模拟经典计算时间
        return time.time() - start

if __name__ == '__main__':
    q_time = benchmark(True)
    c_time = benchmark(False)
    print(f"Quantum Speedup Ratio: {c_time / q_time:.2f}x")

