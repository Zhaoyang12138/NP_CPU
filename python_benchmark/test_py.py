import numpy as np
import pandas as pd
from scipy.stats import spearmanr, mannwhitneyu, wilcoxon, friedmanchisquare, kruskal
from ManWhitneyu_ import ManWhitneyu
from Wilconxon_ import Wilcoxon
from Friedman_ import Friedman
from Kruskal_ import Kruskal
from Kendall_ import Kendall
from Brown_ import Brown
from Spearman_ import spearman
from KendallW_ import KendallW

arr_nums = [128, 256, 512, 1024, 2048, 4096, 8192]
arr_sizes = [256, 512, 1024, 2048, 4096]

# 设置随机种子
np.random.seed(42)
# 设置数组大小
arr_num = arr_nums[6]
arr_size = arr_sizes[4]
# 初始化一个随机数组
# min_val = 0
max_val = 2**32 - 1
# random_arr = np.random.rand(min_val, max_val, size=(arr_num, arr_size), dtype=np.float32)
random_arr = np.random.rand(arr_num, arr_size) * max_val
random_arr = random_arr.astype(np.float32)
print(arr_num, arr_size)
print(random_arr.shape)

# # kendall检验
# Kendall(random_arr)
print()

# spearman检验
spearman(random_arr)
print()

# wilcoxon检验
Wilcoxon(random_arr)
print()

# Friedman检验
Friedman(random_arr)
print()

# Mann检验
ManWhitneyu(random_arr)
print()

# Kruskal检验
Kruskal(random_arr)
print()

# BrownForsythe检验
Brown(random_arr)
print()

# KendallW检验
# KendallW(random_arr)
