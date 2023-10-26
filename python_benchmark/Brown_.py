import numpy as np
import pandas as pd
from scipy.stats import levene

def Brown(random_arr):
    arr_num = random_arr.shape[0]
    bf_res = np.zeros(int(arr_num/2))

    print("Start Brown test...")
    start = pd.Timestamp.now()
    for i in range(0,arr_num-2,2):
        f_statistic, p_value = levene(random_arr[i], random_arr[i+1], center='median')
        bf_res[int(i/2)] = p_value
    end = pd.Timestamp.now()
    print('Brown shape: ', bf_res.shape)
    print('Brown time cost: ', end - start)
