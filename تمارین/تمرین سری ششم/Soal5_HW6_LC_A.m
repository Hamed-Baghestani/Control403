clc;
clear all;
close all;

s=tf('s');
Cs1=0.08033*s+0.02663;
Cs2=0.085922*s+0.0601;
num=Cs1*200;
num1=Cs2*200;
%num1 =5*(s+1);
den=s*(s+1)*(s+10);
sys=num/den;
sys1=num1/den;
%sys1=num1/den;
disp('Open loop with Controller (0.08033s + 0.02663): ');
sys
disp('Open loop with Controller (0.07165s + 0.02376): ');
sys1
%display(sys1);
Csys1=sys/(1+sys);
Csys2=sys1/(1+sys1);
disp('Closed loop with Controller (0.08033s + 0.02663): ');
Csys1
disp('Closed loop with Controller (0.07165s + 0.02376): ');
Csys2

figure
step(Csys1);
title('Pasokh pele ba Controler (0.08033s+0.02663)');

figure
step(Csys2)
title('Pasokh pele ba Controler (0.07165s+0.02376)');


% figure
% bode(sys);
% set(findall(figure(1),'type','line','linewidth',2))
% title('bode with exponentioal');
% margin(sys), grid
% set(findall(figure(1),'type','line'),'linewidth',2)
% grid on

%figure
%bode(sys1);
%set(findall(figure(1),'type','line','linewidth',2))
%title('bode without exponentioal');
%grid on
% figure
% nyquist(sys);
% set(findall(figure(2),'type','line','linewidth',2))
% title('nyquist with exponentioal');
% figure
% nyquist(sys1);
% set(findall(figure(2),'type','line','linewidth',2))
% title('nyquist without exponentioal');
% grid on