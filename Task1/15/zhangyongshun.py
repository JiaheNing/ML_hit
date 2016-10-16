# -*- coding: utf-8 -*-
"""
Created on Mon Oct 03 20:21:24 2016

@author: Xiao顺
"""

import numpy as np
import matplotlib.pyplot as plt  

x = np.loadtxt("D:\python_files\q2x.dat",dtype = float).ravel()
y =  np.loadtxt('D:\python_files\q2y.dat',dtype = float).ravel()

o0 = 0.
o1 = 1.
l = 0.00001
lenofdata = float(len(x))
num = 0
plt.show()
plt.plot(x,y,'ro')
plt.xlabel('x')
plt.ylabel('y')

while True:
    Sum1 = Sum2 = 0
    tmp3 = 0
    for i in range(len(x)):
        tmp3 = o1 * x[i] + o0 - y[i]
        Sum1 += tmp3
        Sum2 += tmp3 * x[i]
    tmp1 = o0 - l * 1. / lenofdata * Sum1
    tmp2 = o1 - l * (1. / lenofdata) * Sum2
    print tmp1,o0,tmp2,o1
    if abs(tmp1 - o0) <= 0.0001 and abs(tmp2 - o1) <= 0.0001:
        o0 = tmp1
        o1 = tmp2
        break
    o0 = tmp1
    o1 = tmp2
    plt.plot(x,o1 * x + o0)




