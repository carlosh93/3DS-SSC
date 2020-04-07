clear all
close all
clc

addpath('Data');
addpath('Auxiliary Files/');
addpath('Auxiliary Files/subaxis/');
%esta funcion recorre los resultados individuales de cada metodo, extrae
%los resultados visuales y los muestra en una misma grafica para cada base
%de datos

%% Indian Pines

% Fname = 'Indian_subset';
% Fname = 'SalinasA';
% Fname = 'zurich';
Fname = 'pavia6';
% Fname = 'Indian_Full';
% Fname = 'Indian_subset';

load(Fname);

switch(Fname)
        
    case 'SalinasA'
        hyperimg = salinasA_corrected(:,1:83,:);
        labels = salinasA_gt(:,1:83);
        labels = labels(:)';
        labels = fix_labels(labels);
        clear salinasA_corrected
        
        cmp = zeros(256, 3);
        
        cmp(2, :) = [1,0,0.502]; % Brocoli_green_weeds_1
        cmp(3, :) = [0,0,1];   % corn_senesced_green_weeds
        cmp(4, :) = [1,1,0];  %lettuce_romaine_4wk
        cmp(5, :) = [1,0.702,0];  %lettuce_romaine_5wk
        cmp(6, :) = [0,0.8,0];  %lettuce_romaine_6wk
        cmp(7, :) = [0,1,1];  %lettuce_romaine_7wk
        
        %SSC
        load('Compare Methods/SSC/new_SalinasA.mat');
        result1 = results; clear results parameters;
        
        %S-SSC
        load('Compare Methods/S4C_old_2D/Results/3D_Reg_OSA/S-SSC_new_SalinasA.mat');
        result2 = results; clear results bestFnameNMI bestFnameOA Fname;
        
        %TV-SSC
        load('Compare Methods/TV KSSC-SMP/Results/3D_Reg_OSA/SalinasA_nv=6_nmbfea=50.mat');
        result3 = results; clear results bestFnameNMI bestFnameOA Fname;
        
        %ESC-FFS
        load('Compare Methods/ESC-FFS/best_SalinasA_Result.mat');
%         bestrstl = {};
%         bestacc_o = 0;
%         for ne=1:10
%             if AllResults{ne}.rstl.acc_o > bestacc_o
%                 bestrstl = AllResults{ne}.rstl;
%                 bestacc_o = AllResults{ne}.rstl.acc_o;
%             end
%         end
        result4 = AllResults{3}.rstl; clear avg_rstl bestrstl bestacc_o ne AllResults bestFnameNMI bestFnameOA Fname
        
        
        %SR-SSC
        load('Compare Methods/SR-SSC/SalinasA_alpha=100_nGraph=8_nsample=10.mat');
        result5 = rstl; clear bestFnameNMI bestFnameOA Fname rstl;
        
        
        %proposed 3DS-SSC
        load('Results/3D_Reg_OSA/best_SalinasA_Result.mat')
        result6 = results; clear bestFnameNMI bestFnameOA Fname results;
        
        sptitle = 'Salinas ROI Results';
        
        titleR1 = ['SSC, ','OA: ',num2str(result1.acc_o*100,4),'%'];
        titleR2 = ['S-SSC, ','OA: ',num2str(result2.acc_o*100,4),'%'];
        titleR3 = ['TV-KSSC-SMP, ','OA: ',num2str(result3.acc_o*100,4),'%'];
        titleR4 = ['ESC-FFS, ','OA: ',num2str(result4.acc_o*100,4),'%'];
        titleR5 = ['SR-SSC, ','OA: ',num2str(result5.acc_o*100,4),'%'];
        titleR6 = ['3DS-SSC, ','OA: ',num2str(result6.acc_o*100,4),'%'];
        
    case 'Indian_subset'
        hyperimg = Indian_subset;
        labels = gt(:)';
        labels = fix_labels(labels);
        clear Indian_subset gt;
        
        cmp = zeros(256, 3);
        cmp(2, :) = [1 0 0]; % Corn-notill (#2)
        cmp(3, :) = [0,1,0];   % Grass-trees (#6)
        cmp(4, :) = [0,0,1];  % Soybean-notill (#10)
        cmp(5, :) = [1,1,0];  % Soybean-mintill (#11)
        
        %SSC
        load('Compare Methods/SSC/Indian_subset.mat');
        result1 = results; clear results parameters;
        
        %S-SSC
        load('Compare Methods/S4C_old_2D/Results/3D_Reg_OSA/best_Indian_subset_Result.mat');
        result2 = results; clear results bestFnameNMI bestFnameOA Fname;
        
        %TV-SSC
        load('Compare Methods/TV KSSC-SMP/Results/3D_Reg_OSA/best_Indian_subset_Result.mat');
        result3 = results; clear results bestFnameNMI bestFnameOA Fname;
        
        %ESC-FFS
        load('Compare Methods/ESC-FFS/best_Indian_subset_Result.mat');

        result4 = AllResults{6}.rstl; clear avg_rstl bestrstl bestacc_o ne AllResults bestFnameNMI bestFnameOA Fname
        
        
        %SR-SSC
        load('Compare Methods/SR-SSC/best_Indian_subset_Result.mat');
        result5 = rstl; clear bestFnameNMI bestFnameOA Fname rstl;
        
        
        %proposed 3DS-SSC
        load('Results/3D_Reg_OSA/best_Indian_subset_Result.mat')
        result6 = results; clear bestFnameNMI bestFnameOA Fname results;
        
        sptitle = 'Indian Pines ROI Results';
        
        titleR1 = ['SSC, ','OA: ',num2str(result1.acc_o*100,4),'%'];
        titleR2 = ['S-SSC, ','OA: ',num2str(result2.acc_o*100,4),'%'];
        titleR3 = ['TV-KSSC-SMP, ','OA: ',num2str(result3.acc_o*100,4),'%'];
        titleR4 = ['ESC-FFS, ','OA: ',num2str(result4.acc_o*100,4),'%'];
        titleR5 = ['SR-SSC, ','OA: ',num2str(result5.acc_o*100,4),'%'];
        titleR6 = ['3DS-SSC, ','OA: ',num2str(result6.acc_o*100,4),'%'];
        
    case 'pavia6'
        labels = hyperimg_gt;
        labels = labels(:)';
        labels = fix_labels(labels);
        
        cmp = zeros(256, 3);
        cmp(2, :) = [0.7529,0.7529,0.7529]; % Corn-notill (#2)
        cmp(3, :) = [0,1,0];   % Grass-trees (#6)
        cmp(4, :) = [0,0.5020,0];  % Soybean-notill (#10)
        cmp(5, :) = [1,0,0];  % Soybean-mintill (#11)
        
        %SSC
        load('Compare Methods/SSC/pavia6.mat');
        result1 = results; clear results parameters;
        
        %S-SSC
        load('Compare Methods/S4C_old_2D/Results/3D_Reg_OSA/best_pavia6_Result.mat');
        result2 = results; clear results bestFnameNMI bestFnameOA Fname;
        
        %TV-SSC
        load('Compare Methods/TV KSSC-SMP/Results/3D_Reg_OSA/best_pavia6_Result.mat');
        result3 = results; clear results bestFnameNMI bestFnameOA Fname;
        
        %ESC-FFS
        load('Compare Methods/ESC-FFS/best_pavia6_Result.mat');

        result4 = AllResults{5}.rstl; clear avg_rstl bestrstl bestacc_o ne AllResults bestFnameNMI bestFnameOA Fname
        
        
        %SR-SSC
        load('Compare Methods/SR-SSC/best_pavia6_Result.mat');
        result5 = rstl; clear bestFnameNMI bestFnameOA Fname rstl;
        
        
        %proposed 3DS-SSC
        load('Results/3D_Reg_OSA/best_pavia6_Result.mat')
        result6 = results; clear bestFnameNMI bestFnameOA Fname results;
        
        sptitle = 'Pavia University ROI Results';
        
        titleR1 = ['SSC, ','OA: ',num2str(result1.acc_o*100,4),'%'];
        titleR2 = ['S-SSC, ','OA: ',num2str(result2.acc_o*100,4),'%'];
        titleR3 = ['TV-KSSC-SMP, ','OA: ',num2str(result3.acc_o*100,4),'%'];
        titleR4 = ['ESC-FFS, ','OA: ',num2str(result4.acc_o*100,4),'%'];
        titleR5 = ['SR-SSC, ','OA: ',num2str(result5.acc_o*100,4),'%'];
        titleR6 = ['3DS-SSC, ','OA: ',num2str(result6.acc_o*100,4),'%'];
        
end




[Mc,Nc,L] = size(hyperimg);

% Ground-Truth

subaxis(1,7,1,'SpacingHorizontal',0.05);
image(reshape(labels,[Mc Nc])); colormap(cmp); %axis image; axis off;

axis off
title('GroudTruth');


% SSC
method1_results = reshape(result1.groups,[Mc Nc]);
method1_results(labels==1)=1;
subaxis(1,7,2);
image(method1_results); colormap(cmp)
axis off
title(titleR1);


% S-SSC
method2_results = reshape(result2.groups,[Mc Nc]);
method2_results(labels==1)=1;
subaxis(1,7,3);
image(method2_results); colormap(cmp)
axis off
title(titleR2);

% TV-KSSC-SMP
method3_results = reshape(result3.groups,[Mc Nc]);
method3_results(labels==1)=1;
subaxis(1,7,4);
image(method3_results); colormap(cmp)
axis off
title(titleR3);


% ESC
method4_results = reshape(result4.groups,[Mc Nc]);
method4_results(labels==1)=1;
subaxis(1,7,5);
image(method4_results); colormap(cmp)
axis off
title(titleR4);


% SR-SSC
method5_results = reshape(result5.groups,[Mc Nc]);
method5_results(labels==1)=1;
subaxis(1,7,6);
image(method5_results); colormap(cmp)
axis off
title(titleR5);

% Proposed
prop_results = reshape(result6.groups,[Mc Nc]);
prop_results(labels==1)=1;
subaxis(1,7,7);
image(prop_results); colormap(cmp)
axis off
title(titleR6);

suptitle(sptitle)
