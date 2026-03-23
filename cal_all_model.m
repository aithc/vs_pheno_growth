
%%
clear; close all; clc;  % clear the workspace

site_infos = readtable('tr_info_use_sig_matlab.csv');
%length(info)

%% calculate for all sites by loop
for i = 1:height(site_infos)
    sites_name = site_infos.('site')(i);
    lat_n = site_infos.('latitude')(i);
    lon_n = site_infos.('longitude')(i);

    disp(sites_name);
    fitted_file = ['/fitted_vsmodel/output_',sites_name{1},'_',int2str(site_infos.used(i)),'.mat'];
    load(fitted_file);
    tf_1 = output.parameters(1); % minimum temperature (C) for growth
    tf_2 = output.parameters(2);  % growth rate is max in the range T2-T3 (lower optimal temperature, C)
    tf_3 = output.parameters(3);  % growth rate is max in the range T2-T3 (upper optimal temperature, C)
    tf_4 = output.parameters(4);  % maximum temperature (C) for growth

    % Piecewise growth function parameters for soil moisture
    wf_1 = output.parameters(5);  % minimum soil moisture for growth (v/v)
    wf_2 = output.parameters(6);  % the growth rate is max in range W2-W3 (lower optimal soil moisture, v/v)
    wf_3 = output.parameters(7);  % the growth rate is max in range W2-W3 (upper optimal soil moisture, v/v)
    wf_4 = output.parameters(8);  % growth is stopped at this soil moisture (v/v)
      
    SNo = output.parameters(9);  % initial snowpack (mm)

    Wo = output.parameters(10);  % initial soil moisture (v/v)
    % Wmax = parameter(11);  % maximum soil moisture (field capacity, (v/v)
    % Wmin = parameter(12);  % minimum soil moisture (wilting point, v/v)
    rootd = output.parameters(11);  % the root/soil melt depth (mm)

    rated = output.parameters(12);  % the rate of water drainage from soil
    % Pmax = parameter(15);  % maximum rate of infiltration water into soil  (mm/day)

    % interception and transpiration parameters
    % k_1 = parameter(16);  % k1 (1-k1) is the interception precipitation by the tree crown
    % k_2 = parameter(17);  % 1st coefficient for calculation the transpiration
    % k_3 = parameter(18);  % 2nd coefficient for calculation the transpiration

    % soil and snow melting parameters
    % Tm = parameter(13);  % sum of temperature for start soil melting (C)
    a_1 = output.parameters(13);  % 1st coefficient of soil melting
    a_2 = output.parameters(14);  % 2nd coefficient of soil melting
    Tg = output.parameters(15);  % sum of temperature to start growth (C)
    SNr = output.parameters(16);  % the rate of snow melting (mm/C/day)
    % SNmt = parameter(18);  % minimum temperature for snow melting

    % Some switches and variable storage 
    % K_8 = parameter(25);  % Maximum duration (days) of latewood formation
    K_9 = output.parameters(17);  % the period (days) over which to sum temperature to calculate start of growth
    %K_10 = parameter(26);  % the period (days) over which to sum temperature to calculate start soil melting
    
    

    dataset = data_prepare(sites_name{1},1960,2015,lat_n,lon_n);  % get data

    T  = dataset.T;
    Tfil = vsm_filter(T,'V'); % mimic of the lowpass FORTRAN filter used in the FORTRAN version

    T = Tfil; % use the lowpass filtered temperature

    P = dataset.P;
    phi = dataset.lat;
    

    dataset_d = data_prepare_de(sites_name{1},1960,2015,lat_n,lon_n);  % get data

    T_d  = dataset_d.T;

    Tfil_d = vsm_filter(T_d,'V'); % mimic of the lowpass FORTRAN filter used in the FORTRAN version

    T_d = Tfil_d; % use the lowpass filtered temperature

    P_d = dataset_d.P;

    syear = dataset.syear;
    eyear = dataset.eyear;
    chronology = dataset.std;
    

    tic % based on testing, this loop may take anywhere from 1 to 20 seconds, depending on your system
    output = vsm_me(T,P,phi,syear,eyear,tf_1,tf_2,tf_3,tf_4,wf_1,wf_2,wf_3,wf_4,SNo,Wo, ... ,
        rootd,rated,a_1,a_2,Tg,SNr,K_9);
    toc %  
    
    tic % based on testing, this loop may take anywhere from 1 to 20 seconds, depending on your system
    output_de = vsm_me(T_d,P_d,phi,syear,eyear,tf_1,tf_2,tf_3,tf_4,wf_1,wf_2,wf_3,wf_4,SNo,Wo, ... ,
        rootd,rated,a_1,a_2,Tg,SNr,K_9);
    toc %

    tic % based on testing, this loop may take anywhere from 1 to 20 seconds, depending on your system
    output_nopheno = vsm_no_pheno(T,P,phi,syear,eyear,tf_1,tf_2,tf_3,tf_4,wf_1,wf_2,wf_3,wf_4,SNo,Wo, ... ,
    rootd,rated,a_1,a_2,SNr,output_de.fday);
    toc %  


    
    output_file_raw = ['/final_fitted/result_raw',sites_name{1},'.mat'];
    output_file_de = ['/final_fitted/result_de',sites_name{1},'.mat'];
    output_file_np = ['/final_fitted/result_np',sites_name{1},'.mat'];
    
    save(output_file_raw,'output');
    save(output_file_de,'output_de');
    save(output_file_np,'output_nopheno');

    clear output output_de output_nopheno;
end
    


