f = imread('blobs.png');
figure,imshow(f,[]);

%% Opening By Reconstruction
fe = imerode(f,ones(51,1));
figure, imshow(fe,[]), title('Eroded using straight line');
fo = imopen(f,ones(51,1));
figure, imshow(fo,[]), title('Opened using Straight Line');
fobr = imreconstruct(fe,f);
figure,imshow(fobr,[]),title('Opened By Reconstruction');

%% Filling Holes
g = imfill(f,'holes');
figure, imshow(g,[]), title('Filled Holes');

%% Removing Border Objects
g1 = imclearborder(f);
figure, imshow(g1,[]), title('Removed Border Objects');
