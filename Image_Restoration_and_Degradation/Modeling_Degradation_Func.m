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
