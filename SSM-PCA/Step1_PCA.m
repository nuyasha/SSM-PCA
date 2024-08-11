% This program is used for PCA.

clear;clc;
Data_mask=cell2mat(struct2cell(load('E:\Process\data_normalized.mat')));

%demean the data
Data_mask=bsxfun(@minus, Data_mask, mean(Data_mask,1));
Data_mask=bsxfun(@minus, Data_mask, mean(Data_mask,2));

%% =============== PCA: by SVD===============
[GIS,S,V]=svd(Data_mask,'econ');
SSF=V*S;
S=diag(S);
VAF=S.^2./sum(S.^2)*100;

%% =============== standardize GIS===============
zGIS=bsxfun(@minus,GIS,mean(GIS,1));
zGIS=bsxfun(@rdivide,zGIS, std(GIS,0,1)); %rdivide the equivalent A./B divides each entry of A by the corresponding entry of B.

