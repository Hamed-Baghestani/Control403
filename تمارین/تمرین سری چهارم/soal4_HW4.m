%Hamed Baghestani
%40116143
%soal4
clc;
clear all;
close all;

s=tf('s');
num=-1*conv(conv([1 3],[1 4]),[1 3 2]);
den=[1 100 0 0 0];
 sys=tf(num,den);
display(sys);

figure
grid on
bode(sys);
set(findall(figure(1),'type','line','linewidth',2))
figure
nyquist(sys);
set(findall(figure(2),'type','line','linewidth',2))
grid off