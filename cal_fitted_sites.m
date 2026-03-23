%% calculate all fitted sites from 1980-2020

%%
clear; close all; clc;  % clear the workspace

%% read all sites informations
[info,sites] = xlsread('D:/matlab_file/vs_fitted/tr_fitted_result_2.xlsx');
%length(info)
sites = sites(2:139,:);

%% calculate for all sites by loop
for i = 1:length(info)
    sites_name = sites(i,1);
    sites_name = sites_name{1,1};
    sites_name = strsplit(sites_name,'-');
    sites_name = sites_name{1,1};
    
    disp(sites_name);
    fitted_file = ['D:/matlab_file/vs_fitted/output_',sites_name,'.mat'];
    load(fitted_file);
    tf_1 = output.parameters(1);
    tf_2 = output.parameters(2);
    tf_3 = output.parameters(3);
    tf_4 = output.parameters(4);
    wf_1 = output.parameters(5);
    wf_2 = output.parameters(6);
    wf_3 = output.parameters(7);
    wf_4 = output.parameters(8);
    SNo = output.parameters(9);
    Wo = output.parameters(10);
    Wmax = output.parameters(11);
    Wmin = output.parameters(12);
    rootd = output.parameters(13);
    rated = output.parameters(14);
    Pmax = output.parameters(15);
    k_1 = output.parameters(16);
    k_2 = output.parameters(17);
    k_3 = output.parameters(18);
    Tm = output.parameters(19);
    a_1 = output.parameters(20);
    a_2= output.parameters(21);
    Tg = output.parameters(22);
    SNr = output.parameters(23);
    SNmt = output.parameters(24);
    
    dataset = data_prepare(sites_name,1980,2020,info(i,1),info(i,2));  % get data

    T  = dataset.T;
    Tfil = vsm_filter(T,'V'); % mimic of the lowpass FORTRAN filter used in the FORTRAN version

    T = Tfil; % use the lowpass filtered temperature

    P = dataset.P;
    phi = dataset.lat;

    fit_result = vsm_me(T,P,phi,1980,2020,tf_1,tf_2,tf_3,tf_4,wf_1,wf_2,wf_3,wf_4,SNo,Wo,Wmax,Wmin, ... ,
        rootd,rated,Pmax,k_1,k_2,k_3,Tm,a_1,a_2,Tg,SNr,SNmt);
    
    title = {'year','trw','fday','sday','eday'};
    year_range = 1980:2020;
    result_table = table(year_range',fit_result.trw',fit_result.fday',fit_result.startDay',fit_result.endDay','VariableNames',title);
    
    output_file = ['D:/matlab_file/vs_fitted/result_',sites_name,'.csv'];
    writetable(result_table,output_file);
    clear output;
end
    
    
    
    