%% detrend climate

load('049632_input.mat');

T(1,:);

t_daily = T(:);


plot(t_daily);

file_path = '/home/aithc/data/phd/data/daymet/ak153-noaa.csv';
climate_data = importdata(file_path);
clim_data = climate_data.data;


plot(clim_data(:,6));

lin = polyfit(1:14965,clim_data(:,6),1);

yy = polyval(lin, 1:14965);

hold on
plot(1:14965, clim_data(:,6));
plot(1:14965, yy);

t_daily = t_daily(~ismissing(t_daily));

daily = 1:8036;

lin2 = polyfit(daily, t_daily,1);

t_daily_y = polyval(lin2, daily);

hold on
plot(daily, t_daily);
plot(daily, t_daily_y);

hold on
plot(t_daily,'r');
plot(detrend(t_daily));

hold on
plot(clim_data(:,6),'r');
plot(detrend(clim_data(:,6))+3.89888020323283,'b');

lin3 = polyfit(1:14965, detrend(clim_data(:,6)),1);

