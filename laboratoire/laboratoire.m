clc
clear all

m  = 10;
g  = 9.81;
x0 = -0.5;
k1 = 500;
k3 = 200;

xeq_nl = roots([k3, 0, k1, -m * g])(3)
