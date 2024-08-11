% This program is used for linear combination of SSF to improve the
% discrimination abilitiy of pattern.

%% initialization
clc; clear all; close all
%%
 s1=load('E:\Process\data_PCA.mat'); % include ssf, vaf, GIS
 
 %% logic regression 
 S=s1;
 sub=288; con=288; % sub= number of ASD; con= number of TD
 Y=cat(1,ones(sub,1),zeros(con,1));%   group Label
 pval=[];
Ind=[2 14]; % SSF number
 
%  X=s1.ssf(:,1:n);
X=S.SSF(:,Ind);
[Beta,dev,stats]= glmfit(X,Y,'binomial','link','logit');
Beta=Beta(2:end);
Beta=Beta./sqrt(sum(Beta.^2));
yfit = X*Beta; % new combined SSF
 
%% Calculate the combined pattern

Pattern=S.GIS(:,Ind)*Beta;
Pattern=(Pattern-mean(Pattern,1))./std(Pattern,0); 

