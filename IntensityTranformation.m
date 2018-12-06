f=imread('moon.tif'); % f is our input image
figure (1)
imshow(f);

%%**IMADJUST Function**%%
g=imadjust(f,[0 1],[1 0],0.4);
%for high_out > low_out (i.e here [1 0]) output image is negative image
figure (2)
imshow(g);
%"stretchlim" to use imadjust without specifying low_in and high_in
low_high=stretchlim(f);
disp(low_high);
g1=imadjust(f,low_high,[1 0]);
figure (3)
imshow(g1);

%%**Logarithmic Tranformation**%%
% of the form g=c*log(1+f);
g2=2*log(1+double(f));
g2=im2uint8(mat2gray(g2));
figure (4)
imshow(g2);

%%**Contrast-Stretching Transformation**%%
% of the form s=1/(1+(m/r)^E)) where r is input intensity
m=0.5;
E=1.5;
g3=im2uint8(mat2gray((1./(1+(m./double(f)).^E))));
figure (5)
imshow(g3);