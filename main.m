%MSE 426 Final Project
close all;
clear;
clc;

%% Intialize
%40 fruits and vegs 
n = 40;

x0 = zeros(1,n);
lb = zeros(1,n);
ub(1,1:n) = 20;

A = [];
B = [];

%% run fmin

optionsf = optimoptions('fmincon');
[xoptf,fvalf,exitflagf,outputf] = fmincon(@f,x0,A,B,[],[],lb,ub,@nonlcon,optionsf);
csvwrite('x_fmin.csv',xoptf);
print(xoptf);

%% run GA
optionsg = optimoptions('ga');
optionsg.MaxGenerations = n*50;
[xoptg,fvalg,exitflagg,outputg,populationg,scoresg] = ga(@f,n,A,B,[],[],lb,ub,@nonlcon,optionsg);
csvwrite('x_GA.csv',xoptg);
print(xoptg);

