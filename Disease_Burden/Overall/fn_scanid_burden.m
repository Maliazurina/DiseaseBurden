function [ipath_list,scanid_list,filename_list]=fn_scanid_burden(path_data)


%dirlist = dir([path_data '/136*']); % dirlist = 13614193285030022, ..
dirlist = dir(path_data); 
dirlist=dirlist(~ismember({dirlist.name},{'.','..'}));   % clear the first two unwanted parent folders

dirnum = size(dirlist,1); 

ipath_list = cell(0); 
scanid_list= zeros(dirnum,1);
filename_list = cell(0);

j = 1;


%% get directory list

for idx = 1:dirnum
    %TODO: Change to correct name
    ipath = [path_data '\' dirlist(idx).name];
    file_name = dirlist(idx).name;
   % scanid=dirlist(idx).name(1:4);
    %scanid=str2num(dirlist(idx).name(4:7));
     scanid=str2num(dirlist(idx).name(1:4));
    scanid_list(idx)=scanid;
    filename_list{idx} = file_name;
    ipath_list{idx}=ipath;
    
    

   
    
end
