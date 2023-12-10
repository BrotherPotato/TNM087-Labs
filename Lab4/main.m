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
% P6
[r,t] = find(H==max(H(:)))
angle = teta(t(1))
%%
% P7 & P8
adjustAngle = angle + 90
Image1b_rotated = imrotate(image1b,adjustAngle,'bicubic', 'crop');
figure
imshow(Image1b_rotated);
imwrite(Image1b_rotated, '.\Lab4_SavedImages\Image1b_rotated.tif');
%% Morphology
clear
clc
close all
image1c = imread("Lab4_Images\Image1c.tif");
imshow(image1c)
% P9
% Structuring element
r=3; 
SE = strel('disk',r);

% Morphological openig and closing for noise
image2c = imopen(image1c,SE);
image3c = imclose(image2c,SE);
imshow(image3c)
imwrite(image3c, ".\Lab4_SavedImages\1cNoNoise.tif");
%%
% P10
len = 6;
deg = 0;
SE = strel('line',len,deg);

% Morphological openig and closing for noise
image2c = imopen(image3c,SE);
Image1c_clean = imclose(image2c,SE);
figure
imshow(Image1c_clean)
imwrite(Image1c_clean, ".\Lab4_SavedImages\Image1c_clean.tif");
%%
% P11a
r=10; 
SE = strel('disk',r, 0); % type, len, deg
imageDiscs = imopen(Image1c_clean,SE);
figure
imshow(imageDiscs)
%%
% P11b
MN = [15 100]; 
SE = strel('rectangle',MN); % type, len, deg
imageRectangles = imopen(Image1c_clean,SE);
figure
imshow(imageRectangles)
%%
% P11c
r=15; 
SE = strel('disk',r, 0); % type, len, deg
imageDiscsLarge = imopen(Image1c_clean,SE);
figure
imshow(imageDiscsLarge)
%%
% P11d
imageDiscsSmall = imageDiscs - imageDiscsLarge;
[r,c]=size(image1c);
RGB=zeros(r,c,3);
RGB(:,:,1) = imageRectangles;
RGB(:,:,2) = imageDiscsLarge;
RGB(:,:,3) = imageDiscsSmall;
imshow(RGB)
imwrite(RGB, ".\Lab4_SavedImages\RGB.tif");
%%
% P12
imageRice = imread("Lab4_Images\rice-shaded.tif");
imageRice = im2double(imageRice);
figure
imshow(imageRice)

SE = strel('disk', 40);
imageRiceOpen = imopen(imageRice,SE);
figure
imshow(imageRiceOpen)

T_hat = imageRice - imageRiceOpen;
figure
imshow(T_hat);

level = graythresh(T_hat);% "computes a global threshold T from grayscale image I, using Otsu's method"
rice_thresh = T_hat>level; 
imshow(rice_thresh)
imwrite(rice_thresh, ".\Lab4_SavedImages\r_thresh.png")
%%
% P13