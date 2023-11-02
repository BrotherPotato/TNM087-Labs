Image = imread(".\Lab1_Images\book-cover.tif")
max(Image(:))
min(Image(:))
%
Image2=Image/16;
max(Image(:))
min(Image(:))
Image3=Image2*16;
max(Image(:))
min(Image(:))
A = uint8(0:255)
B = (A/16)*16