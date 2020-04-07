clear all ;close all ;clc;


%% Database

addpath('../Data/')
%addpath('../Architectures/SSCSI');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Indian Pines %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Select and load the database
% Fname =  'Indian_Pines';%'SalinasA'; %'SuperBalls';  %Folder Name
% database = 'Indian_subset';%'SalinasA_corrected'; %'superballs_ms2_5clases'; %'Indian_subset_ori';  
% groundtruth = 'Ground_truth';%'SalinasA_gt';%'Ground_truth_ori';  
% load(database);
% load(groundtruth);
% 
% hyperimg = Indian_subset;%salinasA_corrected;  %salinas_corrected; 
% hyperimg_gt = gt;%salinasA_gt;  %salinas_gt;
% 
% % false color Image
% 
% rgb = zeros(70,70,3);
% rgb(:,:,1)=mat2gray(hyperimg(:,:,40));
% rgb(:,:,2) = mat2gray(hyperimg(:,:,30));
% rgb(:,:,3) = mat2gray(hyperimg(:,:,20));
% figure
% image(rgb);
% 
% %groundTruth
% figure
% [M,N,L]=size(hyperimg);
% img=zeros(M*N,3);
% s = hyperimg_gt(:);
% img(s==6,2)=1;
% img(s==2,1)=1;
% img(s==10,3)=1;
% img(s==11,1)=1;
% img(s==11,2)=1;
% img = reshape(img,M,N,3);
% image(img);
% %pixels positions
% p1 = hyperimg(51,53,:);  %corn no till
% p1 = p1(:);
% p2 = hyperimg(30,7,:); %grass
% p2 = p2(:);
% p3 = hyperimg(20,65,:);  %soybean no till
% p3 = p3(:);
% p4 = hyperimg(58,17,:);  %soybean minimum till
% p4 = p4(:);
% 
% figure
% plot(p1,'LineWidth',1.5,'Color',[1 0 0]);
% hold on
% plot(p2,'LineWidth',1.5,'Color',[0 1 0]);
% hold on
% plot(p3,'LineWidth',1.5,'Color',[0 0 1]);
% hold on
% plot(p4,'LineWidth',1.5,'Color',[1 1 0]);
% 
% legend('Corn-no-till','Grass','Soybean-no-till','Soybean-minimum-till');
% 
% title('Spectral Curve');
% xlabel('Band Number');
% ylabel('Reflectance');
% hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% SALINAS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Fname =  'SalinasA';%'Indian_Pines'; %'SuperBalls';  %Folder Name
% database = 'SalinasA_corrected';%'Indian_subset'; %'superballs_ms2_5clases'; %'Indian_subset_ori';  
% groundtruth = 'SalinasA_gt';%'Ground_truth';%'Ground_truth_ori';  
% load(Fname);
% 
% hyperimg = salinasA_corrected;%Indian_subset;  %salinas_corrected; 
% hyperimg_gt = salinasA_gt; %gt;  %salinas_gt;
% 
% % false color Image
% 
% rgb = zeros(83,86,3);
% rgb(:,:,1)=mat2gray(hyperimg(:,:,70));
% rgb(:,:,2) = mat2gray(hyperimg(:,:,27));
% rgb(:,:,3) = mat2gray(hyperimg(:,:,17));
% figure
% image(rgb);
% 
% %groundTruth
% figure
% [M,N,L]=size(hyperimg);
% img=zeros(M*N,3);
% s = hyperimg_gt(:);
% 
% 
% img(find(s==13),2)=0.8;
% img(find(s==1),1)=1;
% img(find(s==1),3)=0.5;
% img(find(s==10),3)=1;
% img(find(s==11),1)=1;
% img(find(s==11),2)=1;
% img(find(s==12),1)=1;
% img(find(s==12),2)=0.7;
% img(find(s==14),3)=1;
% img(find(s==14),2)=1;
% img = reshape(img,M,N,3);
% image(img);
% %pixels positions
% p1 = hyperimg(7,6,:);  %Brocoli-green-weeds
% p1 = p1(:);
% p2 = hyperimg(6,49,:); %corn-senesced-green-week
% p2 = p2(:);
% p3 = hyperimg(33,35,:);  %lettuce-romaine-4wk
% p3 = p3(:);
% p4 = hyperimg(39,55,:);  %lettuce-romaine-5wk
% p4 = p4(:);
% p5 = hyperimg(44,64,:);  %lettuce-romaine-6wk
% p5 = p5(:);
% p6 = hyperimg(73,63,:);  %lettuce-romaine-7wk
% p6 = p6(:);
% 
% figure
% plot(p1,'LineWidth',1.5,'Color',[1 0 0.5]);
% hold on
% plot(p2,'LineWidth',1.5,'Color',[1 1 0]);
% hold on
% plot(p3,'LineWidth',1.5,'Color',[1 0.7 0]);
% hold on
% plot(p4,'LineWidth',1.5,'Color',[0 0.8 0]);
% hold on
% plot(p5,'LineWidth',1.5,'Color',[0 1 1]);
% hold on
% plot(p6,'LineWidth',1.5,'Color',[0 0 1]);
% 
% 
% legend('Brocoli-green-weeds','Corn-senesced-green-week','Lettuce-romaine-4wk','Lettuce-romaine-5wk','Lettuce-romaine-6wk','Lettuce-romaine-7wk');
% 
% title('Spectral Curve');
% xlabel('Band Number');
% ylabel('Reflectance');
% hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% PAVIA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Fname =  'Pavia';%'SalinasA'; %'SuperBalls';  %Folder Name
database = 'PaviaU';%'SalinasA_corrected'; %'superballs_ms2_5clases'; %'Indian_subset_ori';  
groundtruth = 'PaviaU_gt'; %'Ground_truth';%'SalinasA_gt';%'Ground_truth_ori';  
load(database);
load(groundtruth);
load('PaviaU_color');
hyperimg = paviaU; %Indian_subset;%salinasA_corrected;  %salinas_corrected; 
hyperimg_gt = paviaU_gt; %salinasA_gt;  %salinas_gt;

% false color Image

% rgb = zeros(M,N,3);
% rgb(:,:,1)=mat2gray(hyperimg(:,:,102));
% rgb(:,:,2) = mat2gray(hyperimg(:,:,56));
% rgb(:,:,3) = mat2gray(hyperimg(:,:,31));
% figure
% image(rgb);

%groundTruth
figure
image(hyperimg_gt);
colormap(cmp);
%pixels positions
p1 = hyperimg(575,40,:);  %Asphalt 1
p1 = p1(:); 
p2 = hyperimg(598,18,:);  %Meadows 2 
p2 = p2(:);
p3 = hyperimg(557,33,:);  %Trees 4
p3 = p3(:);
p4 = hyperimg(536,30,:);  %Bricks
p4 = p4(:);

figure
plot(p1,'LineWidth',1.5,'Color',cmp(2,:));
hold on
plot(p2,'LineWidth',1.5,'Color',cmp(3,:));
hold on
plot(p3,'LineWidth',1.5,'Color',cmp(5,:));
hold on
plot(p4,'LineWidth',1.5,'Color',cmp(9,:));

legend('Asphalt','Meadows','Trees','Bricks');

title('Spectral Curve');
xlabel('Band Number');
ylabel('Reflectance');
hold off
