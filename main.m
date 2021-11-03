%--------------------------------------------------------------------------
% Copyright @ Carlos Hinojosa, 2021
% Matlab Implementation code of the SPIE JARS paper:
% "Hyperspectral image segmentation using 3D regularized subspace
% clustering model" DOI: https://doi.org/10.1117/1.JRS.15.016508
% 
% Webpage: https://carloshinojosa.me/
%--------------------------------------------------------------------------
%% Clear Screen and Workspace
clear all
close all
clc

verbose = true;

%% Choose Architecture
% 1:    GPU Single
% 2:    GPU Double
% 3:    CPU

arch = 3;

%% Add Hyperspectral databases and auxiliary codes to the path
addpath('Data/')
addpath('./Auxiliary Files/');
%% Select and load the database
Fname =  'Indian_subset'; %'Indian_subset' | 'SalinasA' | 'paviaU_subset2';
database = 'Indian_subset';%'Indian_subset' | 'paviaU_subset2' | 'SalinasA'
fprintf(['Experiment start at: ',datestr(datetime('now')),'\n'])
fprintf('=======================================================\n');
fprintf('Loading hyperspectral datacue and preparing data \n');
fprintf('=======================================================\n');
load(database);

switch(Fname)
    
    case 'Indian_subset'
        hyperimg = Indian_subset;
        hyperimg_gt = gt;
        clear gt Indian_subset;
        rho = 1;
        alpha1V = 1400;%200:100:500;
        alpha2V = 300;%800:100:1200;
        
    case 'paviaU_subset2'
        hyperimg = paviaU;
        hyperimg_gt = paviaU_gt;
        alpha1V = 300;
        alpha2V = 1100;
        rho = 0.7;
        clear paviaU paviaU_gt
        
    case 'SalinasA'
        hyperimg = salinasA_corrected(:,1:83,:);
        hyperimg_gt = salinasA_gt(:,1:83);
        clear salinasA_corrected salinasA_gt
        rho = 0.7;
        alpha1V = 300;%200:100:500;
        alpha2V = 1400;%800:100:1200;
        
end
% Settings
[Mc,Nc,L] = size(hyperimg);

s = hyperimg_gt(:)';
s = fix_labels(s);

%% Reshape the data cube to LxMN matrix
Xfull=reshape(hyperimg,Mc*Nc,L);
Xfull=Xfull';

%% Sparse Subspace Clustering parameters

l =  length(unique(s))-1;

r = 0; % data projection
affine = true; % affine constraint
outlier = false; % data has outlier

la =[]; % sparsity/noise tradeoff

%% Hyperparameters tunning

%kernel size
ksV = [3,4,6,8];
% Spatial information regularization parameter
alphassV = 600:100:1000;

for alpha1 = alpha1V
    for alpha2 = alpha2V
        for alphass = alphassV
            for ks=ksV
                
                alpha = [alpha1,alpha2];
                [results,C,img] = CSI_SSC(Xfull,r,affine,alpha,ks,outlier,rho,s,l,la,alphass,Mc,Nc,Fname,arch);
                
                % Recolecting results
                parameters = {C,l,alpha,rho,alphass,ks};
                parameters.cube_size = [Mc,Nc,L];
                
                fprintf(['alphass: ',num2str(alphass),' OA: ',num2str(results.acc_o),'\n']);
                %% Save Results
                dir_save_name = ['Results/',database,'/'];
                if ~exist(dir_save_name, 'dir')
                    mkdir(dir_save_name)
                end
                save([dir_save_name,database,'_alpha1=',num2str(alpha1),'_alpha2=',num2str(alpha2)...
                    ,'_ks=',num2str(ks),'_alphass=',num2str(alphass),'.mat'],'results','parameters');
            end
        end
    end
end