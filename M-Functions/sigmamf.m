function mu = sigmamf(z, a, b) 
%SIGMAMF Sigma membership function. 
% MU = SIGMAMF(Z, A, B) computes the sigma fuzzy membership 
% function. Z is the input variable and can be a vector of 
% any length. A and 8 are scalar shape parameters, ordered 
% such that A <= B. 
% MU=0;  Z < A  
% MU=(Z - A). I (8-A);  A <= Z < B
% MU= 1;  B <= Z 
% 
mu = trapezmf(z, a, b, Inf, Inf) ;
end
 