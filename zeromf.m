function mu = zeromf(z) 
%ZEROMF Constant membership function (zero). 
% ZEROMF(Z) returns an an array of zeros with the same size as Z. 
% When using the @max operator to combine rule antecedents, 
% associating this membership function with a particular input 
% means that input has no effect. 
mu = zeros(size(z));