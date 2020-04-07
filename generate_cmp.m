clear all
close all
clc

 dataSet = 0; %Pavia U
% dataSet = 1; %Pavia Center
% dataSet = 2; %Salinas

if dataSet == 0
    load('../Data Classification/PaviaU.mat')
    load('../Data Classification/PaviaU_gt.mat')
    
    cmp = zeros(256, 3);
    cmp(2, :) = [192/255 192/255 192/255]; % Asphalt
    cmp(3, :) = [0/255 255/255 0/255];     % Meadows
    cmp(4, :) = [0/255 255/255 255/255];   % Gravel
    cmp(5, :) = [0/255 128/255 0/255];     % Trees
    cmp(6, :) = [255/255 0/255 255/255];   % Painted Metal
    cmp(7, :) = [165/255 81/255 41/255];   % Bare soil
    cmp(8, :) = [128/255 0/255 128/255];   % Bitumen
    cmp(9, :) = [255/255 0/255 0/255];     % Self-blocking
    cmp(10, :) = [255/255 255/255 0/255];  % Shadows
   image(paviaU_gt); colormap(cmp)
    
end

if dataSet == 1
    load('../Data Classification/new Data/All_PaviaCenter.mat');
    cmp = zeros(256, 3);
    cmp(2, :) = [0/255 0/255 254/255];     % Water
    cmp(3, :) = [0/255 127/255 0/255];     % Trees
    cmp(4, :) = [4/255 255/255 2/255];     % Meadows
    cmp(5, :) = [254/255 0/255 2/255];     % Bricks ya
    cmp(6, :) = [169/255 81/255 41/255];   % Bare soil ya
    cmp(7, :) = [193/255 193/255 193/255]; % Asphalt ya
    cmp(8, :) = [0/255 255/255 253/255];   % Bitumen ya
    cmp(9, :) = [246/255 112/255 1/255];   % Tile ya
    cmp(10, :) = [255/255 255/255 0/255];  % Shadows ya
    image(pavia_gt); colormap(cmp)
end

if dataSet == 2
    load('../Data Classification/Salinas_gt.mat');
    salinas_gt(salinas_gt==0)=17;
    cmp = zeros(256, 3);
 
    cmp(1, :) = [0/255 0/255 191/255];    % Brocoli 1
    cmp(2, :) = [0/255 0/255 255/255];    % Brocoli 2
    cmp(3, :) = [0/255 64/255 255/255];   % Fallow
    cmp(4, :) = [0/255 128/255 255/255];  % Fallow plow
    cmp(5, :) = [0/255 191/255 255/255];  % Fallow smooth
    cmp(6, :) = [0/255 255/255 255/255];  % Stubble
    cmp(7, :) = [64/255 255/255 190/255]; % Celery
    cmp(8, :) = [128/255 255/255 128/255];% Grapes
    cmp(9, :) = [191/255 244/255 0/255]; % Soil
    cmp(10, :) = [255/255 255/255 0/255]; % Corn
    cmp(11, :) = [255/255 191/255 0/255]; % Lettuce 4
    cmp(12, :) = [255/255 128/255 0/255]; % Lettuce 5
    cmp(13, :) = [255/255 64/255 0/255];  % Lettuce 6
    cmp(14, :) = [255/255 0/255 0/255];   % Lettuce 7
    cmp(15, :) = [191/255 0/255 0/255];   % Vineyard
    cmp(16, :) = [128/255 0/255 0/255];   % Vineyard trellis
    image(salinas_gt); colormap(cmp)    
end