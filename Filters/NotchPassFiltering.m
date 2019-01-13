% Frequency domain filtering by generating filters directly in
% frequency domain
%
% using user created M-functions
f=imread('mri.tif');
[f, revertclass]=tofloat(f);
PQ=paddedsize(size(f));
% Notch pass filtering using cnotch() function
DO=0.05*PQ(2);
C = [99 154; 128 163]; 
H1=cnotch('btw','pass',PQ(1),PQ(2),C,DO);
%
% Notch pass filtering using recnotch() function
H2=recnotch('pass','vertical',PQ(1),PQ(2),3,15,15);
F=fft2(f,PQ(1),PQ(2));
g1=dftfilt(f,H1);
g2=dftfilt(f,H2);
g1=revertclass(g1);
g2=revertclass(g2);
figure,imshow(fftshift(H1));
figure,imshow(fftshift(H2));
figure,imshow(log(1+abs(fftshift(F))),[]);
figure,imshow(g1); 
figure,imshow(g2);
figure,mesh(double(fftshift(H1(1:5:end,1:5:end))));
figure,mesh(double(fftshift(H2(1:5:end,1:5:end))));
axis tight;
colormap([0 0 0]);
axis off;