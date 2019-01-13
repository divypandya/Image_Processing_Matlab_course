%Frequency domain filtering by generating filters directly in
%frequency domain
%
%using user created M-functions
f=imread('mri.tif');
[f, revertclass]=tofloat(f);
PQ=paddedsize(size(f));
%Bandpass filtering using bandfilter() function
DO=0.05*PQ(2);
H=bandfilter('btw','pass',PQ(1),PQ(2),DO,20);
F=fft2(f,PQ(1),PQ(2));
g=dftfilt(f,H);
g=revertclass(g);
figure,imshow(fftshift(H));
figure,imshow(log(1+abs(fftshift(F))),[]);
figure,imshow(g); 
figure,mesh(double(fftshift(H(1:5:end, 1:5:end))));
axis tight;
colormap([0 0 0]);
axis off;