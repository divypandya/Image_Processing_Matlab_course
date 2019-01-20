%Adding Noise to Images using imnoise() function
f=imread('cameraman.tif');
%
%using imnoise function
g1=imnoise(f,'gaussian',64/255,400/(255^2));
imshow(g1,[]);
title('Using imnoise()');
%
%using imnoise2() M-Func
r1=imnoise2('gaussian',256,256,64/255,400/(255^2));
f=tofloat(f);
g2=f+r1;
figure,imshow(g2,[]);
title('Using imnoise2()');
%
%Generating PERIODIC NOISE using imnoise3() M-func
C = [0 32; 0 64; 16 16; 32 0; 64 0; -16 16]; 
[r, R, S]=imnoise3(256,256,C);
figure,imshow(S,[]);
title('FFT Spectrum of Periodic Noise');
figure, imshow(r,[]);
title('Periodic Noise in Spatial Domain');