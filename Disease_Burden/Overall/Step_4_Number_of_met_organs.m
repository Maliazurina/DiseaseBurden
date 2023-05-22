%% Clear previous variables
clc;
clear;
close all;

% inner lung (4) and primary (10) consider one organ
tumor_list{1}='Adrenal';
tumor_list{2}='Bone';
tumor_list{3}='Bowel';
tumor_list{4}='IL';  % 5 in table data
tumor_list{5}='Kidney';
tumor_list{6}='Liver';
tumor_list{7}='LN';
tumor_list{8}='Pancreas';
tumor_list{9}='Pleural';
tumor_list{10}='Primary'; % 11 in table_data
tumor_list{11}='Soft tissue';
tumor_list{12}='Spleen';

%% Data path

load tumor_counts_by_organs

% turn values to be all ones
scanid = table_data(:,1);
table_data = table_data(:,2:end);

table_data(table_data ~= 0) = 1;

for i=1:size(table_data,1)

      sum_row = sum(table_data(i,2:end));
      % check if both IL and Plrimary ones == means they countd twice as
      % different organs
      if table_data(i,4) + table_data(i,10) > 1
          sum_row = sum_row-1;
      end
      
      organ_involved(i,1)=i;
      organ_involved(i,2)=sum_row;

end
save NMO organ_involved


%% Get the list of patients






