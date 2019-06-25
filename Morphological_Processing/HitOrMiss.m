A = imread('circbw.tif');
figure, imshow(A,[]);
b1 = strel([0 0 0;0 1 1;0 1 0]);
b2 = strel([1 1 1;1 0 0;1 0 0]);
C = bwhitmiss(A,b1,b2);
figure, imshow(C,[]);