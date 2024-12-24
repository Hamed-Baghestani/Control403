clc;
clear all;
close all;

num = [1 3];
den = [1 13 54 82 60 0];
sys=tf(num,den);
rlocus(sys);
hold on
rlocus(-sys,'--');
set(findall(figure(1),'type','line') , 'linewidth', 2);
hold off

grid on
