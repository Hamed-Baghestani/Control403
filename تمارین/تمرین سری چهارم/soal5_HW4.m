%Hamed Baghestani
%40116143
%soal4clc;
clear all;
close all;

num=0.1*[1 10];
den=[0.1 10];
sys=tf(num,den);
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