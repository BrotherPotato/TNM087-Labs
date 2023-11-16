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
mean(highPass21(:))
Image4 = imfilter(Image, highPass21, "replicate");
figure(4)
imshow(Image4)
imwrite(Image4, ".\Lab2_SavedImages\P6.tif")
% P8
Image5 = Image4 + Image;
figure(5)
imshow(Image5)
imwrite(Image5, ".\Lab2_SavedImages\P5.tif")
% 2
Sobx = [-1 -2 -1; 0 0 0; 1 2 1];
Soby = [-1 0 1; -2 0 2; -1 0 1];
% 9
Image6 = filter2(Sobx, Image);
figure(6)
imshow(Image6)
imwrite(Image6, ".\Lab2_SavedImages\P9.tif")
% 10 
Image7 = filter2(Soby, Image);
figure(7)
imshow(Image7)
imwrite(Image7, ".\Lab2_SavedImages\P10.tif")

