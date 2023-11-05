clear
clc
Image = imread(".\Lab1_Images\book-cover.tif");
image1max = max(Image(:))
image1min = min(Image(:))
%
Image2=Image/16;
image2max = max(Image2(:))
image2min = min(Image2(:))
%figure
%imshow(Image2)
Image3=Image2*16;
imwrite(Image3, '.\Saved_Images\Image3.tif');
image3max = max(Image3(:))
image3min = min(Image3(:))
A = uint8(0:255);
B = (A/16)*16;
ImageDouble=double(Image)/255;
Image2Double=ImageDouble/16;
Image3Double=Image2Double*16;
Image3doublemax = max(Image3Double(:))
Image3doublemin = min(Image3Double(:))
max(max(Image3Double - ImageDouble)) == 0


% 2 Contrast stretching and image histogram
clear
Image = imread(".\Lab1_Images\einstein-low-contrast.tif");
Image=im2double(Image);
%figure
%imshow(Image)
Gmax = max(Image(:))
Gmin = min(Image(:))
% install Image Processing Toolbox
%figure 
%imhist(Image)
K = 1 % for double
GsImage = K * (Image - Gmin)/(Gmax-Gmin);
figure 
imshow(GsImage)
imwrite(GsImage, '.\Saved_Images\EinsteinScaled.tif');
%figure
%imhist(GsImage)


% 3 Image subtraction
clear
ImageMask = imread(".\Lab1_Images\angiography-mask-image.tif");
ImageLive = imread(".\Lab1_Images\angiography-live-image.tif");
ImageMask=im2double(ImageMask);
ImageLive=im2double(ImageLive);

ImageDiff = ImageLive - ImageMask;
figure
imshow(ImageDiff,[]) 


% 4 Histogram equalization
Image = imread(".\Lab1_Images\pollen-lowcontrast.tif");
Image=im2double(Image);
%figured
%imshow(ImageDiff) 
%figure
%imshow(ImageDiff, []) 
min(Image(:))
max(Image(:))
%figure
%imhist(Image)


% 5 Image division and shading correction
ImagePattern = imread(".\Lab1_Images\Shade_pattern.tif");
ImagePattern=im2double(ImagePattern);
%figure
%imshow(ImagePattern)
%figure
%imhist(ImagePattern)
ImagePatternEsti = imread(".\Lab1_Images\Shade_estimate.tif");
ImagePatternEsti=im2double(ImagePatternEsti);
%figure
%imshow(ImagePatternEsti)
imageDiffEsti = ImagePattern ./ ImagePatternEsti;
%figure
%imshow(imageDiffEsti)
%figure
%imhist(imageDiffEsti)

T = 0.3; %??
BW =imbinarize(Image,T);
max(BW(:))


% 6 RGB-images and indexing
I = zeros(400,600,3);
% dim Dimensions: 5:2:9 horizontally and 4:2:4 vertically.
pos1 = round((600/(5+2+9)) * 5); % left to start of col
pos2 = round((600/(5+2+9)) * (5+2)); % left to end of col
pos3 = round((400/(4+2+4)) * 4); % top to start of row
pos4 = round((400/(4+2+4)) * (4+2)); % top to end of row
%col 
I(:,pos1:pos2,2)=1; % G
I(:,pos1:pos2,1)=1; % R
% row
I(pos3:pos4,:,1)=1; % R
I(pos3:pos4,:,2)=1; % G
% blue
I(1:pos3,1:pos1,3)=1; % B
I(pos4:400,pos2:600,3)=1; % B
I(1:pos3,pos2:600,3)=1; % B
I(pos4:400,1:pos1,3)=1; % B
%create a Swedish flag
%figure
%imshow(I)
imwrite(I, '.\Saved_Images\SwedishFlag.tif');