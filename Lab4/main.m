clear
clc

image1a = imread("Lab4_Images\Image1a.tif");
image1b = imread("Lab4_Images\Image1b.tif");
figure 
imshow(image1a)
figure
imshow(image1b)

[H, teta, ro] = hough(image1a, 'Rhoresolution',5,'Theta',-90:0.5:89.5); 
%%
% P1 
% contrast stretching
maxValue = max(H(:));
minValue = min(H(:));
H1 = (H-minValue)/(maxValue-minValue);
figure 
imshow(H1)
imwrite(H1, '.\Lab2_SavedImages\H1.png')
%%
% P2
[r,t] = find(H==max(H(:)))
angle = teta(t(1))
%%
