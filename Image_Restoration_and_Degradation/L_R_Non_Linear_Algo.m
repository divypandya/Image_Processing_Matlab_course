% Lucy-Richardson algo for Non-Linear Filtering of Image
% It arises from a Maximum-Likelihood formulation in which
% image is modeled with a Poisson statistics.
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
% Filtering using deconvlucy();
% DAMPAR is being taken = 10*sigma;
% in this case sigma = 0.01;
DAMPAR = 10*0.01;
% 
% Now WEIGHT param is calculated using technique discussed in book
%
LIM = ceil(size(PSF,1)/2);
WEIGHT = zeros(size(g));
WEIGHT(LIM+1:end-LIM,LIM+1:end-LIM) = 1;
% therefore weight array is 64*64 with bordered 0s 4 pixels wide and rest
% of pixels are 1s.
%
% Now NUMIT = #iterations, we will set it according to our requirement and
% will keep adjusting accordingly.
NUMIT = 5;
frest = deconvlucy(g,PSF,NUMIT,DAMPAR,WEIGHT);
figure, imshow(pixeldup(frest,8),[]);
title("Restored Image using 5 Iterations");
NUMIT = 10;
frest = deconvlucy(g,PSF,NUMIT,DAMPAR,WEIGHT);
figure, imshow(pixeldup(frest,8),[]);
title("Restored Image using 10 Iterations");
NUMIT = 20;
frest = deconvlucy(g,PSF,NUMIT,DAMPAR,WEIGHT);
figure, imshow(pixeldup(frest,8),[]);
title("Restored Image using 20 Iterations");
NUMIT = 100;
frest = deconvlucy(g,PSF,NUMIT,DAMPAR,WEIGHT);
figure, imshow(pixeldup(frest,8),[]);
title("Restored Image using 100 Iterations");
