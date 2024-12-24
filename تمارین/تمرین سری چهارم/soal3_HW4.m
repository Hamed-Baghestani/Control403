clc;
clear all;
close all;

s=tf('s');
num =5*(s+1)*exp(-2*s);
num1 =5*(s+1);
den=s*(5*s+1);
sys=num/den;
sys1=num1/den;
display(sys);
display(sys1);

figure
bode(sys);
set(findall(figure(1),'type','line','linewidth',2))
title('bode with exponentioal');
grid on
figure
bode(sys1);
set(findall(figure(1),'type','line','linewidth',2))
title('bode without exponentioal');
grid on
% figure
% nyquist(sys);
% set(findall(figure(2),'type','line','linewidth',2))
% title('nyquist with exponentioal');
% figure
% nyquist(sys1);
% set(findall(figure(2),'type','line','linewidth',2))
% title('nyquist without exponentioal');
% grid on