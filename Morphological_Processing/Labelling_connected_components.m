f = imread('text.png');
figure,imshow(f,[]),title('Original Image');

%% Obtaining L = Label Matrix and n = # connected components
[L , n] = bwlabel(f);
% by default bwlabel calculates 8-connected components

%% Marking Center of Mass of each Connected Component using L
figure,imshow(f,[]),title('labelled image');
hold on  % So later plotting commands plot on top of the image.
for k = 1:n
    [r,c] = find(L==k); % find indices of Kth connected component
    rmean = mean(r);
    cmean = mean(c);
    % calculate center of mass using rows and cols
    plot(cmean,rmean,'Marker', 'o', 'MarkerEdgeColor', 'k', ... 
        'MarkerFaceColor', 'k', 'MarkerSize', 3);
    plot(cmean,rmean,'Marker','*', 'MarkerEdgeColor', 'w','MarkerSize',2);
end