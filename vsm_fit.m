%% define the object function for GA

function r_n = vsm_fit(parameter)

tf_1 = parameter(1); % minimum temperature (C) for growth
tf_2 = parameter(2);  % growth rate is max in the range T2-T3 (lower optimal temperature, C)
tf_3 = parameter(3);  % growth rate is max in the range T2-T3 (upper optimal temperature, C)
tf_4 = parameter(4);  % maximum temperature (C) for growth

% Piecewise growth function parameters for soil moisture
wf_1 = parameter(5);  % minimum soil moisture for growth (v/v)
wf_2 = parameter(6);  % the growth rate is max in range W2-W3 (lower optimal soil moisture, v/v)
wf_3 = parameter(7);  % the growth rate is max in range W2-W3 (upper optimal soil moisture, v/v)
wf_4 = parameter(8);  % growth is stopped at this soil moisture (v/v)
      
SNo = parameter(9);  % initial snowpack (mm)

Wo = parameter(10);  % initial soil moisture (v/v)
% Wmax = parameter(11);  % maximum soil moisture (field capacity, (v/v)
% Wmin = parameter(12);  % minimum soil moisture (wilting point, v/v)
rootd = parameter(11);  % the root/soil melt depth (mm)

rated = parameter(12);  % the rate of water drainage from soil
% Pmax = parameter(15);  % maximum rate of infiltration water into soil  (mm/day)

% interception and transpiration parameters
% k_1 = parameter(16);  % k1 (1-k1) is the interception precipitation by the tree crown
% k_2 = parameter(17);  % 1st coefficient for calculation the transpiration
% k_3 = parameter(18);  % 2nd coefficient for calculation the transpiration

% soil and snow melting parameters
% Tm = parameter(13);  % sum of temperature for start soil melting (C)
a_1 = parameter(13);  % 1st coefficient of soil melting
a_2 = parameter(14);  % 2nd coefficient of soil melting
Tg = parameter(15);  % sum of temperature to start growth (C)
SNr = parameter(16);  % the rate of snow melting (mm/C/day)
% SNmt = parameter(18);  % minimum temperature for snow melting

% Some switches and variable storage 
% K_8 = parameter(25);  % Maximum duration (days) of latewood formation
K_9 = parameter(17);  % the period (days) over which to sum temperature to calculate start of growth
%K_10 = parameter(26);  % the period (days) over which to sum temperature to calculate start soil melting


% Growth rate parameters
%b_1 = parameter(27);  % the critical growth rate (Vcr or Vs)
%b_4 = parameter(28);  % %he correction of growth rate (Gr*b(4))
%b_5 = parameter(29);  % The correction of Vo(j*b(5)) and Vmin(j*b(5))
%b_6 = parameter(30);  % Vo(j)= b(6)*j+b(7)
%b_7 = parameter(31);  % b(7) and b(6) determine the fuction Vo(j)
%b_8 = parameter(32);  % Vmin(j)=(EXP((b(8)+j)*0.4)-5.0)*b(9)
%b_9 = parameter(33);  % b(8) and b(9) determine the fuction Vmin(j)
%b_10 = parameter(34);  % The growth rate in the S, G2 & M phases 
%b_11 = parameter(35);  % The maximum size of a cell in the G1 phase (SIG1)
% b_12 = parameter(37);  % The maximum size of a cell in the S phase
% b_13 = parameter(38);  % The maximum size of a cell in the G2 phase
% b_14 = parameter(36);  % The maximum size of a cell in the M phase (SIM)

dataset = data_prepare('wy072',1960,1990,44.914,-109.573);  % get data

T  = dataset.T;
%T = T + 0.5;

Tfil = vsm_filter(T,'V'); % mimic of the lowpass FORTRAN filter used in the FORTRAN version

T = Tfil; % use the lowpass filtered temperature

P = dataset.P;
phi = dataset.lat;
syear = dataset.syear;
eyear = dataset.eyear;
chronology = dataset.std;

tic % based on testing, this loop may take anywhere from 1 to 20 seconds, depending on your system
output = vsm_me(T,P,phi,syear,eyear,tf_1,tf_2,tf_3,tf_4,wf_1,wf_2,wf_3,wf_4,SNo,Wo, ... ,
    rootd,rated,a_1,a_2,Tg,SNr,K_9);
toc %  

% calculate correlation between actual chronology and simulated
z_trw = zscore(output.trw');
[Ro] = corrcoef([chronology(:,2) z_trw]);
r_n = -Ro(1,2);

end




