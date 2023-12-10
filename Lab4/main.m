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
[r,t] = find(H==max(H(:)));
ang = teta(t(1))
%%
% P4 & P5
adjustAngle = (ang-90*sign(ang)) % FIXA (teta-90*sign(teta))
Image1a_rotated = imrotate(image1a,adjustAngle,'bicubic', 'crop');
figure
imshow(Image1a_rotated);
imwrite(Image1a_rotated, '.\Lab4_SavedImages\Image1a_rotated.tif');

% P5
image1b = imread("Lab4_Images\Image1b.tif");
[H, teta, ro] = hough(image1b, 'Rhoresolution',5,'Theta',-90:0.5:89.5); 
%figure
%imshow(H)
%%
% P6
[r,t] = find(H==max(H(:)))
angle = teta(t(1))
%%
% P7 & P8
adjustAngle = angle + 90 % Borde va rätt (teta-90*sign(teta))
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
%figure
%imshow(imageDiscs)
%%
% P11b
MN = [15 100]; 
SE = strel('rectangle',MN); % type, len, deg
imageRectangles = imopen(Image1c_clean,SE);
%figure
%imshow(imageRectangles)
%%
% P11c
r=15; 
SE = strel('disk',r, 0); % type, len, deg
imageDiscsLarge = imopen(Image1c_clean,SE);
%figure
%imshow(imageDiscsLarge)
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
%figure
%imshow(imageRiceOpen)

T_hat = imageRice - imageRiceOpen;
figure
imshow(T_hat);

level = graythresh(T_hat);% "computes a global threshold T from grayscale image I, using Otsu's method"
rice_thresh = T_hat>level; 
figure
imshow(rice_thresh)
imwrite(rice_thresh, ".\Lab4_SavedImages\r_thresh.tif")
%% Labelling and object feature
% P13 
L = bwlabel(Image1c_clean);
imshow(L, [])

imwrite(L, ".\Lab4_SavedImages\im13.tif");
%%
% P14
S = regionprops(L,'Perimeter','Area','EulerNumber')
%Perimeter = S(1).Perimeter;
for n=1:length(S)
 Perimeter(n)=S(n).Perimeter; 
 Area(n)=S(n).Area;
 Euler(n)=S(n).EulerNumber;
end

LargeO=find(Area>3000)

Perimeter(LargeO)

LargeO_Im=zeros(r,c); % creates an empty matrix
for n=1:length(LargeO) % the number of large objects
 LargeO_Im(L==LargeO(n))=1; % Large object area is set to 1
end

figure
imshow(LargeO_Im)
imwrite(LargeO_Im, ".\Lab4_SavedImages\LargeO_Im.tif");
%%
% P15
hist(Perimeter);

SmallO=find(Perimeter<116) % bin right edge of the smallest one

Perimeter1 = Perimeter(SmallO)
Area1 = Area(SmallO)
Euler1 = Euler(SmallO)

%%
% P16
Objects = find(Area > 3000 & Euler > 0)
%Area2 = Area(Objects)
%Euler2 = Euler(Objects)
%Per2 = Perimeter(Objects)

Object_Im = zeros(r,c);
for n=1:length(Objects) % the number of large objects
 Object_Im(L==Objects(n))=1; % Large object area is set to 1
end
figure
imshow(Object_Im)
imwrite(Object_Im, ".\Lab4_SavedImages\Object_Im.tif")
%% BRICK WALL
% 
BrickWall1 = im2double(imread('Lab4_Images\brick1.jpg'));
BrickWall2 = im2double(imread('Lab4_Images\brick2.jpg'));
BrickWall3 = im2double(imread('Lab4_Images\brick3.jpg'));
%figure
%imshow(BrickWall1(:,:,1));
%figure
%imshow(BrickWall2(:,:,2));
%figure
%imshow(BrickWall3(:,:,3));

[IMG, nofr]=CountBrickRows(BrickWall1);
nofr
figure
imshow(IMG)
[IMG, nofr]=CountBrickRows(BrickWall2);
nofr
figure
imshow(IMG)
[IMG, nofr]=CountBrickRows(BrickWall3);
nofr
figure
imshow(IMG)