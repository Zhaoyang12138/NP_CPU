from scipy.stats import spearmanr
import pandas as pd
import numpy as np

def spearman(random_arr):
    print("start spearman numpy")
    # pandas时间戳计时
    start = pd.Timestamp.now()
    a = spearmanr(random_arr.T)
    end = pd.Timestamp.now()
    # print("res shape: ", spearmanr_res_numpy.shape)
    print("spearmanr cpu:", a.statistic.shape)
    print("Spearman numpy time cost: ", end - start)