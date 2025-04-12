from setuptools import setup
import os
from glob import glob

package_name = 'rl_control'

setup(
    name=package_name,
    version='0.0.0',
    packages=[package_name],
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
        (os.path.join('share', package_name, 'launch'), glob('launch/*.launch.py')),
        (os.path.join('share', package_name, 'config'), glob('config/*.yaml')),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='your_name',
    maintainer_email='your_email@example.com',
    description='A brief description of your package',
    license='Your license',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            # Add your executable scripts here
            # 'your_script_name = rl_control.your_script_module:main',
        ],
    },
)

