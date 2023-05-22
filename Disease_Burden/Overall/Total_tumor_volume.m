%% Clear previous variables
clc;
clear;
close all;


%% Data path

load tumor_vol_by_sites

for i=1:size(table_data,1)

      sum_row = sum(table_data(i,2:end));
      sum_vol(i,1)=i;
      sum_vol(i,2)=sum_row;

end
save total_volume_per_patient sum_vol


%% Get the list of patients






