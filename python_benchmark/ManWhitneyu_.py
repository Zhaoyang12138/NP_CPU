import pandas as pd
from scipy.stats import mannwhitneyu
import numpy as np

def ManWhitneyu(random_arr):
    arr_num = random_arr.shape[0]

    mannwhitneyu_res = np.zeros(int(arr_num/2))

    # pandas时间戳计时
    print("Start Mannwhitneyu test...")
    start = pd.Timestamp.now()
    for i in range (0,arr_num-2,2):
        mannwhitneyu_res[int(i/2)] = mannwhitneyu(random_arr[i], random_arr[i+1])[0]
    end = pd.Timestamp.now()
    print('Mannwhitneyu shape: ', mannwhitneyu_res.shape)
    print('Mannwhitneyu time cost: ', end - start)