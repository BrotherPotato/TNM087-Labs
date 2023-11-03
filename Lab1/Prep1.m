Image = imread(".\Lab1_Images\book-cover.tif");
max(Image(:))
min(Image(:))
%
Image2=Image/16;
max(Image2(:))
min(Image2(:))
Image3=Image2*16;
max(Image3(:))
min(Image3(:))
A = uint8(0:255)
B = (A/16)*16
ImageDouble=double(Image)/255;
Image2Double=ImageDouble/16;
Image3Double=Image2Double*16;
max(Image3Double(:))
min(Image3Double(:))

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
%histogram(Image)
K = 1 % 255
GsImage = K * (Image - Gmin)/(Gmax-Gmin);
%figure
%imhist(GsImage)
% 3 Image subtraction
clear
ImageMask = imread(".\Lab1_Images\angiography-mask-image.tif");
ImageLive = imread(".\Lab1_Images\angiography-live-image.tif");
ImageMask=im2double(ImageMask);
ImageLive=im2double(ImageLive);

ImageDiff = ImageLive - ImageMask;
%figure
%imshow(ImageDiff,[]) 
% 4 Histogram equalization
Image = imread(".\Lab1_Images\pollen-lowcontrast.tif");
Image=im2double(Image);
%figure
%imshow(ImageDiff) 
%figure
%imshow(ImageDiff, []) 
min(Image(:))
max(Image(:))
%figure
%imhist(Image)
% 5 Image division and shading correction
Image = imread(".\Lab1_Images\Shade_pattern.tif");
Image=im2double(Image);
