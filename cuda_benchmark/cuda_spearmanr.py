import cupy as cp
from scipy.stats import spearmanr
import pandas as pd
import numpy as np
import cupyx

print( cupyx.get_runtime_info() )


arr_nums = [128, 256, 512, 1024, 2048, 4096, 8192]
arr_sizes = [256, 512, 1024, 2048, 4096, 8192]

cp.random.seed(42)

arr_num = arr_nums[6]
# arr_num = 16
arr_size = arr_sizes[3]
min_val = 0
max_val = 2**16- 1
random_arr = cp.random.randint(min_val, max_val, size=(arr_num, arr_size))
print("random_arr device: ", random_arr.device)

def rankdata(x):
    y = cp.argsort(cp.argsort(x, axis=0), axis=0)
    ranks = y + 1
    return ranks

def spearmanr_cuda(x):
    # Calculate rank of each column
    rank_x = cp.apply_along_axis(rankdata, 0, x)
    
    # Calculate difference between ranks
    diff = rank_x - cp.mean(rank_x, axis=0)
    
    # Calculate sum of squared differences
    sum_diff = cp.sum(cp.square(diff), axis=0)
    
    # Calculate Spearman correlation coefficient matrix
    n = x.shape[0]
    spearmanr_matrix = 1.0 - (6.0 * sum_diff) / (n * (n*n - 1.0))
    
    return spearmanr_matrix

# 初始化spearmenr_cuda结果数组
spearmanr_res_cuda = cp.zeros((arr_num, arr_num))
print("\nstart spearman cuda")
# pandas时间戳计时
start = pd.Timestamp.now()
spearmanr_res_cuda = spearmanr_cuda(random_arr.T)
end = pd.Timestamp.now()
print("res shape: ", spearmanr_res_cuda.shape)
print("Spearman cuda time cost: ", end - start)
print()


random_arr2 = np.random.randint(min_val, max_val, size=(arr_num, arr_size))
# 初始化spearmenr_numpy结果数组
spearmanr_res_numpy = np.zeros((arr_num, arr_num))
print("start spearman numpy")
# pandas时间戳计时
start = pd.Timestamp.now()
a = spearmanr(random_arr2.T)
end = pd.Timestamp.now()
# print("res shape: ", spearmanr_res_numpy.shape)
print("spearmanr cpu:", a.statistic.shape)
print("Spearman numpy time cost: ", end - start)