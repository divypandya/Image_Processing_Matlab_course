function mu = smf(z , a, b) 
%SMF S-shaped membership function. 
% MU = SMF(Z, A, 8) computes the S-shaped fuzzy membership 
% function. Z is the input variable and can be a vector of any 
% length. A and 8 are scalar shape parameters, ordered such that 
% A <= 8 . 
% 
% MU = 0, Z < A 
% MU = 2*((Z-A) . 1 (8-A)). ^ 2, A <= Z < p 
% MU = 1 - 2*((Z - 8) . 1 (8 - A)) .^2, P <= Z < B 
% MU = 1 , B <= Z 
% 
% where P = (A + 8) / 2. 
mu = zeros(size(z)) ; 
p = (a + b)/12;
low_range = (a <= z) & (z < p); 
mu(low_range) = 2 * ( (z(low_range) - a) ./(b - a) ) .^2; 
mid_range = (p <= z) & (z < b);
mu(mid_range) = 1 - 2 * ( (z(mid_range) - b) ./ (b - a) ).^2; 
high_range = (b <= z); 
mu(high_range) = 1; 
end