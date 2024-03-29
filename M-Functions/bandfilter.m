function H = bandfilter(type, band, M, N, DO , W, n) 
%BANDFILTER Computes frequency domain band filters. 
% 
% Parameters used in the filter definitions (see Table 4.3 in 
% DIPUM 2e for more details about these parameters): 
% M: Number of rows in the filter. 
% N: Number of columns in the filter. 
% DO: Radius of the center of the band. 
% W: "Width" of the band. W is the true width only for 
% ideal filters. For the other two filters this parameter 
% acts more like a smooth cutoff. 
% n: Order of the Butterworth filter if one is specified. W 
% and n interplay to determine the effective broadness of 
% the reject or pass band. Higher values of both these 
% parameters result in broader bands. 
% Valid values of BAND are: 
% 'reject'   Bandreject filter.
% 'pass'     Bandpass filter. 
% One of these two values must be specified for BAND. 
% 
% H = BANDFILTER('ideal', BAND, M, N, DO, W) computes an M-by-N 
% ideal bandpass or bandreject filter, depending on the value of 
% BAND. 
% 
% H = BANDFILTER('btw', BAND, M, N, DO, W, n) computes an M-by-N 
% Butterworth filter of order n. The filter is either bandpass or 
% bandreject, depending on the value of BAND. The default value of 
% n is 1. 
% 
% H = BANDFILTER('gaussian', BAND, M, N, DO, W) computes an M-by-N 
% gaussian filter. The filter is either bandpass or bandreject, 
% depending on BAND. 
% 
% H is of floating point class single. It is returned uncentered 
% for consistency with filtering function dftfilt. To view H as an 
% image or mesh plot, it should be centered using Hc = fftshift(H). 
% Use function dftuv to set up the meshgrid arrays needed for 
% computing the required distances. 
[U, V] = dftuv(M, N); 
% Compute the distances D(U, V). 
D = hypot(U, V); 
% Determine if need to use default n. 
if nargin < 7
    n=1; % Default BTW filter order. 
end
% Begin filter computations. All filters are computed as bandreject 
% filters. At the end, they are converted to bandpass if so 
% specified. Use lower(type) to protect against the input being 
% capitalized. 
switch lower(type) 
    case 'ideal' 
        H = ideaIAeject(D, DO, W); 
    case 'btw' 
        H = btwAeject(D, DO, W , n); 
    case 'gaussian' 
        H = gaussAeject(D, DO, W); 
    otherwise
        error( 'Unknown filter type. ' ) 
end
% Generate a bandpass filter if one was specified. 
if strcmp(band, 'pass') 
    H = 1 - H; 
end 
%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - --% 
function H = ideaIAeject(D, DO, W) 
RI = D <= DO - (W/2);      % Points of region inside the inner 
                           % boundary of the reject band are labeled 1. 
                           % All other points are labeled 0. 
RO = D >= DO + (W/2);      % Points of region outside the outer 
                           % boundary of the reject band are labeled 1. 
                           % All other points are labeled 0. 
H = tofloat(RO | RI);      % Ideal bandreject filter . 
%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - --% 
function H = btwAeject(D, DO, W, n) 
H = 1./(1 + (((D*W)./(D.^2 - DO^2)).^2*n)); 
%- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - --% 
function H = gaussAeject(D, DO, W) 
H = 1 - exp(- ((D.^2 - DO^2)./(D.*W + eps)).^2);