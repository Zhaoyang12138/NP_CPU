import pandas as pd
# from scipy.stats import 
import numpy as np
import kendall_w as kw

def KendallW(random_arr):
    print("start KendallW community")
    # pandas时间戳计时
    start = pd.Timestamp.now()
    a = kw.compute_w(random_arr.T)
    end = pd.Timestamp.now()
    print("KendallW community:", a)
    print("KendallW community time cost: ", end - start)