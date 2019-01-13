%Filtering in frequency domain by transforming spatial filters
%into frequency domain filters
%By using freqz2() matlab command
f=imread('cameraman.tif');
%converting image into floating point type
f=tofloat(f);
F=fft2(f);
S=fftshift(log(1+abs(F)));
%logrithmic transformation of fft2
figure (1);
imshow(S,[]);
h=fspecial('laplacian');
%generated a laplacian spatial filter
PQ=paddedsize(size(f));
%to find padded size of H or frequency domain filter
H=freqz2(h,PQ(1),PQ(2));
%generated frequency domain filter using freqz2() with obtained
%padding size
H1=ifftshift(H);
figure (2);
imshow(abs(H),[]);
figure (3);
imshow(abs(H1),[]);
gs=imfilter(f,h,'conv');
%filtering image in spatial domain using convolution
gf=dftfilt(f,H1);
%filtering image in frequency domain using our dftfilt function
figure(4);
imshow(gs,[]);
figure (5);
imshow(gf,[]);
figure (6);
imshow(abs(gs),[]);
%plotting only absolute part of filtered image
figure (7);
imshow(abs(gf),[]);
figure (8);
imshow(abs(gf)>0.2*abs(max(gf(:)))); 
%where the 0.2 multiplier was selected to show only the edges 
%with strength greater than 20% of the maximum values of gs and gf
d=abs(gf-gs);
plot(d);
%finding error between spatial domain and frequency domain filtered image
%we can see error was of order e-7 therefore gf and gs are quite similar
