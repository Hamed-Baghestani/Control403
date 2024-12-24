%Soal 1 Tamrin 2
%Hamed Baghestani (40116143)

clc;
clear all;
close all;

k=1.58;
Wn=11.348;
zeta=0.25;

s=tf('s');

figure('Name','Soal1','NumberTitle','off');
% open Loop transfer function
subplot(2,1,1);
Ls= (k*Wn^2)/(s^2+2*zeta*Wn*s+(1-k)*Wn^2);
step(Ls);
title('open Loop transfer function');

%closed loop transfer function
subplot(2,1,2);
Ts= (k*Wn^2)/(s^2+2*zeta*Wn*s+Wn^2);
step(Ts);
title('closed Loop transfer function');


