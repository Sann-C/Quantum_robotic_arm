import rclpy
from rclpy.node import Node
from qiskit import Aer
from custom_interfaces.srv import QuantumPathPlan

class QuantumPlanner(Node):
    def __init__(self):
        super().__init__('quantum_planner')
        self.srv = self.create_service(
            QuantumPathPlan, 'quantum_path', self.calculate_path)

    def calculate_path(self, request, response):
        # 使用Grover算法生成路径
        qc = QuantumCircuit(2)
        qc.h([0,1])
        simulator = Aer.get_backend('aer_simulator')
        result = simulator.run(qc).result()
        counts = result.get_counts()
        response.path = list(counts.keys())[0]
        return response

def main(args=None):
    rclpy.init(args=args)
    node = QuantumPlanner()
    rclpy.spin(node)
    rclpy.shutdown()

if __name__ == '__main__':
    main()


