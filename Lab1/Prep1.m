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
Image = imread(".\Lab1_Images\einstein-low-contrast.tif", "tif");
Image=im2double(Image);
figure
imshow(Image)
Gmax = max(Image(:))
Gmin = min(Image(:))
% install Image Processing Toolbox
figure 
imhist(Image)
%histogram(Image)
K = 1 % 255
GsImage = K * (Image - Gmin)/(Gmax-Gmin)
figure
imhist(GsImage)

