f=imread('cameraman.tif'); %input image
figure, imshow(f);
w=ones(3); %Mask or Kernal
%imfilter to find convolution and correlation of f and w
gconv=imfilter(f,w,'conv','replicate'); %convolution of f and w
figure, imshow(gconv);
gcorr=imfilter(f,w,'corr','replicate'); %correlation of f and w
figure, imshow(gcorr);

%%**Special Spatial Filters**%%
%fspecial command generates a filter mask for e.g.
f1=imread('moon.tif');
figure, imshow(f1);
ws=fspecial('laplacian');%generates laplacian mask
wh=[1 1 1;1 -8 1;1 1 1]; %laplacian mask with -8 at its center
g1=imfilter(double(f1),ws,'conv','replicate');
g2=imfilter(double(f1),wh,'conv','replicate');
figure, imshow(uint8(g1),[]); %plotting floating point filtered image
figure, imshow(g2,[]);
%enhancement g=f(x,y)-c*laplacian(f(x,y));
g3=double(f1)-g1; %enhancement of floating point image
figure, imshow(uint8(g3));
g4=double(f1)-g2;
figure, imshow(uint8(g4));
