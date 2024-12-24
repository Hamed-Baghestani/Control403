clc;
clear all;
close all;

num = [1 1];
den = [1 4 5 0];
sys=tf(num,den);
rlocus(sys);
hold on
rlocus(-sys,'--');
set(findall(figure(1),'type','line') , 'linewidth', 2);
hold off

