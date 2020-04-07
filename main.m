%--------------------------------------------------------------------------
% Copyright @ Carlos Hinojosa, 2018
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

arch = 1;

%% Add Hyperspectral databases and auxiliary codes to the path
addpath('Data/')
addpath('./Auxiliary Files/');
%% Select and load the database
Fname =  'SalinasA';%'Indian_subset';
database = 'SalinasA';%'Indian_subset';
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
        
        
    case 'zurich'
        hyperimg = double(IMe(511:660,395:544,:));
        hyperimg_gt = GT(511:660,395:544);%GT(421:670,401:650);
        clear IMe GT
        
    case 'paviaU_subset3'
        alpha1V = 300;%200:100:500;
        alpha2V = 1100;%800:100:1200;
        rho = 0.7;
    
    case 'pavia6'
        alpha1V = 300;%200:100:500;
        alpha2V = 1100;%800:100:1200;
        rho = 0.7;
        
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

%% Normalization
%Xfull = Xfull - mean(Xfull(:));
%Xfull = Xfull./std(Xfull(:));

%% Sparse Subspace Clustering parameters

l =  length(unique(s))-1;

% Original SSC parameters
%alpha = [1100,300];
r = 0; % data projection
affine = true; % affine constraint
outlier = false; % data has outlier

la =[]; % sparsity/noise tradeoff



%% Compressive Spectral Imaging (CSI) acquisition
fprintf('Acquiring compressed measurements \n');
fprintf('=======================================================\n');

%kernel size
ksV = [0.5,1.5,3,4,6,8]; %3.1:0.1:4;%[3,4,6,8];
% Spatial information regularization parameter

alphassV = 600:100:1000;%[0.13 1.3 13 100:200:3000];

%% Compressed Sparse Subspace Clustering With Spatial Regularizer
for alpha1 = alpha1V
    for alpha2 = alpha2V
        for alphass = alphassV
            for ks=ksV
                
                alpha = [alpha1,alpha2];
                [results,C,img] = CSI_SSC(Xfull,r,affine,alpha,ks,outlier,rho,s,l,la,alphass,Mc,Nc,Fname,arch);
                
                % % Recolecting results
                parameters = {C,l,alpha,rho,alphass,ks};
                % parameters.cube_size = [Mc,Nc,L];
                % results.C = C;
                % results.parameters = parameters;
                %
                % fprintf(['Experiment ends at: ',datestr(datetime('now')),'\n'])
                % fprintf('=======================================================\n');
                
                fprintf(['alphass: ',num2str(alphass),' OA: ',num2str(results.acc_o),'\n']);
                %% Save Results
                save(['Results/3D_Reg_OSA_new/',database,'/',database,'_alpha1=',num2str(alpha1),'_alpha2=',num2str(alpha2)...
                    ,'_ks=',num2str(ks),'_alphass=',num2str(alphass),'.mat'],'results','parameters');
            end
        end
    end
end

%900, 0.5