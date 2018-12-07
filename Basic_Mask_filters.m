I=imread('cameraman.tif');
figure, imshow(I);

%making a function handle which calculates 2d Convolution of 
%kernal/mask and image and convert it
%into uint8
Conv2d=@(kernal,image) uint8(conv2(kernal,image));

%low pass filtering ( image-blurring)
lowPass1=[1 1 1;1 1 1;1 1 1]/9;
I1=Conv2d(lowPass1,I);
figure, imshow(I1);

%high pass filtering (edge-detection)
highPass=[-1 -1 -1;-1 8 -1;-1 -1 -1];
I2=Conv2d(highPass,I);
figure, imshow(I2);

%Image-sharpen
sharp=[0 -1 0;-1 5 -1;0 -1 0];
I3=Conv2d(sharp,I);
figure, imshow(I3);

%Band-Pass filter i.e. lowPass1-lowPass2
lowPass2=[0 4 0; 4 8 4;0 4 0]/24;
BandPass=lowPass1-lowPass2;
I4=Conv2d(BandPass,I);
figure, imshow(I4);