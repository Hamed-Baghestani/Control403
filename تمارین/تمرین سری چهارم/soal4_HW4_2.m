clc;
clear all;
close all;
s=tf('s');
num=-1*conv(conv(conv([i 3],[i 4]),[-1 3*i 2]),[1 100*i 0 0 0]);
den=[1];
sys = tf(num,den);

w=0.842;
% w=6.134;

y=(-1*w^5 -965*w^3 +4976*w)/(w^5 + 10000*w^3)
% y=-i*(90*w^4 -3450*w^2 +2400)/(w^5 + 10000*w^3)
% y=w^2+2*w+1