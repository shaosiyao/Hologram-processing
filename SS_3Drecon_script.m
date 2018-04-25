% clc 
% clear all
% close all
Hologram= im2double(imread('Enh_C001H001S0001004090.tif.tif'));
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

% for i=1:numel(fnames)
%     Hologram=im2double(imread(fnames(i).name));
    Rec3 = SS_3DReconKFRS_Fn(Hologram,Lambda, Reso,Z_depth, SavingIMG, Kernel,im_rec);
    combinedMat=SS_combine_Imin_Fn(Rec3,savingCombine,4090);
%     save('pos.mat','POS','time','ld');

% end
% subMat=combinedMat(10:57,298:350);
% vec=abs(Rec3(34,306,:));
% subMat_loc=zeros(48,53);
% for ii=1:48
%     for jj=1:53
%         [~,z_loc]=min(abs(Rec3(ii,jj,:)));
%         subMat_loc(ii,jj)=z_loc;
%     end
% end
% figure
% hold on
% for i=231:268
%    for  j=152:188
% checkintensity=Rec3(i,j,:);
% checkintensity=reshape(checkintensity,[1 2001]);
% plot(checkintensity.*conj(checkintensity))
%    end
% end
% 
% inner_pixel=reshape(Rec3(290,295,:),[1,101]);
% figure
% plot(abs(inner_pixel))

% fnames = dir('Recon*.tiff');

% Sharpness=SS_Tenedepth_Fn(fnames);

% hold on
% % inner_pixel2=reshape(Rec3(280,332,:),[1,101]);
% % plot(abs(inner_pixel2))
% 
% outer_pixel=reshape(Rec3(291,361,:),[1,101]);
% plot(abs(outer_pixel))
% edge_pixel=reshape(Rec3(232,330,:),[1,101]);
% plot(abs(edge_pixel))