clear
clc
% P1
Image = imread(".\Lab2_Images\TestPattern.tif");
Image=im2double(Image);
boxKernerl9 = ones(9)/9^2;
ImageP1 = conv2(Image, boxKernerl9);
figure(1)
imshow(ImageP1) 
imwrite(ImageP1, ".\Lab2_SavedImages\Image1.tif")
% P2
boxKernerl21 = ones(21)/21^2;
ImageP2 = conv2(Image, boxKernerl21);
figure(2)
imshow(ImageP2) 
imwrite(ImageP2, ".\Lab2_SavedImages\Image2.tif")
% P5
Image3 = imfilter(Image, boxKernerl21, "replicate");
figure(5)
imshow(Image3)
imwrite(Image3, ".\Lab2_SavedImages\Image3.tif")
% P6
impulse21 = zeros(21);
impulse21(11,11) = 1;
highPass21 = impulse21 - boxKernerl21;
mean2(highPass21)
s = mean(highPass21(:))
sum(highPass21(:))
Image4 = imfilter(Image, highPass21, "replicate");
figure(4)
imshow(Image4)
imwrite(Image4, ".\Lab2_SavedImages\Image4.tif")
% P8
Image5 = Image4 + Image;
figure(5)
imshow(Image5)
imwrite(Image5, ".\Lab2_SavedImages\Image5.tif")
% P9
Sobx = [-1 -2 -1; 0 0 0; 1 2 1];
Soby = [-1 0 1; -2 0 2; -1 0 1];
Image6 = filter2(Sobx, Image);
figure(6)
imshow(Image6)
imwrite(Image6, ".\Lab2_SavedImages\Image6.tif")
% P10 
Image7 = filter2(Soby, Image);
figure(7)
imshow(Image7)
imwrite(Image7, ".\Lab2_SavedImages\Image7.tif")
% P11
Image8 = sqrt(Image6.^2 + Image7.^2);
figure(8)
imshow(Image8)
imwrite(Image8, ".\Lab2_SavedImages\Image8.tif")
%%
% 2
clear
zoneImage = imread(".\Lab2_Images\zoneplate.tif");
zoneImage=im2double(zoneImage);
%figure(9)
%imshow(zoneImage);
box21 = ones(21)/(21^2);
box9 = ones(9)/(9^2);
[olp, ohp, obr, obp, oum, ohb] = myfilter(zoneImage, box9, box21);
figure(10)
imshow(olp)
figure(11)
imshow(ohp)
figure(12)
imshow(obr)
%figure(13)
%imshow(obp)
%figure(14)
%imshow(oum)
%figure(15)
%imshow(ohb)

%%
% 3
clear
clc
%close all
figure(16)
sexe = imread(".\Lab2_Images\test1.tif");
sexe = im2double(sexe);
imshow(eliminateobjects(sexe, 2))

figure(17)
sexe1 = imread(".\Lab2_Images\test2.tif");
sexe1 = im2double(sexe1);
imshow(eliminateobjects(sexe1, 6))

figure(18)
sexe2 = imread(".\Lab2_Images\test3.tif");
sexe2 = im2double(sexe2);
imshow(eliminateobjects(sexe2, 19))

figure(19)
sexe3 = imread(".\Lab2_Images\test4.tif");
sexe3 = im2double(sexe3);
imshow(eliminateobjects(sexe3, 2));
eliminateobjects(sexe3, 2)
