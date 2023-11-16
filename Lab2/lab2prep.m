clear
clc
% P1
Image = imread(".\Lab2_Images\TestPattern.tif");
Image=im2double(Image);
boxKernerl9 = ones(9)/9^2;
ImageP1 = conv2(Image, boxKernerl9);
figure(1)
imshow(ImageP1) 
imwrite(ImageP1, ".\Lab2_SavedImages\P1.tif")
% P2
boxKernerl21 = ones(21)/21^2;
ImageP2 = conv2(Image, boxKernerl21);
figure(2)
imshow(ImageP2) 
imwrite(ImageP2, ".\Lab2_SavedImages\P2.tif")
% P5
Image3 = imfilter(Image, boxKernerl21, "replicate");
figure(3)
imshow(Image3)
imwrite(Image3, ".\Lab2_SavedImages\P3.tif")
% P6
impulse21 = zeros(21);
impulse21(11,11) = 1;
highPass21 = impulse21 - boxKernerl21;
Image4 = imfilter(Image, highPass21, "replicate");
figure(4)
imshow(Image4)
imwrite(Image4, ".\Lab2_SavedImages\P6.tif")
