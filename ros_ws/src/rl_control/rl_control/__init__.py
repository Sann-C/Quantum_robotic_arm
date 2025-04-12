import logging

# 配置日志记录器
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# 记录包被导入的信息
logger.info("rl_control 包已导入")

# 导入子模块中的类或函数
from .src.hybrid_rl import QuantumCritic

__all__ = ['QuantumCritic']

