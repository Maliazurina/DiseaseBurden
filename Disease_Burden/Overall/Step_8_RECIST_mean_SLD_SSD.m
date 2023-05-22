%% Clear previous variables
clc;
clear;
close all;

load RECIST_SLD
sum_LD = tab_data;
load RECIST_SSD
sum_SD = tab_data;

clear tab_data

for scanid = 1 : 1298
    fprintf('Processing Patient_%04d....\n', scanid);
    LD = sum_LD(scanid,2);
    LD = cell2mat(LD);
    SD = sum_SD(scanid,2);
    SD= cell2mat(SD);
    
    RECIST1_1=(LD + SD)/2;
    
    table_data(scanid,1)=scanid;
    table_data(scanid,2)=RECIST1_1;
    
end
save RECIST_SMean table_data