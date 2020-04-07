clear all
close all
clc

addpath('../Auxiliary Files/latex2table/');

% Set column labels (use empty string for no label):
input.tableColLabels = {'SSC','S-SSC','TV-KSSC-SMP','ESC-FFS',...
    'SR-SSC','3DS-SSC'};


data_global = [];



%% SSC
data_tmp = [];
%Indian
load('Compare Methods/SSC/Indian_subset.mat');

data_tmp = [data_tmp; results.p_acc.*100; results.u_acc.*100; results.acc_a.*100; results.acc_o.*100; ...
    results.kappa; results.nmi; results.time];

data_tmp = [data_tmp; -999];
clear results
%Salinas
load('Compare Methods/SSC/new_SalinasA.mat');
data_tmp = [data_tmp; results.p_acc.*100; results.u_acc.*100; results.acc_a.*100; results.acc_o.*100; ...
    results.kappa; results.nmi; results.time];

data_tmp = [data_tmp; -999];

clear results

%Pavia_U
load('Compare Methods/SSC/pavia6.mat');
data_tmp = [data_tmp; results.p_acc.*100; results.u_acc.*100; results.acc_a.*100; results.acc_o.*100; ...
    results.kappa; results.nmi; results.time];

data_tmp = [data_tmp; -999];

%add to data global
data_global = [data_global,data_tmp];


clear results

%% S-SSC

data_tmp = [];
%Indian
load('Compare Methods/S4C_old_2D/Results/3D_Reg_OSA/best_Indian_subset_Result.mat');

data_tmp = [data_tmp; results.p_acc.*100; results.u_acc.*100; results.acc_a.*100; results.acc_o.*100; ...
    results.kappa; results.nmi; results.time];

data_tmp = [data_tmp; -999];
clear results
%Salinas
load('Compare Methods/S4C_old_2D/Results/3D_Reg_OSA/S-SSC_new_SalinasA.mat');
data_tmp = [data_tmp; results.p_acc.*100; results.u_acc.*100; results.acc_a.*100; results.acc_o.*100; ...
    results.kappa; results.nmi; results.time];

data_tmp = [data_tmp; -999];

clear results

%Pavia_U
load('Compare Methods/S4C_old_2D/Results/3D_Reg_OSA/best_pavia6_Result.mat');
data_tmp = [data_tmp; results.p_acc.*100; results.u_acc.*100; results.acc_a.*100; results.acc_o.*100; ...
    results.kappa; results.nmi; results.time];

data_tmp = [data_tmp; -999];

%add to data global
data_global = [data_global,data_tmp];

clear results

%% TV-KSSC-SMP

data_tmp = [];
%Indian
load('Compare Methods/TV KSSC-SMP/Results/3D_Reg_OSA/best_Indian_subset_Result.mat');
clear Fname bestFnameNMI bestFnameOA

data_tmp = [data_tmp; results.p_acc.*100; results.u_acc.*100; results.acc_a.*100; results.acc_o.*100; ...
    results.kappa; results.nmi; results.time];

data_tmp = [data_tmp; -999];
clear results

%Salinas
load('Compare Methods/TV KSSC-SMP/Results/3D_Reg_OSA/SalinasA_nv=6_nmbfea=50.mat');
clear Fname bestFnameNMI bestFnameOA

data_tmp = [data_tmp; results.p_acc.*100; results.u_acc.*100; results.acc_a.*100; results.acc_o.*100; ...
    results.kappa; results.nmi; results.time];

data_tmp = [data_tmp; -999];

clear results

%Pavia_U
load('Compare Methods/TV KSSC-SMP/Results/3D_Reg_OSA/best_pavia6_Result.mat');
clear Fname bestFnameNMI bestFnameOA

data_tmp = [data_tmp; results.p_acc.*100; results.u_acc.*100; results.acc_a.*100; results.acc_o.*100; ...
    results.kappa; results.nmi; results.time];

data_tmp = [data_tmp; -999];

%add to data global
data_global = [data_global,data_tmp];
clear results


%% ESC-FFS
data_tmp = [];
%Indian
load('Compare Methods/ESC-FFS/best_Indian_subset_Result.mat');
results = avg_rstl; clear avg_rstl AllResults;

data_tmp = [data_tmp; results.p_acc.*100; results.u_acc.*100; results.acc_a.*100; results.acc_o.*100; ...
    results.kappa; results.nmi; results.time];

data_tmp = [data_tmp; -999];
clear results
%Salinas
load('Compare Methods/ESC-FFS/best_SalinasA_Result.mat');
results = avg_rstl; clear avg_rstl AllResults;

data_tmp = [data_tmp; results.p_acc.*100; results.u_acc.*100; results.acc_a.*100; results.acc_o.*100; ...
    results.kappa; results.nmi; results.time];

data_tmp = [data_tmp; -999];

clear results

%Pavia_U
load('Compare Methods/ESC-FFS/best_pavia6_Result.mat');
results = avg_rstl; clear avg_rstl AllResults;

data_tmp = [data_tmp; results.p_acc.*100; results.u_acc.*100; results.acc_a.*100; results.acc_o.*100; ...
    results.kappa; results.nmi; results.time];

data_tmp = [data_tmp; -999];

%add to data global
data_global = [data_global,data_tmp];


clear rstl results avg_rstl AllResults

%% SR-SSC

data_tmp = [];
%Indian
load('Compare Methods/SR-SSC/best_Indian_subset_Result.mat')
results = rstl; clear rstl;

data_tmp = [data_tmp; results.p_acc.*100; results.u_acc.*100; results.acc_a.*100; results.acc_o.*100; ...
    results.kappa; results.nmi; results.time];

data_tmp = [data_tmp; -999];
clear results
%Salinas
load('Compare Methods/SR-SSC/SalinasA_alpha=100_nGraph=8_nsample=10.mat');
results = rstl; clear rstl;

data_tmp = [data_tmp; results.p_acc.*100; results.u_acc.*100; results.acc_a.*100; results.acc_o.*100; ...
    results.kappa; results.nmi; results.time];

data_tmp = [data_tmp; -999];

clear results

%Pavia_U
load('Compare Methods/SR-SSC/best_pavia6_Result.mat');
results = rstl; clear rstl;

data_tmp = [data_tmp; results.p_acc.*100; results.u_acc.*100; results.acc_a.*100; results.acc_o.*100; ...
    results.kappa; results.nmi; results.time];

data_tmp = [data_tmp; -999];

clear results
%add to data global
data_global = [data_global,data_tmp];


%% 3DS-SSC

data_tmp = [];
%Indian
load('Results/3D_Reg_OSA/best_Indian_subset_Result.mat')
clear Fname bestFnameNMI bestFnameOA

data_tmp = [data_tmp; results.p_acc.*100; results.u_acc.*100; results.acc_a.*100; results.acc_o.*100; ...
    results.kappa; results.nmi; results.time];

data_tmp = [data_tmp; -999];
clear results
%Salinas
load('Results/3D_Reg_OSA/best_SalinasA_Result.mat');
clear Fname bestFnameNMI bestFnameOA

data_tmp = [data_tmp; results.p_acc.*100; results.u_acc.*100; results.acc_a.*100; results.acc_o.*100; ...
    results.kappa; results.nmi; results.time];

data_tmp = [data_tmp; -999];

clear results

%Pavia_U
load('Results/3D_Reg_OSA/best_pavia6_Result.mat');
clear Fname bestFnameNMI bestFnameOA

data_tmp = [data_tmp; results.p_acc.*100; results.u_acc.*100; results.acc_a.*100; results.acc_o.*100; ...
    results.kappa; results.nmi; results.time];

data_tmp = [data_tmp; -999];

clear results
%add to data global
data_global = [data_global,data_tmp];

input.data = data_global;

% Switch transposing/pivoting your table:
input.transposeTable = 0;

% Determine whether input.dataFormat is applied column or row based:
input.dataFormatMode = 'column'; % use 'column' or 'row'. if not set 'colum' is used

% Formatting-string to set the precision of the table values:
% For using different formats in different rows use a cell array like
% {myFormatString1,numberOfValues1,myFormatString2,numberOfValues2, ... }
% where myFormatString_ are formatting-strings and numberOfValues_ are the
% number of table columns or rows that the preceding formatting-string applies.
% Please make sure the sum of numberOfValues_ matches the number of columns or
% rows in input.tableData!
%
%input.dataFormat = {'%.3f',2,'%.1f',1}; % three digits precision for first two columns, one digit for the last
input.dataFormat = {'%.2f',6};

% Define how NaN values in input.tableData should be printed in the LaTex table:
input.dataNanString = '-';

% Column alignment in Latex table ('l'=left-justified, 'c'=centered,'r'=right-justified):
input.tableColumnAlignment = 'c';

% Switch table borders on/off (borders are enabled by default):
input.tableBorders = 1;

% Uses booktabs basic formating rules ('1' = using booktabs, '0' = not using booktabs).
% Note that this option requires the booktabs package being available in your LaTex.
% Also, setting the booktabs option to '1' overwrites input.tableBorders if it exists.
% input.booktabs = 0;


% LaTex table caption:
input.tableCaption = 'MyTableCaption';

% LaTex table label:
input.tableLabel = 'MyTableLabel';

% Switch to generate a complete LaTex document or just a table:
input.makeCompleteLatexDocument = 1;

% call latexTable:
T = latexTable(input);