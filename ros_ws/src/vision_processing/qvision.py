import open3d as o3d
import numpy as np
from qiskit.quantum_info import Statevector

class QuantumEncoder:
    def __init__(self, num_qubits=8):
        self.num_qubits = num_qubits
        self.dim = 2 ** num_qubits

    def encode(self, pcd_path):
        pcd = o3d.io.read_point_cloud(pcd_path)
        points = np.asarray(pcd.points)
        
        # 归一化处理
        points = points - points.mean(axis=0)
        points = points / np.linalg.norm(points)
        
        # 截断到量子态维度
        flat_points = points.flatten()[:self.dim]
        state = flat_points / np.linalg.norm(flat_points)
        
        return Statevector(state)

