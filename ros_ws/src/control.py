import numpy as np
import matplotlib.pyplot as plt
from scipy.linalg import solve_lyapunov

# ======================
# 自适应控制器类
# ======================
class AdaptiveController:
    def __init__(self, a0, a1, gamma_theta, gamma_w, gamma_kappa, Fmax, delta):
        """
        初始化自适应控制器
        参数：
            a0, a1 : float - 参考模型参数
            gamma_theta : float - 参数自适应增益
            gamma_w : float - 模糊权重自适应增益
            gamma_kappa : float - PRACM参数自适应增益
            Fmax : float - 鲁棒项幅值
            delta : float - 边界层厚度
        """
        # 参考模型系统矩阵
        self.Am = np.array([[0, 1], [-a0, -a1]])
        
        # 求解Lyapunov方程
        Q = np.diag([15, 15])  # 权重矩阵
        P = solve_lyapunov(self.Am.T, -Q)  # 求解 AP + PA^T + Q = 0
        self.p2, self.p3 = P[0, 1], P[1, 1]  # 提取Lyapunov矩阵元素
        
        # 自适应参数初始化
        self.k = np.zeros(3)  # [k0, k1, k2]
        self.gamma_theta = gamma_theta
        self.gamma_w = gamma_w
        self.gamma_kappa = gamma_kappa
        self.Fmax = Fmax
        self.delta = delta

    def update(self, t, ref_states, plant_states, dt):
        """
        更新控制律并计算控制输入
        参数：
            t : float - 当前时间
            ref_states : array - 参考模型状态 [th_m, dth_m]
            plant_states : array - 被控对象状态 [th, dth]
            dt : float - 时间步长
        返回：
            ut : float - 控制输入
        """
        thm, dthm = ref_states  # 参考模型状态
        th, dth = plant_states  # 被控对象状态
        
        # 计算误差
        e = thm - th
        de = dthm - dth
        ep = self.p2 * e + self.p3 * de  # 合成误差
        
        # 方波参考信号
        r = np.sign(np.sin(0.025 * 2 * np.pi * t))
        
        # 更新自适应参数
        self.k[0] += self.gamma_theta * ep * r * dt  # dk0/dt
        self.k[1] += self.gamma_w * ep * th * dt     # dk1/dt
        self.k[2] += self.gamma_kappa * ep * dth * dt # dk2/dt
        
        # 饱和函数
        kk = 1 / self.delta
        if abs(ep) > self.delta:
            sats = np.sign(ep)
        else:
            sats = kk * ep
        
        # 控制量合成
        v = self.Fmax * sats
        ut = self.k[0] * r + self.k[1] * th + self.k[2] * dth + v
        
        return ut

# ======================
# 参考模型类
# ======================
class ReferenceModel:
    def __init__(self, a0, a1, b):
        """
        初始化参考模型
        参数：
            a0, a1 : float - 参考模型参数
            b : float - 输入增益
        """
        self.a0, self.a1, self.b = a0, a1, b
        self.states = np.array([0.0, 0.0])  # [th_m, dth_m]

    def step(self, t, dt):
        """
        更新参考模型状态
        参数：
            t : float - 当前时间
            dt : float - 时间步长
        返回：
            states : array - 当前参考状态 [th_m, dth_m]
        """
        r = np.sign(np.sin(0.025 * 2 * np.pi * t))  # 方波输入
        x1, x2 = self.states
        dx1 = x2
        dx2 = -self.a1 * x2 - self.a0 * x1 + self.b * r
        self.states += np.array([dx1 * dt, dx2 * dt])
        return self.states.copy()

# ======================
# 被控对象类
# ======================
class Plant:
    def __init__(self, alpha0, alpha1, beta):
        """
        初始化被控对象
        参数：
            alpha0, alpha1 : float - 系统参数
            beta : float - 控制增益
        """
        self.alpha0, self.alpha1, self.beta = alpha0, alpha1, beta
        self.states = np.array([0.0, 0.0])  # [th, dth]

    def step(self, ut, dt):
        """
        更新被控对象状态
        参数：
            ut : float - 控制输入
            dt : float - 时间步长
        返回：
            states : array - 当前对象状态 [th, dth]
        """
        x1, x2 = self.states
        f = 0.5 * x2 + 0.1 * np.sign(x2)  # 摩擦模型
        dx1 = x2
        dx2 = self.beta * ut - self.beta * f - self.alpha1 * x2 - self.alpha0 * x1
        self.states += np.array([dx1 * dt, dx2 * dt])
        return self.states.copy()

# ======================
# 主仿真程序
# ======================
def main():
    # 参数输入提示
    print("请输入仿真参数：")
    a0 = float(input("参考模型参数 a0: "))
    a1 = float(input("参考模型参数 a1: "))
    b = float(input("参考模型输入增益 b: "))
    alpha0 = float(input("被控对象参数 alpha0: "))
    alpha1 = float(input("被控对象参数 alpha1: "))
    beta = float(input("被控对象控制增益 beta: "))
    gamma_theta = float(input("参数自适应增益 gamma_theta: "))
    gamma_w = float(input("模糊权重自适应增益 gamma_w: "))
    gamma_kappa = float(input("PRACM参数自适应增益 gamma_kappa: "))
    Fmax = float(input("鲁棒项幅值 Fmax: "))
    delta = float(input("边界层厚度 delta: "))
    dt = float(input("仿真时间步长 dt: "))
    T = float(input("总仿真时间 T: "))

    # 初始化模块
    ctrl = AdaptiveController(a0, a1, gamma_theta, gamma_w, gamma_kappa, Fmax, delta)
    ref_model = ReferenceModel(a0, a1, b)
    plant = Plant(alpha0, alpha1, beta)

    # 数据记录
    steps = int(T / dt)
    time = np.arange(0, T, dt)
    ref_pos = np.zeros(steps)
    ref_vel = np.zeros(steps)
    plant_pos = np.zeros(steps)
    plant_vel = np.zeros(steps)
    control = np.zeros(steps)

    # 主仿真循环
    for i in range(steps):
        t = i * dt
        
        # 更新参考模型
        ref_states = ref_model.step(t, dt)
        
        # 获取被控对象状态
        plant_states = plant.states.copy()
        
        # 计算控制量
        ut = ctrl.update(t, ref_states, plant_states, dt)
        
        # 更新被控对象状态
        plant.step(ut, dt)
        
        # 记录数据
        ref_pos[i] = ref_states[0]
        ref_vel[i] = ref_states[1]
        plant_pos[i] = plant_states[0]
        plant_vel[i] = plant_states[1]
        control[i] = ut

    # 结果可视化
    plt.figure(figsize=(12, 8))
    
    # 位置跟踪
    plt.subplot(3, 1, 1)
    plt.plot(time, ref_pos, 'r--', label='Reference')
    plt.plot(time, plant_pos, 'b-', label='Actual')
    plt.ylabel('Position Tracking (rad)')
    plt.legend()
    plt.grid(True)
    
    # 速度跟踪
    plt.subplot(3, 1, 2)
    plt.plot(time, ref_vel, 'r--', label='Reference')
    plt.plot(time, plant_vel, 'b-', label='Actual')
    plt.ylabel('Velocity Tracking (rad/s)')
    plt.legend()
    plt.grid(True)
    
    # 控制输入
    plt.subplot(3, 1, 3)
    plt.plot(time, control, 'g-', label='Control Input')
    plt.ylabel('Control Input (Nm)')
    plt.xlabel('Time (s)')
    plt.grid(True)
    
    plt.tight_layout()
    plt.show()

# 运行主程序
if __name__ == "__main__":
    main()


'''
以下是代码中输入参数的详细解释，按输入顺序分类说明：



### 一、参考模型参数
#### 1. a0 和 a1
- 含义：参考模型的系统矩阵参数，决定参考模型的动态特性。
- 数学表达式：
  \[
  \ddot{\bm{q}}_d = -a_1 \dot{\bm{q}}_d - a_0 \bm{q}_d + b \cdot r
  \]
- 作用：
  - `a0` 控制位置误差的刚度（类似弹簧系数）。
  - `a1` 控制速度误差的阻尼（类似阻尼系数）。
- **典型值：`a0=30`, `a1=20`（来自原始MATLAB代码）。

#### 2. b
- 含义：参考模型的输入增益，决定外部输入对参考模型的影响强度。
- 数学表达式**：出现在上述方程的输入项 \(b \cdot r\)。
- 作用**：放大参考输入信号（如方波信号）的作用。
- 典型值**：`b=50`。

---

### 二、被控对象参数
#### 3. alpha0 和 alpha1
- 含义：被控对象（实际系统）的固有参数，描述实际系统的动态特性。
- 数学表达式：
  \[
  \ddot{\bm{q}} = \beta \cdot \bm{\tau} - \beta \cdot f - \alpha_1 \dot{\bm{q}} - \alpha_0 \bm{q}
  \]
- 作用：
  - `alpha0` 类似实际系统的刚度。
  - `alpha1` 类似实际系统的阻尼。
- 典型值：`alpha0=0.10`, `alpha1=0.10`。

#### 4. beta
- 含义：被控对象的控制增益，表示控制输入对系统加速度的影响。
- 数学表达式**：控制输入项前的系数 \(\beta \cdot \bm{\tau}\)。
- 作用**：放大控制输入的力矩效果。
- 典型值**：`beta=10`。

---

### 三、控制器参数
#### 5. gamma_theta
- 含义：动力学参数自适应增益，控制参数估计的更新速度。
- 数学表达式：
  \[
  \dot{\hat{\bm{\theta}}} = -\gamma_\theta \cdot \bm{Y}^T \bm{z}
  \]
- 作用**：值越大，参数估计收敛越快，但过大会导致震荡。
- **典型值**：`gamma_theta=1.5`。

#### 6. **gamma_w**
- **含义**：模糊权重自适应增益，控制模糊规则权重的更新速度。
- **数学表达式**：
  \[
  \dot{w}_j = \gamma_w \cdot \mu_j(\bm{e}) \|\bm{e}\|
  \]
- **作用**：调整模糊补偿项的响应速度。
- **典型值**：`gamma_w=1.5`。

#### 7. **gamma_kappa**
- **含义**：PRACM参数自适应增益，控制PRACM项的更新速度。
- **数学表达式**：
  \[
  \dot{\kappa}_i = -\gamma_\kappa \cdot \text{proj}(\bm{z})
  \]
- **作用**：调节前馈补偿的强度。
- **典型值**：`gamma_kappa=1.5`。

#### 8. **Fmax**
- **含义**：鲁棒控制项的最大幅值，用于抑制未建模扰动。
- **数学表达式**：
  \[
  \bm{\tau}_{prog} = -F_{\text{max}} \cdot \text{sat}\left(\frac{\bm{z}}{\delta}\right)
  \]
- **作用**：值越大，抗扰动能力越强，但可能引起高频抖振。
- **典型值**：`Fmax=1.0`。

#### 9. **delta**
- **含义**：边界层厚度，用于平滑符号函数（防止高频抖振）。
- **数学表达式**：
  \[
  \text{sat}(x) = 
  \begin{cases} 
  \text{sign}(x), & |x| > \delta \\
  x/\delta, & |x| \leq \delta 
  \end{cases}
  \]
- **作用**：值越大，控制输入越平滑，但跟踪精度可能下降。
- **典型值**：`delta=0.1`。

---

### **四、仿真参数**
#### 10. **dt**
- **含义**：仿真时间步长，决定数值积分的精度。
- **作用**：值越小，仿真越精确，但计算时间越长。
- **典型值**：`dt=0.001`（对应1kHz控制频率）。

#### 11. **T**
- **含义**：总仿真时间，控制仿真运行的时长。
- **作用**：决定观察系统动态的窗口长度。
- **典型值**：`T=20`（秒）。

---

### **五、参数选择建议**
1. **参考模型参数**：
   - 增大 `a0` 会加快参考模型的收敛速度，但需要更大的控制输入。
   - 增大 `a1` 会增强阻尼，抑制参考模型的振荡。

2. **被控对象参数**：
   - `alpha0` 和 `alpha1` 应与实际系统的刚度、阻尼匹配。
   - `beta` 需与执行器（如电机）的力矩增益一致。

3. **控制器参数**：
   - **自适应增益**（`gamma_theta`, `gamma_w`, `gamma_kappa`）：
     - 初始值建议从1.0开始，逐步增大直至系统收敛。
     - 若出现震荡，需减小增益。
   - **鲁棒项参数**（`Fmax`, `delta`）：
     - 若扰动较大，增大 `Fmax`。
     - 若控制输入抖振明显，增大 `delta`。

---

### **六、参数间关系总结**
| **参数类型**       | **关键参数**               | **调整目标**                     |
|--------------------|---------------------------|----------------------------------|
| 参考模型动态        | `a0`, `a1`, `b`          | 定义期望的跟踪性能                |
| 被控对象特性        | `alpha0`, `alpha1`, `beta` | 匹配实际系统的物理特性            |
| 自适应收敛速度      | `gamma_theta`, `gamma_w`  | 平衡收敛速度与稳定性              |
| 抗扰动能力          | `Fmax`, `delta`           | 抑制未建模动态，避免抖振          |
| 仿真精度与效率      | `dt`, `T`                 | 平衡计算精度与实时性              |

通过合理调整这些参数，可以实现高精度的跟踪控制，同时保证系统的鲁棒性。建议初次运行时使用默认值，逐步调整关键参数观察效果。

'''
