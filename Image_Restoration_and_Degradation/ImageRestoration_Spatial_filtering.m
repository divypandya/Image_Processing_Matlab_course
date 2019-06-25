%Restoring Image in Spatial Domain
f=imread('cameraman.tif');
[M,N]=size(f);
R=imnoise2('salt & pepper',M,N,0.1,0);
gp=f;
gp(R==0)=0;
figure, imshow(gp,[]);
title('Image with Pepper Noise only');
R=imnoise2('salt & pepper',M,N,0,0.1);
gs=f;
gs(R==1)=255;
figure, imshow(gs,[]);
title('Image with Salt Noise only');
%
%fitlering using Contra-harmonic Filter
fp=spfilt(gp,'chmean',3,3,1.5);
figure, imshow(fp,[]);
title('Filtered Pepper Noise using ContraHarmonic');
fs=spfilt(gs,'chmean',3,3,-1.5);
figure, imshow(fs,[]);
title('Filtered Salt Noise using ContraHarmonic');
%
%filtering using Min-Max Filter
fpmax=spfilt(gp,'max',3,3);
figure, imshow(fpmax,[]);
title('Filtering Pepper Noise Using Max Filter');
fsmin=spfilt(gs,'min',3,3);
figure, imshow(fsmin,[]);
title('Filtering Salt Noise Using Min Filter');
%
%
% Filtering Using Adaptive Filter Technique
% Adaptive Median Filter using adpmedian();
g=imnoise(f,'salt & pepper',0.05);
figure, imshow(g,[]);
title('Image with Salt & Pepper Noise');
% using normal median filter
f1=spfilt(g,'median',3,3);
figure, imshow(f1,[]);
title('Filtering Using Normal Median Filter');
% using Adpative Median Filter
f2=adpmedian(g,3);
figure, imshow(f2,[]);
title('Filtering Using Adaptive Median Filter');
