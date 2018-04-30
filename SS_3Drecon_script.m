% clc 
% clear all
% close all
% All the input parameters have the units of micron
Hologram= im2double(imread('Sample Hologram.tif'));
Lambda_air=0.532;
ri=1.33; % take water as example
Lambda=Lamda_air/ri;
Reso=51;
Sequences=1:1:1;

Z_depth=0:250:255000;
SavingIMG=0;
img_rec=1;
Kernel=1;
im_rec='Recon_';
savingCombine=0;

% 3D reconstruction matrix

Rec3 = SS_3DReconKFRS_Fn(Hologram,Lambda, Reso,Z_depth, SavingIMG, Kernel,im_rec);

% Show the reconstruction results
combinedMat=SS_combine_Imin_Fn(Rec3,savingCombine,'Sample');
