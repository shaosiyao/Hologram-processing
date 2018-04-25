function [combinedMat] = SS_combine_Imin_Fn(Rec3,savingCombine,ksaving)
[row,col,numZ]=size(Rec3);
combinedMat=zeros(row,col);
% Rec3_deconv=zeros(row,col,numZ);
% for ii=1:numZ
%     calMat=Rec3(:,:,ii).*conj(Rec3(:,:,ii));
%     PSF=fspecial('gaussian',4,4);
%     WT = zeros(size(calMat));
%     WT(5:end-4,5:end-4) = 1;
%     INITPSF = ones(size(PSF));
%     V=0.0001;
%     [J,~] = deconvblind(calMat,INITPSF,20,10*sqrt(V),WT);
%     Rec3_deconv(:,:,ii)=J;
% end
% 
% for jj=1:row
%     for kk=1:col
% %         caltem=abs(Rec3(ii,jj,:));
%         caltem=Rec3_deconv(jj,kk,:);
% 
%         combinedMat(jj,kk,:)=min(reshape(caltem,[1,numZ]));
%     end
% end
for jj=1:row
    for kk=1:col
%         caltem=abs(Rec3(ii,jj,:));
        caltem=Rec3(jj,kk,:).*conj(Rec3(jj,kk,:));

        combinedMat(jj,kk,:)=min(reshape(caltem,[1,numZ]));
    end
end
im_rec='Combined_';
Filename = strcat(im_rec,ksaving,'.tif');
    range=max(combinedMat(:))-min(combinedMat(:));

if savingCombine==1
   imwrite(uint8(combinedMat/range*255),  Filename, 'tiff', 'Compression', 'none' ); %% rescale is important
else
end
%  Filename1=sprintf('combined_%04d.mat',ksaving);
 Filename1 = strcat(im_rec,ksaving,'.mat');

 save(Filename1,'combinedMat');
end

