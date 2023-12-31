% prep 1

cTP = imread(".\lab3_images\characterTestPattern.tif");
cTP = im2double(cTP);
%imshow(cTP);

Spec1 = fftshift(fft2(cTP));
Spec1 = log(1 + abs(Spec1));
Spec1 = Spec1/max(Spec1(:));

figure(1)
imshow(Spec1)
imwrite(Spec1, ".\Lab3_savedImages\Spec1.tif")

%prep 2

cTP_shift = circshift(cTP, [100 -200]);
imshow(cTP_shift)

Spec2 = fftshift(fft2(cTP_shift));
Spec2 = log(1 + abs(Spec2));
Spec2 = Spec2/max(Spec2(:));

figure(2)
imshow(Spec2)
imwrite(Spec2, "Lab3_savedImages\Spec2.tif")

% prep 3

%imshow(Spec2 - Spec1)

% prep 4

cTP_rot =imrotate(cTP, 15, "bicubic");

Spec3 = fftshift(fft2(cTP_rot));
Spec3 = log(1 + abs(Spec3));
Spec3 = Spec3/max(Spec3(:));

figure(3)
imshow(Spec3)
imwrite(Spec3, "Lab3_savedImages\Spec3.tif")

%%
% prep 6

cTP2 = imread(".\lab3_images\characterTestPattern_2.tif");
cTP2 = im2double(cTP2);
figure (4)
imshow(cTP2)


Spec4 = fftshift(fft2(cTP2));
Spec4 = log(1 + abs(Spec4));
Spec4 = Spec4/max(Spec4(:));

figure(5)
imshow(Spec4)
imwrite(Spec4, ".\Lab3_savedImages\Spec4.tif")

%%
% prep 9

cTP3 = imread(".\lab3_images\characterTestPattern_3.tif");
cTP3 = im2double(cTP3);
figure (6)
imshow(cTP3)


Spec5 = fftshift(fft2(cTP3));
Spec5 = log(1 + abs(Spec5));
Spec5 = Spec5/max(Spec5(:));

figure(7)
imshow(Spec5)
imwrite(Spec5, ".\Lab3_savedImages\Spec5.tif")


%%a
%Part 2

% 11

v2 = imread(".\Lab3_Images\verticalbars_2.tif");
% index P = 2 is the vertical bars
%imshow(v2)

Spec6 = fftshift(fft2(v2));
Spec6 = log(1 + abs(Spec6));
Spec6 = Spec6/max(Spec6(:));

figure(8)
imshow(Spec6)

%12

v4 = imread(".\Lab3_Images\verticalbars_4.tif");
imshow(v4)

Spec7 = fftshift(fft2(v4));
Spec7 = log(1 + abs(Spec7));
Spec7 = Spec7/max(Spec7(:));

figure(9)
imshow(Spec7)

%%
%Part 3

%14 och 15
E1 = imread(".\Lab3_Images\Einstein1.jpg");
E1 = im2double(E1);

E2 = imread(".\Lab3_Images\Einstein2.jpg");
E2 = im2double(E2);

E1FFTS1 = fftshift(fft2(E1));
E2FFTS1 = fftshift(fft2(E2));

AngE1 = angle(E1FFTS1);
AngE2 = angle(E2FFTS1);

Spec8 = abs(E1FFTS1);
Spec9 = abs(E2FFTS1);

E1_E2 = real(ifft2(Spec8.*exp(1i*AngE2)));
figure(10)
imshow(E1_E2)
imwrite(E1_E2, ".\Lab3_savedImages\E1_E2.tif")

E2_E1 = real(ifft2(Spec9.*exp(1i*AngE1)));
figure(11)
imshow(E2_E1)
imwrite(E2_E1, ".\Lab3_savedImages\E2_E1.tif")

%%
clear;
clf
close all
ein1 = im2double(imread(".\Lab3_Images\Einstein_sinus_1.tif"));
ein2 = im2double(imread(".\Lab3_Images\Einstein_sinus_2.tif"));
einOdd = im2double(imread(".\Lab3_Images\Einstein_odd_sinus.tif"));
aus = im2double(imread("Lab3_Images\astronaut-interference.tif"));


%%
RemoveSinusoidalNoise(aus, 1);
%%
close all
RemoveSinusoidalNoise(ein1, 15);
%%
RemoveSinusoidalNoise(RemoveSinusoidalNoise(ein2, 1), 1);
%%
RemoveSinusoidalNoise(einOdd, 1);
%%
RemoveSinusoidalNoise(ein1, 5);
%%
clear
clf
close all
ein1 = im2double(imread("Lab3_Images\Einstein1.jpg"));
ein2 = im2double(imread("Lab3_Images\Einstein2.jpg"));
cTP = im2double(imread("Lab3_Images\characterTestPattern.tif"));

%%

[lp, hp] = FilterFreq(ein1, 90);
figure
imshow(lp);
figure 
imshow(hp);
%%

FilterFreq(ein2, 1);
%%

FilterFreq(cTP, 1);



