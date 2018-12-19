function mu = onemf(z) 
%ONEMF Constant membership function (one). 
% ONEMF(Z) returns an an array of ones with the same size as Z. 
% 
% When using the @min operator to combine rule antecedents, 
% associating this membership function with a particular input 
% means that input has no effect. 
mu = ones(size(z)); 