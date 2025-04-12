import open3d as o3d
import numpy as np
from qiskit.quantum_info import Statevector

class QuantumEncoder:
    def __init__(self, num_qubits=8):
        self.num_qubits = num_qubits

    def encode(self, pcd_path):
        pcd = o3d.io.read_point_cloud(pcd_path)
        points = np.asarray(pcd.points)
        points_norm = points / np.linalg.norm(points, axis=1)[:, None]
        quantum_state = Statevector(points_norm.flatten()[:2**self.num_qubits])
        return quantum_state

