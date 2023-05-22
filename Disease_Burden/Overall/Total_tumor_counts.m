%% Clear previous variables
clc;
clear;
close all;


%% Data path

load tumor_counts_by_organs

for i=1:size(table_data,1)

      sum_row = sum(table_data(i,2:end));
      sum_count(i,1)=i;
      sum_count(i,2)=sum_row;

end
save tumor_counts_all sum_count


%% Get the list of patients






