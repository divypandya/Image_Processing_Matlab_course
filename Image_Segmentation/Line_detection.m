f = imread('testpat1.png');
figure, imshow(f,[]);

%% Running a mask and filter the image with it
w = [2 -1 -1; -1 2 -1; -1 -1 2];
g = imfilter(tofloat(f),w);
figure, imshow(g,[]);
g = abs(g);
figure, imshow(g,[]), title('showing abs value of g');
T = max(g(:));
g = g>=T;
figure, imshow(g,[]), title('thresholding the previous image');

%% Edge Detecting using edge()
% Sobel,Prewitt, Roberts edge, Laplacian of Gaussian
f = tofloat(f);
[gsobel,ts] = edge(f,'sobel');
[glog,tlog] = edge(f,'log');
[gcanny,tcanny] = edge(f,'canny');
subplot(3,2,1)
imshow(gsobel,[]),title('Sobel Default');
subplot(3,2,2)
imshow(glog,[]),title('LoG Default');
subplot(3,2,3)
imshow(gcanny,[]),title('Canny Default');
gsobel_best = edge(f,'sobel',0.3);
glog_best = edge(f,'log',0.025,2.25);
gcanny_best = edge(f,'canny',[0.20,0.35],1.5);
subplot(3,2,4)
imshow(gsobel_best,[]), title('Sobel w  Param');
subplot(3,2,5)
imshow(glog_best,[]), title('Log w param');
subplot(3,2,6)
imshow(gcanny_best,[]), title('Canny w param');


%% Linking procedures to assemble edge pixels into a meaning edge using
%  Hough Transform
f = gcanny_best;
[H, theta, rho] = hough(f,'thetaresolution',0.2);
figure, imshow(H,'XData',theta,'YData',rho,'InitialMagnification','fit');
axis on, axis normal
xlabel('\theta'), ylabel('\rho');
peaks = houghpeaks(H,5);
hold on
plot(theta(peaks(:,2)),rho(peaks(:,1)),'linestyle','none','marker','s',...
    'color','white');
hold off
lines = houghlines(f,theta,rho,peaks);
figure, imshow(f), hold on
for k=1:length(lines)
    xy = [lines(k).point1,lines(k).point2];
    plot(xy(:,1),xy(:,2),'Linewidth',4,'Color',[0.8 0.8 0.8]);
end
