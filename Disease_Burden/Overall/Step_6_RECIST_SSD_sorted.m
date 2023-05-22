%% Clear previous variables
clc;
clear;
close all;


%% Data path
data_path = [pwd '\Tumors_by_sites'];

%% New modules path
tumor_list{1}='Adrenal';
tumor_list{2}='Bone';
tumor_list{3}='Bowel';
tumor_list{4}='IL';
tumor_list{5}='Kidney';
tumor_list{6}='Liver';
tumor_list{7}='LN';
tumor_list{8}='Pancreas';
tumor_list{9}='Pleural';
tumor_list{10}='Primary';
tumor_list{11}='Soft tissue';
tumor_list{12}='Spleen';


for scanid = 1 : 1298
    fprintf('Processing Patient_%04d....\n', scanid);
    num=1;
    ct=1;
    %% seeking each patient in every met sites
    for j=1:size(tumor_list,2)
    ct=1;  
    feature_path=[data_path '\' tumor_list{j}];
    [ipath_tumor,scanid_tumor,filename_tumor]=fn_scanid_burden(feature_path);
    idx = find(scanid_tumor==scanid);
        if numel(idx)> 0
            load(ipath_tumor{idx});
                for k=1:size(feat_vec,1)
                patient_data{num,1}=feat_vec(k,4); % Shortest Dim
                patient_data{num,2}=tumor_list{j};
                num=num+1;
                end
        end
        

    end
    
    %% sorting descending    
    if num==1 % means it never reach line 35 to 39
    patient_data{num,1}=0;
    patient_data{num,2}='none';
    
    tab_data{scanid,1}=scanid;
    tab_data{scanid,2}=patient_data{:,1}; % sum of LD
    %table_data{scanid,3}=patient_data{:,2}; % sites
    
   
    else
    sorted_cell= sortrows(patient_data,'descend');
    site_temp=sorted_cell(:,2);
    site=cell(0);
    % check max 2 organs allowed in the final sorted_cell
    for k=1:size(site_temp,1)
        
        curr_site = sorted_cell(k,2);
        curr_site = char(curr_site);
        site{k,1}=curr_site;
            if k>1 % skip first data
                A = count(site,curr_site);
            else
                A=0;
            end
            
        if sum(A==1)>2
            continue  % if lesion site occured more than twice, skip this data, take the next one
        else
            LD_temp(ct,1) = sorted_cell(k,1);
            ct = ct+1;
        end
        
    end
            % Max number of lesion is only 5
            if size(LD_temp,1)<6
                sum_LD = sum(cell2mat(LD_temp));
                tab_data{scanid,1}=scanid;
                tab_data{scanid,2}=sum_LD; % sum of LD
            else
                LD_temp = LD_temp(1:5,:);
                sum_LD = sum(cell2mat(LD_temp));
                tab_data{scanid,1}=scanid;
                tab_data{scanid,2}=sum_LD; % sum of LD
            end
            
         

    
    end
    

end

save RECIST_SSD tab_data