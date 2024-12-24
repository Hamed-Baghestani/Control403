%Soal 3 Tamrin 2
%HamedBaghestani (40116143)
clc;
clear all;
close all;
s=tf('s');

Ts=8/(s^2+4*s+8);
Ts

figure('Name','Soal3','NumberTitle','off');
step(Ts);