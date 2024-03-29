function g = dftfilt(f, H, classout) 
%DFTFILT Performs frequency domain filtering. 
% g = DFTFILT(f, H, CLASSOUT) filters f in the frequency domain 
% using the filter transfer fUnction H. The output, g, is the 
% filtered image, which has the same size as f. 
% 
% Valid values of CLASSOUT are 
% 
% 'original ' The ouput is of the same class as the input. 
% This is the default if CLASSOUT is not included 
% in the call. 
% 'fltpoint' The output is floating point of class single, unless 
% both f and H are of class double, in which case the 
% 
% output also is of class double. 
% DFTFILT automatically pads f to be the same size as H. Both f 
% and H must be real. In addition, H must be an uncentered, 
% circularly-symmetric filter function. 
% Convert the input to floating pOint. 
[f, revertClass] = tofloat(f); 
% Obtain the FFT of the padded input. 
F = fft2(f, size(H, 1 ) , size(H, 2)) ; 
% Perform filtering.
G=H.*F;
figure,imshow(log(1+abs(fftshift(G))),[])
title('Frequency spectrum of filtered image');
g = ifft2(G); 
% Crop to original size. 
g = g(1:size(f, 1), 1:size(f, 2)); 
% g is of class single here. 
% Convert the output to the same class as the input if so specified. 
if nargin == 2 || strcmp (classout, 'original') 
    g = revertClass(g); 
elseif strcmp (classout, 'f ltpoint ' ) 
    return 
else
    error('Undefined class for the output image. ') 
end