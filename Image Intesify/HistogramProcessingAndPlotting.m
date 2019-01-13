f=imread('moon.tif');
figure, imshow(f);
h=imhist(f); %histogram of input image
p=h./numel(f); %normalized histogram of image
disp(numel(f));
z=imhist(f,25);
horz=linspace(0,255,25);

figure (2)
bar(horz,z);
xlabel('rk intensity level');
ylabel('h(rk)=nk');
axis([0 255 0 40000]);
set(gca,'xtick',0:50:255);
set(gca,'ytick',0:20000:40000);

figure (3)
stem(p);
xlabel('intensity level rk');
ylabel('p(rk)');
title('Probablity of occurance of intensity level rk');

figure (4)
cdf=cumsum(p); %cdf of input intensity levels
x=linspace(0,1,256);
plot(x,cdf);
axis([0 1 0 1]);
set(gca,'xtick',0:0.2:1);
set(gca,'ytick',0:0.2:1);
xlabel('Input intensity levels');
ylabel('Output intensity levels');

%%**Histogram Equalization**%%
g=histeq(f,256);
figure, imshow(g);
figure, imhist(g);


