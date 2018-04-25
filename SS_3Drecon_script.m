% clc 
% clear all
% close all
Hologram= im2double(imread('Sample Hologram.tif'));
Lambda=0.532;
Reso=51;
Sequences=1:1:1;
Z_depth=0:250:255000;
SavingIMG=0;
img_rec=1;
Kernel=1;
im_rec='Recon_';
savingCombine=0;
fnames = dir('Enh_*.tif');


Rec3 = SS_3DReconKFRS_Fn(Hologram,Lambda, Reso,Z_depth, SavingIMG, Kernel,im_rec);
combinedMat=SS_combine_Imin_Fn(Rec3,savingCombine,'Sample');
