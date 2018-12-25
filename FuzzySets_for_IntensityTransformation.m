% Specify input membership functions 
udark = @(z) 1 - sigmamf(z, 0.35, 0.5); 
ugray = @(z) triangmf(z, 0.35, 0.5, 0.65);
ubright = @(z) sigmamf(z, 0.5, 0.65); 
% Plot the input membership functions.
fplot(udark, [0,1],20);
hold on 
fplot(ugray, [0 1], 20);
fplot(ubright, [0 1], 20); 
% Specify the output membership functions. Plotting of 
udarker = @(z) bellmf(z, 0.0, 0.1);
umidgray = @(z) bellmf(z, 0.4, 0.5);
ubrighter = @(z) bellmf(z, 0.8, 0.9); 
% Obtain fuzzy system response function.
rules = {udark; ugray; ubright};
outmf = {udarker, umidgray, ubrighter};
F = fuzzysysfcn(rules, outmf, [0 1]); 
% Use F to construct an intensity transformation function.
f1=imread('mandi.tif');
z = linspace(0, 1, 256); 
% f is of class uint8. 
T = F(z); 
% Transform the intensities of fusing T.
g = intrans(f1, 'specified', T);
figure, imshow(g);