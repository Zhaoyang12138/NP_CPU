from scipy.stats import friedmanchisquare
import numpy as np
import pandas as pd

def Friedman(random_arr):
    friedman_res = 0
    # pandas时间戳计时
    print("Start Friedman test...")
    start = pd.Timestamp.now()
    friedman_res = friedmanchisquare(*random_arr)[0]
    end = pd.Timestamp.now()
    print('Friedman time cost: ', end - start) 