%--------------------------------------------------------------------------
% This is the function to call the sparse optimization program, to call the 
% spectral clustering algorithm and to compute the clustering error.
% r = projection dimension, if r = 0, then no projection
% affine = use the affine constraint if true
% s = clustering ground-truth
% results = clustering results
% CMat = coefficient matrix obtained by SSC
% W = weighted matrix
%--------------------------------------------------------------------------
% Copyright @ Carlos Hinojosa, 2018
%--------------------------------------------------------------------------

function [results,CMat,img,time1,time2] = CSI_SSC(X,r,affine,alpha,ks,outlier,rho,s,l,lambda,alphass,M,N,Fname,arch)

if (nargin < 6)
    rho = 1;
end
if (nargin < 5)
    outlier = false;
end
if (nargin < 4)
    alpha = 20;
end
if (nargin < 3)
    affine = false;
end
if (nargin < 2)
    r = 0;
end


n = l;

%% Select ADMM Function
    switch(arch)
        case 1
            admm_func = @admmLasso_mat_func_CSI_SSC_GPU;
        case 2
            admm_func = @admmLasso_mat_func_CSI_SSC_GPU_Double;
        case 3
            admm_func = @admmLasso_mat_func_CSI_SSC_CPU;
    end


%% Optimization Program Parameters
Xp = DataProjection(X,r);
thr = [2*10^-4];%[2*10^-4,4*10^-4];
maxIter = 100; 

%% Run Optimization Program
tic
if (~outlier)
    CMat = admm_func(Xp,affine,alpha,ks,thr,maxIter,lambda,alphass,M,N);
    C = CMat;
else
    error("Function for Outliers not implemented");
end

%% Spectral Clustering
C=gather(C);
% for rho=0.1:0.1:2
CKSym = BuildAdjacency(thrC(C,rho));
time1 = toc;
tic;
grps = SpectralClustering(CKSym,n);
time2 = toc;
[grps] = bestMapHS(grps,s);

[results] = evaluate_clustering_results(grps,s);
% fprintf("rho: %g, acc: %g \n",rho,results.acc_o)
% end
results.groups = grps;
results.time = time1+time2;

img = [];

end