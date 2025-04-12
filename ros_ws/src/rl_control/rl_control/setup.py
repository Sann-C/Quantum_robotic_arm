from setuptools import setup, find_packages

package_name = 'rl_control'

setup(
    name=package_name,
    version='0.0.0',
    packages=find_packages(exclude=['test']),
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
    ],
    install_requires=[
        'setuptools',
        'rclpy',
        'sensor_msgs',
        'pennylane',
        'torch',
        'stable_baselines3'
    ],
    zip_safe=True,
    maintainer='sann',
    maintainer_email='sann@todo.todo',
    description='Hybrid quantum - classical RL package',
    license='MIT',  # 替换为你实际使用的许可证
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'run_hybrid_rl = rl_control.src.hybrid_rl:main'  # 如果 hybrid_rl.py 中有 main 函数
        ],
    },
)

