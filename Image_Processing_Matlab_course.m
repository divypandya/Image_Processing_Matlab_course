I=imread('coloredChips.png');
imshow(I);
d=imdistline;
delete(d);
greyImage=rgb2gray(I);
imshow(greyImage);