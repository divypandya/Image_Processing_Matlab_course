%% This scrip focuses at Reconstructing an Image from set of
%% Projections
%% First half deals with obtaining Projection set at different angles
%%  Second half focuses at Reconstructing an Image out of obtained 
%%  projection set
%
%% Obtaining Projections of a Image using Radon functio
% This method uses Parellel Beam Back - Projection technique
%
% Generating a sample image
g1 = zeros(600,600);
g1(100:500,250:350) = 1;
figure, imshow(g1,[]);
%
% generating Phantom Image of our sample image;
g2 = phantom('Modified Shepp-Logan', 600);
figure, imshow(g2,[]);
%
% generating radon tranformation of g1 and g2
theta = 0:0.5:179.5;
[R1, xp1] = radon(g1,theta);
[R2, xp2] = radon(g2,theta);
%
% The first column of R1 is the projection for () = OD, the second column 
% is the projection for () = 0.5D , and so on. The first element of the 
% first column corresponds to the most negative value of p and the last 
% is its largest positive value, and similarly for the other columns. 
% If we want to display R1  so that the projections run from left to 
% right and the first projection appears in the bottom of the image, 
% we have to transpose and flip the array, as follows: 
R1_1 = flipud(R1');
R2_2 = flipud(R2');
figure, imshow(R1_1,[],'XData',xp1([1 end]),'YData',[179.5 0]);
axis xy
axis on
xlabel('\rho'), ylabel('\theta')
%
figure, imshow(R2_2,[],'XData',xp2([1 end]),'YData',[179.5 0]);
axis xy
axis on
xlabel('\rho'), ylabel('\theta')
%
%
%% Reconstructing Image from above set of Projections using iradon func.
% first without using any filter
f1 = iradon(R1,theta,'none');
f2 = iradon(R2,theta,'none');
figure, imshow(f1,[]);
title('Image Reconstruction of Sampled image without using any filter');
figure, imshow(f2,[]);
title('Image Reconstruction of Phantom image without using any filter');
%
% first using Ram-Lak filter (which is also the default filter)
f1_Ram = iradon(R1,theta);
f2_Ram = iradon(R2,theta);
figure, imshow(f1_Ram,[]);
title('Image Reconstruction of Sampled image using Ram-Lak filter');
figure, imshow(f2_Ram,[]);
title('Image Reconstruction of Phantom image using Ram-Lak filter');
%
% first using Hamming filter
f1_Hamming = iradon(R1,theta,'Hamming');
f2_Hamming = iradon(R2,theta,'Hamming');
figure, imshow(f1_Hamming,[]);
title('Image Reconstruction of Sampled image using Hamming filter');
figure, imshow(f2_Hamming,[]);
title('Image Reconstruction of Phantom image using Hamming filter');
