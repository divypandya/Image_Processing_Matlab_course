% Constrained Least Squares or Regularised Filtering
%
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
% filtering using deconvreg();
% first with NoisePower = MN*(var(n)^2 + mean(n)^2);
% therefore NoisePower = 4;
frest1 = deconvreg(g,PSF,4);
figure, imshow(pixeldup(frest1,8),[]);
title("First Restored Image");
%Now trying adjusting NoisePower for optimal restoration
frest2 = deconvreg(g,PSF,0.4,[1e-7 1e7]);
figure, imshow(pixeldup(frest2,8),[]);
title("Restored Image after adjusting NP and Range");