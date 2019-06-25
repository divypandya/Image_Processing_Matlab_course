f1 = imread('text.png');
f2 = imread('text.png');

%% Skeletonizing the binary images
f1 = bwmorph(f1,'skel',Inf);
f2 = bwmorph(f2,'skel',Inf);

%% Spurning Using endpoints()
for k=1:5
    f1 = f1 & ~endpoints(f1);
end
figure,imshow(f1,[]), title('Spurning Using endpoints()');

%% Spuring Using bwmorph
fs = bwmorph(f2,'spur',5);
figure,imshow(fs,[]),title('Spurning Using bwmorph');
