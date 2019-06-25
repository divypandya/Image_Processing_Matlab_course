f = imread('rice.png');
figure, imshow(f,[]);
figure, imhist(f);

%% Global Thresholding
T = mean2(f);
count = 0;
done = false;
while done==false
    count = count + 1;
    g1 = f > T;
    T_next = 0.5 * (mean(f(g1)) + mean(f(~g1)));
    done = abs(T - T_next) < 0.5;
    T = T_next;
end
g = im2bw(f,T/255);
figure, imshow(g,[]);

%% Global Thresholding using Otsu's method
f = imread('spine.tif');
figure, imshow(f,[]);
[T, SM] = graythresh(f);
g = im2bw(f,T);
figure, imshow(g);

%% Improving Global Thresholding using Image Smoothing
fn = imnoise(f,'gaussian',0,0.038);
figure, imshow(fn,[]);
Tn = graythresh(fn);
gn = im2bw(fn,Tn);
figure, imshow(gn,[]);
w = fspecial('average',5);
fa = imfilter(fn,w,'replicate');
Ta = graythresh(fn);
ga = im2bw(fa,Ta);
figure, imshow(ga,[]);

%% Using Edges to improve the Global Thresholding
%  When objects are much smaller than the background, their contribution
%  to the histogram is negligible. Using Edge information can improve the 
%  information.
im = tofloat(imread('hands1-mask.png'));
figure, imshow(im,[]);
imn = imnoise(im,'gaussian',0,0.0015);
figure, imshow(imn,[]);
sx = fspecial('sobel');
sy = sx';
gx = imfilter(imn,sx,'replicate');
gy = imfilter(imn,sy,'replicate');
grad = sqrt(gx.*gx + gy.*gy);
grad = grad/max(grad(:));
h = imhist(grad);
q = percentile2i(h,0.90);
markerImage = grad > q;
figure, imshow(markerImage,[]);
fp = imn.*markerImage;
figure, imshow(fp,[]);
hp = imhist(fp);
hp(1) = 0;
figure,bar(hp,0);
T = otsuthresh(hp);
g = im2bw(imn,T);
figure, imshow(g,[]);

%% Using Laplacian to improve Global Thresholding
f = tofloat(imread('mri.tif'));
figure, imshow(f,[]);
figure, imhist(f);
hf = imhist(f);
[Tf, SMf] = graythresh(f);
gf = im2bw(f,Tf);
figure, imshow(gf,[]);
w = [-1 -1 -1; -1 8 -1; -1 -1 -1];
lap = abs(imfilter(f,w,'replicate'));
lap = lap/max(lap(:));
h = imhist(lap);
Q = percentile2i(h,0.995);
markerImage = lap > Q;
fp = f.*markerImage;
figure, imshow(fp,[]);
hp = imhist(fp);
hp(1) = 0;
figure, bar(hp,0);
T = otsuthresh(hp);
g = im2bw(f,T);
figure, imshow(g,[]);