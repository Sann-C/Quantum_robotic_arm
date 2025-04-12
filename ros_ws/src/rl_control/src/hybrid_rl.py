import torch
import pennylane as qml
from stable_baselines3 import PPO

class QuantumCritic(torch.nn.Module):
    def __init__(self, num_qubits=8):
        super().__init__()
        self.dev = qml.device('default.qubit', wires=num_qubits)
        
        self.qlayer = qml.qnn.TorchLayer(
            self.create_circuit,
            weight_shapes={"weights": (3, num_qubits, 3)}
        )

    @qml.qnode(self.dev, interface="torch")
    def create_circuit(self, inputs, weights):
        qml.AmplitudeEmbedding(features=inputs, wires=range(8), normalize=True)
        qml.StronglyEntanglingLayers(weights, wires=range(8))
        return qml.expval(qml.PauliZ(0))

    def forward(self, x):
        return self.qlayer(x)

# 创建混合PPO模型示例
# model = PPO("MlpPolicy", env, policy_kwargs={"critic": QuantumCritic})

