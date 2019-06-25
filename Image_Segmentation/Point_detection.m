f = imread('moon.tif');
figure, imshow(f,[]);

%% By running a Mask throughout the image
w = [-1 -1 -1; -1 8 -1; -1 -1 -1];
g = abs(imfilter(tofloat(f),w));
T = max(g(:));
g = g>=T;
figure, imshow(g,[]), title('using imfilter');

%% Using a non-linear spatial filter
m = 5; n=5;
g = ordfilt2(f, m*n, ones(m, n)) -ordfilt2(f, 1, ones(m, n)); 
T = max(g(:));
g = g>=T;
figure, imshow(g,[]),title('using a non-linear filter');