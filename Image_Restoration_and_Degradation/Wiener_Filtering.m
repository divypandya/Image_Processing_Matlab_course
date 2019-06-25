% Generating a degraded image
% generating a checkerboard image
f = checkerboard(8);
figure, imshow(pixeldup(f,8),[]);
% This call to fspecial returns a PSF that approximates the effects of 
% linear motion of a camera by len pixels.
% Parameter theta is in degrees, measured with respect to the positive 
% horizontal axis in a counter-clockwise direction. 
PSF = fspecial('motion',7,45);
gb = imfilter(f,PSF,'circular');
figure, imshow(pixeldup(gb,8),[]);
% Generating Gaussian Noise with mean = 0 and var = 0.001
noise = imnoise2('gaussian',size(f,1),size(f,2),0,sqrt(0.001));
figure, imshow(pixeldup(noise,8),[]);
% Generating the degraded image
g = gb+noise;
figure, imshow(pixeldup(g,8),[]);
title('Final Degraded Image');
%
% Wiener Filtering to restore/ undegrade a image
%
Frest1 = deconvwnr(g,PSF);
figure, imshow(pixeldup(Frest1,8),[]);
title('Wiener filtering with Noise-to-Signal Ratio=0');
%
% now Wiener Filtering with R=na/fa where na=average noise power and
% fa=average image power
Sn = abs(fft2(noise)).^2;
na = sum(Sn(:))/numel(noise);
Sf = abs(fft2(f)).^2;
fa = sum(Sf(:))/numel(f);
R=na/fa;
frest2 = deconvwnr(g,PSF,R);
figure, imshow(pixeldup(frest2,8),[]);
title('Wiener Filtering Using const. ratio R');
%
% now Wiener Filtering also using auto-correlation function 
% of Noise and undegraded Image.
NCORR = fftshift(real(ifft2(Sn)));
ICORR = fftshift(real(ifft2(Sf)));
frest3 = deconvwnr(g,PSF,NCORR,ICORR);
figure, imshow(pixeldup(frest3,8),[]);
title('Wiener Filtering using Auto-Correlation Functions');
