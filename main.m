%MSE 426 Final Project
close all;
clear;
clc;

%% Intialize
%40 fruits and vegs 
n = 40;

x0 = zeros(1,n);
lb = zeros(1,n);
ub = [];
%ub(1,1:n) = 20;

A = [];
B = [];

%% run fmin

optionsf = optimoptions('fmincon');
optionsf.MaxFunctionEvaluations = 10000;

[xoptF1,fval,exitflag,output] = fmincon(@f,x0,A,B,[],[],lb,ub,@nonlcon,optionsf);
print(xoptF1);

%% run GA

% [xoptGA,fval,exitflag,output,population,scores] = ga(@f,n,A,B,[],[],lb,ub,@nonlcon);
% print(xoptGA);

