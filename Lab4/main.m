clear
clc
close all

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
imwrite(H1, '.\Lab4_SavedImages\H1.tif')
%%
% P2 & P3
[r,t] = find(H==max(H(:)))
angle = teta(t(1))
%%
% P4
adjustAngle = angle - 90;
Image1a_rotated = imrotate(image1a,adjustAngle,'bicubic', 'crop');
figure
imshow(Image1a_rotated);
imwrite(Image1a_rotated, '.\Lab4_SavedImages\Image1a_rotated.tif');
%%
% P5
image1b = imread("Lab4_Images\Image1b.tif");
[H, teta, ro] = hough(image1b, 'Rhoresolution',5,'Theta',-90:0.5:89.5); 
imshow(H)
%%
% p6