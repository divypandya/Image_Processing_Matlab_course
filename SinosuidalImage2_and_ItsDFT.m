fx=10;
fy=20;
f=10*max(fx,fy);
T=1/f;
t=0:T:20*pi;
t1=t(1:100);
t2=t(1:100);
x=zeros(100);
for i=1:100
    for j=1:100
        x(i,j)=sin(2*pi*(fx*t1(i)+fy*t2(j)));
    end
end
x=255*(x+1)/2;
F=fftshift(fft2(x));
x1=uint8(ifft2(ifftshift(F)));
I=uint8(x);
figure (1);
imshow(I);
figure (2);
imshow(abs(F));
figure (3);
imshow(x1);