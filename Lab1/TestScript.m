%Test 1.2 & 1.3
figure(1)
GammaCorrection('.\Lab1_Images\aerialview-washedout.tif', 1, 0.5, 1)

figure(2)
imhist(GammaCorrection('.\Lab1_Images\aerialview-washedout.tif', 1, 0, 0.5))