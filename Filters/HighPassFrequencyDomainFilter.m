%Frequency domain filtering by generating filters directly in
%frequency domain
%
%using user created M-functions
f=imread('mri.tif');
[f, revertclass]=tofloat(f);
PQ=paddedsize(size(f));
%Highpass filtering using hpfilter() function
%Hhp=1-Hlp
DO=0.05*PQ(2);
H=hpfilter('btw',PQ(1),PQ(2),DO);
HFE=0.5+2*H;
F=fft2(f,PQ(1),PQ(2));
g=dftfilt(f,H);
g1=dftfilt(f,HFE);
g=revertclass(g);
g1=revertclass(g1);
figure,imshow(fftshift(H));
figure,imshow(log(1+abs(fftshift(F))),[]);
figure,imshow(g); 
figure,imshow(g1);
figure,mesh(double(fftshift(H(1:5:end, 1:5:end))));
axis tight;
colormap([0 0 0]);
axis off;