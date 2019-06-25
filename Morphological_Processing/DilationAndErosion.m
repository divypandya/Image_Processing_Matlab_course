%% Reading a Binary image
A = imread('text.png');
B = imread('circles.png');
figure, imshow(A,[]);
figure, imshow(B,[]);

%% Obtaining a Structured Element for Dilation
se = strel('diamond',1);
DI = imdilate(A,se);
figure, imshow(DI,[]);

%% Obtaining a Structured Element for Erosion
se = strel('disk',10);
ER = imerode(B,se);
figure, imshow(ER,[]);

%% Morphological Opening and Closing
c = imread('testpat1.png');
figure, imshow(c,[]);
se = strel('square',3);
co = imopen(c,se);
figure, imshow(co,[]);
cc = imclose(c,se);
figure, imshow(cc,[]);
% opening followed by closing and vise-versa
coc = imclose(co,se);
figure, imshow(coc,[]);
