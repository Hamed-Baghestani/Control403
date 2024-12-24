clc;
clear all;
close all;

% s=tf('s');
% num=-1*conv(conv([1 3],[1 4]),[1 3 2]);
% num=conv([1 1],[1 1]);
num=0.1*[1 10];
% num =(s+1)*exp(-8*s);
% den=conv(conv([1 2],[1 10]),[1 -4 4]);
% den=conv([1 4 5 2],[1 0 9]);
den=[0.1 10];
% den=(s+10);
sys=tf(num,den);
% sys=num/den;
display(sys);

figure
bode(sys);
set(findall(figure(1),'type','line','linewidth',2))
xlim([0.1 10000]);
grid on
figure
nyquist(sys);
set(findall(figure(2),'type','line','linewidth',2))
grid on
% grid off