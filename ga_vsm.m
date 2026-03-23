%% using GA to choose parameters

clear; close all; clc;  % clear the workspace

par_range = csvread('par_range.csv');

par_low = par_range(:,1);
par_high = par_range(:,2);
intcon = 17;
A = [];
b = [];
Aeq = [];
beq = [];
nonlcon = [];

fitness = @vsm_fit;

nvars = 17; 
%options = optimoptions('ga','PlotFcn',@gaplotbestf);

[x_best,fval,flag,output] = ga(fitness,nvars,A,b,Aeq,beq,par_low,par_high, nonlcon, intcon);

disp('3 over')
%options = optimoptions('particleswarm','MinNeighborsFraction',1,'PlotFcn',@pswplotbestf);
%options.SwarmSize = 400;
%options.HybridFcn = @fmincon;

%[x_best,fval,flag,output] = particleswarm(fitness,nvars,par_low,par_high,options);

