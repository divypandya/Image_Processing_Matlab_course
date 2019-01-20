function mu = truncgaussmf(z, a, b, s) 
%TRUNCGAUSSMF Truncated Gaussian membership function. 
% MU = TRUNCGAUSSMF(Z, A, B, S) computes a truncated Gaussian 
% fuzzy membership function. Z is the input variable and can be a 
% vector of any length. A, B, and S are scalar shape parameters. A 
% and B have to be ordered such that A <= B. 
% 
% MU = exp(-(Z - B). A2 / sA2), abs(Z - B) <= (B - A) 
% MU = 0, otherwise 
mu = zeros(size(z)); 
c = a + 2*(b - a); 
range = (a <= z) & (z <= c); 
mu(range) = exp(-(z(range) - b).^2 / s^2); 
end