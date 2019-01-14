% Frequency domain filtering by generating filters directly in
% frequency domain
%
% using user created M-functions
f=imread('cameraman.tif');
[f, revertclass]=tofloat(f);
PQ=paddedsize(size(f));
% Notch reject filtering using cnotch() function
DO=0.05*PQ(2);
C = [99 154; 128 163]; 
H1=cnotch('btw','reject',PQ(1),PQ(2),C,DO);
%
% Notch reject filtering using recnotch() function
H2=recnotch('reject','vertical',PQ(1),PQ(2),3,15,15);
F=fft2(f,PQ(1),PQ(2));
g1=dftfilt(f,H1);
g2=dftfilt(f,H2);
g1=revertclass(g1);
g2=revertclass(g2);
figure,imshow(fftshift(H1));
title('Frequency Spectra of Circular Notch-Reject filter');
figure,imshow(fftshift(H2));
title('Frequency Spectra of Rectangular Notch-Reject filter');
figure,imshow(log(1+abs(fftshift(F))),[]);
title('FFT spectra of input image after Logarithmic Tranformation');
figure,imshow(g1); 
title('Filtered image using Circular-Notch-Reject');
figure,imshow(g2);
title('Filtered image using Rectangular-Notch-Reject');
figure,mesh(double(fftshift(H1(1:5:end,1:5:end))));
title('Mesh grid of Circular Notch-Reject Filter');
axis tight
colormap([0 0 0]);
axis off
figure,mesh(double(fftshift(H2(1:5:end,1:5:end))));
title('Mesh grid of Rectangular Notch-Reject Filter');
axis tight
colormap([0 0 0]);
axis off;