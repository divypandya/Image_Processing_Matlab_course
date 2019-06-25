f = imread('cameraman.tif');
figure, imshow(f,[]);

%% Gray-Scale Dilation, Erosion and Morphological Gradient
se = strel('square',3);
fd = imdilate(f,se);
figure, imshow(fd,[]), title('Dilated Gray Scale Image');

fe = imerode(f,se);
figure, imshow(fe,[]), title('Eroded Gray-Scale Image');

% Morphological Gradient = dilated_Image - eroded_Image, which is a 
% measure of local gray-level variation in the image
morph_grad = fd - fe;
figure, imshow(morph_grad,[]), title('Morphological Gradient of Image');

%% Opening and Closing of an Image
fo = imopen(f,se);
figure, imshow(fo,[]), title('Opened Image');
foc = imclose(fo,se);
figure, imshow(foc,[]), title('Opened and then closed');

%% Another way to use openings and closings in combination is in 
% *Alternating Sequential Filtering* . One form of alternating sequential 
% filtering is to perform open-close filtering with a series of structuring
% elements of increasing size. 

fasf = f;
for k = 2:5
    se1 = strel('square',k);
    fasf = imclose(imopen(fasf,se1),se1);
end
figure, imshow(fasf,[]), title('Alternating Sequential Filtering to smooth the image');

%% Tophat And Bothat Transformations 
% illumination.
g = imread('rice.png');
figure, imshow(g,[]);

se2 = strel('disk',10);
go = imopen(g,se2);
figure, imshow(go,[]), title('Image Opened with Disk SE');

% Tophat
g2 = imtophat(g,se2); % same as g2 = go - g;
figure, imshow(g2,[]), title('Tophat Transformation');

% Bothat
g3 = imbothat(g,se2);
figure, imshow(g3,[]), title('Bothat Transformation');

% Image Contrast Enhancment using tophat and bothat
g4 = g + (g2 - g3);
figure, imshow(g4,[]), title('Image Contrast Enhancment');

%% Various Techniques of Reconstruction
h = imread('coins.png');
figure, imshow(h,[]);
se3 = strel('disk',5);
he = imerode(h,se);
hobr = imreconstruct(he,h);
figure, imshow(hobr,[]), title('Opening By Reconstruction');
% Closing By Reconstruction
hobrc = imcomplement(hobr);
hobrce = imerode(hobrc,se3);
hobrcbr = imcomplement(imreconstruct(hobrce,hobrc));
figure, imshow(hobrcbr,[]), title('Closing By Reconstruction');