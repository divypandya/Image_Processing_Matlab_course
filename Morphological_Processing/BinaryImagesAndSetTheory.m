%% Reading two Binary Images
A = imread('text.png');
figure, imshow(A,[]);
B = imread('circles.png');
figure, imshow(B,[]);

%% Some Set Operations
%  complement
C1 = ~A;
figure, imshow(C1,[]);

%  Union
C2 = A | B;
figure, imshow(C2,[]);

%  Intersection
C3 = A & B;
figure, imshow(C3,[]);

%  Set Difference
C4 = A & (~B);
figure, imshow(C4,[]);