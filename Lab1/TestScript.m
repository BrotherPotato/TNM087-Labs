% Test 1.2 
clear
clc
close all
Im = imread('.\Lab1_Images\aerialview-washedout.tif'); % reads a imagefile
figure(1)
GammaCorrection(Im, 2.0, 0, 1);

%figure(2)
%GammaCorrection(Im, 2.5, 0, 1)

%figure(3)
%GammaCorrection(Im, 2.9, 0.01, 0.80)
%Im = imread('.\Lab1_Images\spillway-dark.tif'); % reads a imagefile
%figure(4)
%GammaCorrection(Im, 0.6, 0.01, 0.80)

%figure(5)
%GammaCorrection(Im, 0.7, 0, 1)
%Im = imread('.\Lab1_Images\IntensityRampGamma25.tif'); % reads a imagefile
%figure(6)
%GammaCorrection(Im, 0.4, 0, 1)
%figure(7)
%imhist(GammaCorrection(Im, 0.4, 0, 1))

% Test 1.3
%figure(10)
RGB_Image = imread('.\Lab1_Images\RGBflower.tif');
IR_Image = imread('.\Lab1_Images\IRflower.tif');
LevelSlicing(RGB_Image, IR_Image, 0.1);
%fh1=figure; imshow(IR_Image);
%set(fh1,'NumberTitle','off','Name','Select a pixel for reference intensity level')
%[x,y] = ginput(1); % x and y are the coordinates of the reference pixel 
%size(IR_Image)
%[nr,nc,nch] = size(RGB_Image)
%x = round(x) % rounds each coordinate value to correspond
%y = round(y) % rounds each coordinate value to correspond