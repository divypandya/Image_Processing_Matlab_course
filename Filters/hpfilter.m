function H = hpfilter (type, M, N, DO, n) 
%HPFILTER Computes frequency domain highpass filters. 
% H = HPFILTER(TYPE, M , N, DO, n) creates the transfer function of 
% a highpass filter, H, of the specified TYPE and size (M-by-N). 
% Valid values for TYPE, DO, and n are: 
% ' ideal '  Ideal highpass filter with cutoff f requency DO. 
%            n need not be supplied. DO must be positive. 
% 
% 'btw'      Butterworth highpass filter of order n, and cutoff DO . 
%            The default value for n is 1.0. DO must be positive.
%
% 'gaussian ' Gaussian highpass filter with cutoff (standard 
%             deviation) DO. n need not be supplied. DO must be 
%             positive. 
% 
% H is of floating point class single. It is returned uncentered 
% for consistency with filtering function dftfilt. To view H as an 
% image or mesh plot, it should be centered using Hc fftshift(H). 
% The transfer function Hhp of a highpass filter is 1 - Hlp, 
% where Hlp is the transfer function of the corresponding lowpass 
% filter. Thus, we can use function lpfilter to generate highpass 
% filters. 
if nargin==4 
    n = 1; 
    % Default value of n. 
end 
% Generate highpass filter . 
Hlp=lpfilter(type, M, N, DO, n) ; 
H = 1 - Hlp;