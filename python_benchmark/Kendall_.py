from scipy.stats import kendalltau
import numpy as np
import pandas as pd

def Kendall(random_arr):
    arr_num = random_arr.shape[0]

    # pandas时间戳计时
    print("Start kendalltau test...")
    kendalltau_res = np.zeros((arr_num, arr_num))
    start = pd.Timestamp.now()
    for i in range(arr_num):
        for j in range(i+1,arr_num):
            kendalltau_res[i, j] = kendalltau(random_arr[i], random_arr[j])[0]
            kendalltau_res[j, i] = kendalltau_res[i, j]
    end = pd.Timestamp.now() 
    print('kendalltau shape: ', kendalltau_res.shape)
    print('kendalltau time cost: ', end - start)