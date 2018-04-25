%% Recon for bubbly wake project (phase object)
% code iterate from the Toloui & Hong 2015, using Rayleigh-Sommerfield & Kirchhoff-Fresnel diffraction Kernels (refrence: Katz and Sheng 2010)

function [Rec3] = SS_3DReconKFRS_Fn (Hologram,Lambda, Reso, Z_depth, SavingIMG,Kernel,im_rec)
% Kernel =1; % Kirchhoff-Fresnel %% preference
% Kernel =2; % Rayleigh-Sommerfield
FFT_Holo = fft2(Hologram);    
ImgSiz = size(Hologram);
Rec3 = zeros(ImgSiz(1),ImgSiz(2),length(Z_depth));
for ii=1:ImgSiz(1)
    for jj=1:ImgSiz(2)
        fx(ii,jj) = (ii - ImgSiz(1)/2)/(ImgSiz(1));
        fy(ii,jj) = (jj - ImgSiz(2)/2)/(ImgSiz(2));
    end
end
f2 = fx.^2+fy.^2;
f2 = fftshift(f2);
% figure, imagesc(f2);

nZ = length(Z_depth);
for s=1:nZ
%         disp(s/nZ);
        Phi = Lambda*pi/(Reso^2);
        if Kernel ==1
            Hz = exp(-1i*Phi*Z_depth(s)*f2);
        elseif Kernel ==2
            Hz = exp(-2*pi*1i*(Z_depth(s))*sqrt(1 - (f2.*((Lambda/Reso)^2)))/Lambda);
        end
        rec = ifft2( FFT_Holo.*Hz );
         Rec3(:,:,s) = rec(:,:);
         intensity=rec.*conj(rec);
         range=max(intensity(:))-min(intensity(:));
%          Filename1=sprintf('Depth_%04d.mat',s);
%          save(Filename1,'rec');
         Filename2 = strcat(im_rec,num2str(s),'.tiff');
        if SavingIMG ==1
            imwrite(uint8(intensity/range*255),  Filename2, 'tif', 'Compression', 'none'); 

        end
        clear rec;
        clear Hz;
end
% if Saving ==1
%     save(sprintf(OpticalField, Sequences),'Rec3','-v7.3');

    
end