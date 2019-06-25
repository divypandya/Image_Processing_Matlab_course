%
% Blind Convolution for restoring image
% Estimating PSF using maximum likelihood function
%
f = checkerboard(8);
figure, imshow(pixeldup(f,8),[]);
title("Input Image");
% generating a PSF
PSF = fspecial('motion',7,10);
figure, imshow(pixeldup(PSF,73),[]);

SD = 0.01;
% adding noise to filtered image
g = imnoise(imfilter(f,PSF),'gaussian',0,SD^2);
figure, imshow(pixeldup(g,8),[]);
title("final degraded image");
%
% our initial estimation of PSF
INITPSF = ones(size(PSF));
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
% NUMIT = #iteration
NUMIT = 20;
[g5,PSF5] = deconvblind(g,INITPSF,NUMIT,DAMPAR,WEIGHT);
figure, imshow(pixeldup(PSF5,73),[]);
title("estimated PSF after 20 iteration");
figure, imshow(pixeldup(g5,8),[]);
title("restored image when NUMIT = 20");