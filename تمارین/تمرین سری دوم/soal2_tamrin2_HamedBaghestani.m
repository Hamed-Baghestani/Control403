%Soal 2 Tamrin 2
%HamedBaghestani (40116143)
clc;
clear all;
close all;
s=tf('s');

LS=0.4/(s+0.4);
TS=0.4/(s+0.8);

figure('Name','Soal2','NumberTitle','off');
hold on;
step(LS,25);
step(TS,25);
legend;

stepinfo(LS)
stepinfo(TS)

damp(LS)
damp(TS)