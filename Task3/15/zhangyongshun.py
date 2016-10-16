# -*- coding: utf-8 -*-
"""
Created on Mon Oct 03 20:21:24 2016

@author: Xiao顺
"""

import numpy as np
import matplotlib.pyplot as plt  

x = np.mat(np.loadtxt("D:\python_files\q1x.dat",dtype = float))
y =  np.mat(np.loadtxt('D:\python_files\q1y.dat',dtype = float).ravel()).T
col = np.size(x,0);
tmp = np.mat(np.ones(col)).T;
x = np.bmat("tmp x")

for i in range(0,col):
    tmp = 'ro' if int(y[i,0])  else 'r+'
    plt.plot(x[i,1],x[i,2],tmp)


theta = np.mat(np.ones(3).reshape(3,1))
alf = 1

while True:
    h = 1. / (1 + np.exp(-x * theta))
    tmp_theta = theta - (1. / col) * alf * x.T * (h - y)
    if abs(sum(tmp_theta - theta)) <= 0.1:
        theta = tmp_theta
        break
    theta = tmp_theta

X= [int(min(x[:,1]) - 3) ,int(max(x[:,1]) + 3)]
Y = [-1. / theta[2,0] * (theta[1,0] * X[0] + theta[0,0]),-1. / theta[2] * (theta[1] * X[1] + theta[0])]
plt.plot(X,Y)

plt.title('ZhaangYongShun Task3')



  