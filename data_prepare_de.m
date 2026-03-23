%%  detrend climate and simulate

function data = data_prepare_de(site,syear,eyear,lat,lon)
file_path = 'D:/matlab_file/vs_model_for_spr_try/to_linux/climate_crujra_de/';
clim_data =readmatrix([file_path,site,'.csv']);

T = NaN(366,eyear - syear + 1);
P = NaN(366,eyear - syear + 1);

years = syear:eyear;
for i = 1:length(syear:eyear)
    temp = clim_data(:,2);
    prec = clim_data(:,3);
    temp_year = temp(clim_data(:,4) == years(i));
    prec_year = prec(clim_data(:,4) == years(i));
    if length(temp_year) == 365
        T(1:365,i) = temp_year;
        P(1:365,i) = prec_year;
    else
        T(:,i) = temp_year;
        P(:,i) = prec_year;
    end
end

std_actual_path = 'D:/matlab_file/vs_model_for_spr_try/to_linux/std_data/';
std_file = readmatrix([std_actual_path,site,'.csv']);
std_use1 = std_file(:,1:2);
std_use = std_use1(std_file(:,1) >= syear & std_file(:,1)<= eyear,:);

data.T = T;
data.P = P;
data.syear = syear;
data.eyear = eyear;
data.lat = lat;
data.lon = lon;
data.std = std_use;

end

