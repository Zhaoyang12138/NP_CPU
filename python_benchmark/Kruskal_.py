import numpy as np
import pandas as pd
from scipy.stats import kruskal

def Kruskal(random_arr):
    arr_num = random_arr.shape[0]
    arr_size = random_arr.shape[1]
    kruskal_res = np.zeros(int(arr_num/2))

    print("Start Kruskal test...")
    start = pd.Timestamp.now()
    for i in range (0,arr_num-2,2):
        # 将两个样本的数据合并成一个数组，并添加一个指示变量
        data = np.concatenate([random_arr[i], random_arr[i+1]])
        groups = np.concatenate([np.zeros(arr_size), np.ones(arr_size)])
        # 进行Kruskal-Wallis检验
        kruskal_res[int(i/2)] = kruskal(*[data[groups == k] for k in np.unique(groups)])[0]
    print("Kruskal shape:", kruskal_res.shape)
    end = pd.Timestamp.now()
    print('Kruskal time cost: ', end - start)