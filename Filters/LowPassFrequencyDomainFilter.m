%Frequency domain filtering by generating filters directly in
%frequency domain
%
%using some user created M-functions
f=imread('cameraman.tif');
[f, revertclass]=tofloat(f);
PQ=paddedsize(size(f));
%lowpass filtering using lpfilter() function
DO=0.05*PQ(2);
H=lpfilter('btw',PQ(1),PQ(2),DO);
F=fft2(f,PQ(1),PQ(2));
g=dftfilt(f,H);
g=revertclass(g);
figure,imshow(fftshift(H));
figure,imshow(log(1+abs(fftshift(F))),[]);
figure,imshow(g); 
figure,mesh(double(fftshift(H(1:10:end, 1:10:end))));
axis tight
colormap(gray);
axis off
