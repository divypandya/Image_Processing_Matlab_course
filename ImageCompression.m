%Wavelet Thresholding
%Threshold the wavelet coefficients retaining only the largest x% of the
%coefficients. Plot the reconstructed image.
clc;
clear;
close all;
im=imread('cameraman.tif');
figure;
imshow(im,[])
title('Given image');
wavename = 'haar';
[cA,cH,cV,cD] = dwt2(im2double(im),wavename);
[cAA,cAH,cAV,cAD] = dwt2(cA,wavename); % Recompute Wavelet of Approximation Coefs.
Level2=[cAA,cAH; cAV,cAD]; %contacinat
figure;
imshow([Level2,cH; cV,cD],[],'Colormap',gray); %2 level
title('Wavelet coefficients for the given image');
im = double(im);
[c,s]=wavedec2(im,2,'haar'); %Decompose the image into two levels
im_W = c; % Actual wavelet coefficients 
m = sort(abs(im_W(:)),'descend'); %Coefficients sorted in descending order
figure;
plot(m,'b'); % Plotting actual wavelet coefficients
hold on;
x = input('To retain the largest x% of the coefficients ');
ndx = floor(length(m)*x/100); %Select index of the final value to keep
thresh = m(ndx); % Select the threshold value of the array
im_W_th  = im_W .* (abs(im_W) > thresh); % Retain only largest x% in array  
m1 = sort(abs(im_W_th(:)),'descend'); % Sort the thresholded values
m1 = m1';
plot(m1,'r'); % Plotting Truncated wavelet coeffients
title('Sorted values of wavelet coefficients');
legend('Original coefficients','Truncated coefficients')
xlabel('Sorted indices');
ylabel('Wavelet coefficient magnitude');
im_rec = waverec2(im_W_th,s,'haar'); % Reconstructed image
figure;
imshow(abs(im_rec),[]), title('Reconstructed image');

%%% calculating error..

% [m,n] = size(im);
% 
% for i =1:m
%     for j = 1:n
%         mse_img(i,j) = mse(abs(im_rec(i,j)),im(i,j));
%     end
% end
% figure, title('Error map'), imagesc(mse_img), colormap(gray)
