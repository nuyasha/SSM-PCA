% This program is used for reproducibility validation.

clc; clear all; close all;
% compute SRP
Data_mask = cell2mat(struct2cell(load('E:\Process\data_normalized.mat')));
Data_mask=Data_mask';
Data_mask=bsxfun(@minus, Data_mask, mean(Data_mask,1)); 
Data_mask=bsxfun(@minus, Data_mask, mean(Data_mask,2));
SRP = Data_mask;

% validate Pattern II
Pattern=cell2mat(struct2cell(load('E:\Process\II\Pattern.mat')));
SRP=cell2mat(struct2cell(load('E:\Process\I\SRP.mat')));
SSF = SRP'*Pattern;
