x=zeros(100); %generating a 100*100 checkerBoard Image
x(1:2:end,2:2:end)=1;
x(2:2:end,1:2:end)=1;
F=fftshift(fft2(x));
x1=ifft2(ifftshift(F));
figure (1);
imshow(x);
figure (2);
imshow(abs(F),[]);
figure (3);
imshow(x1);