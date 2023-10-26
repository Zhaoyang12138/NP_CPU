import pandas as pd
from scipy.stats import wilcoxon
import numpy as np

def Wilcoxon(random_arr):
    arr_num = random_arr.shape[0]

    wilcoxon_res = np.zeros(int(arr_num/2))

    # pandas时间戳计时
    print("Start Wilcoxon test...")
    start = pd.Timestamp.now()
    for i in range (0,arr_num-2,2):
        wilcoxon_res[int(i/2)] = wilcoxon(random_arr[i], random_arr[i+1])[0]
    end = pd.Timestamp.now() 
    print('wilcoxon shape: ', wilcoxon_res.shape)
    print('wilcoxon time cost: ', end - start)
