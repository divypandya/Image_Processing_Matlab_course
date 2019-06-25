%% Some basic Affine Transformations
% generating forward and inverse functions
forward_fcn = @(wz,tdata) [wz(:,1)+0.4*wz(:,2),wz(:,2)];
inverse_fcn = @(xy,tdata) [xy(:,1)-0.4*xy(:,2),xy(:,2)];
tform1 = maketform('custom',2,2,forward_fcn,inverse_fcn,[]);
WZ = [1 1;3 2];
XY = tformfwd(WZ,tform1);
WZ1 = tforminv(XY,tform1);
vistform(tform1,pointgrid([0 0;100 100]));

%% Projective Transformation
% generating a T matrix
T = [-2.7390 0.2929 -0.6373; 0.7426 -0.7500 0.8088; 2.8750 0.7500 1.0000];
tform2 = maketform('projective',T);
figure, vistform(tform2,pointgrid([0 0;1 1]));

%% Applying Above Geometric Transformations to Images
f = checkerboard(50);
figure, imshow(f,[]);

% affine scaling
sx = 0.75;
sy = 1.25;
T = [sx 0 0; 0 sy 0; 0 0 1];
tform3 = maketform('affine',T);
g = imtransform(f, tform3);
figure, imshow(g,[]);
title('Output of Affine Scaling Trans');

% affine rotation
theta = pi/6;
T = [cos(theta) sin(theta) 0; -sin(theta) cos(theta) 0; 0 0 1];
tform4 = maketform('affine',T);
g = imtransform(f, tform4);
figure, imshow(g, []);
title('Output of Affine Rotating Trans');

% projective trans
T = [0.4788 0.0135 -0.0009 
    0.0135 0.4788 -0.0009 
    0.5059 0.5059 1.0000]; 
tform5 = maketform('projective',T);
g = imtransform(f, tform5);
figure, imshow(g, []);
title('Output of Projective Trans');
