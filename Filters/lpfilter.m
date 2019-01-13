function H = lpfilter(type, M, N, DO, n) 
%LPFILTER Computes frequency domain lowpass filters. 
% H = LPFILTER(TYPE, M, N, DO, n) creates the transfer function of 
% a lowpass filter, H, of the specified TYPE and size (M-by-N). To 
% view the filter as an image or mesh plot, it should be centered 
% using H = fftshift(H). 
% 
% Valid values for TYPE, DO, and n are; %
% 
% 
% 'ideal' Ideal lowpass filter with cutoff frequency DO. n need not be supplied. DO must be positive. 
% 
% 
% 
% 'btw' Butterworth lowpass filter of order n, and cutoff DO. The default value for n is 1.0. DO must be positive. 
% 'gaussian' Gaussian lowpass filter with cutoff (standard 
% deviation) DO. n need not be supplied. DO must be 
% positive. 
% 
% H is of floating point class single. It is returned uncentered 
% for consistency with filtering function dftfilt. To view H as an 
% image or mesh plot, it should be centered using Hc = fftshift(H). 
% Use function dftuv to set up the meshgrid arrays needed for 
% computing the required distances. 
[U, V] = dftuv(M, N); 
% Compute the distances D(U, V). 
D = hypot (U, V); 
% Begin filter computations. 
switch type 
    case 'ideal' 
        H = single(D <= DO); 
    case 'btw' 
        if nargin== 4 
            n = 1; 
        end
        H = 1./(1 + (D./DO).^(2*n)); 
    case 'gaussian' 
        H = exp(-(D.^2)./(2*(DO^2))); 
    otherwise
        error ( 'Unknown filter type. ' ) 
end