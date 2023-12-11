function [IMG, noRice, noSmallMacs, noLargeMacs]=CountObjects(in)
%% Lab4, Task 3
%% Finds the number of rows of bricks
%
% Counts objects of different class and displays them in different colors. 
% Input images containing three classes of ojects: grains of rice, snall
% macaronis and large macaronis
%
%% Who has done it

% Author: Magnus Kling LiU-ID: magkl572 
% Co-author: Max Wiklundh LiU-ID: maxwi824
% Co-author: You can work in groups of max 2, this is the LiU-ID/name of
% the other member of the group
%
%% Syntax of the function
%      Input arguments:
%           in: the original input RGB color image of type double scaled between 0 and 1
%          
%      Output arguments:
%           IMG: the output RGB color image, displaying the three
%           diffferent classes of objects in different colors
%           noRice: Number of grains of rice in the input image
%           noSmallMacs: Number of small macaromis in the input image
%           noLargeMacs: Number of large macaromis in the input image
%
% You MUST NEVER change the first line
%
%% Basic version control (in case you need more than one attempt)
%
% Version: 1
% Date: 2023-12-11
%
% Gives a history of your submission to Lisam.
% Version and date for this function have to be updated before each
% submission to Lisam (in case you need more than one attempt)
%
%% General rules
%
% 1) Don't change the structure of the template by removing %% lines
%
% 2) Document what you are doing using comments
%
% 3) Before submitting make the code readable by using automatic indentation
%       ctrl-a / ctrl-i
%
% 4) Often you must do something else between the given commands in the
%       template
%
%% Here starts your code.
% Write the appropriate MATLAB commands right after each comment below.
%

%% Make the input color image grayscale, 
% by choosing its most appropriate channel 

%BLUE has the best contrast between the objects and the background
bgray = in(:,:,3); % The grayscale version of the input color image
    
%% Threshold your image
% to separate the objects from the backgroound

b_thresh = bgray < graythresh(bgray); % The thresholded image
    
%% Clean up the binary image 
% Use morphological operations to clean up the binary image from noise. 
% Especially make syre that your cleaned image don't contain any false object
% (i.e. single foreground pixels, or groups of connected foreground pixels, 
% that do not belong to the object classes

r = 4; % good radius for all images 
SE = strel('disk',r); % we used disk elements since we thought it would work well with the rice

% Morphological openig and closing for noise
b_thresh = imopen(b_thresh,SE);
b_thresh = imclose(b_thresh,SE);
%imshow(b_thresh)

b_clean = b_thresh; % Cleaned up binary image

%% Labelling
%  Use labelling to assign every object a unique number

% connectivity 8 (default), labels each object
L = bwlabel(b_clean); % Labelled image
    
%% Object features
% Compute relevant object features that you can use to classify 
% the three classes of objects

% we decided to only use area to classify each object
Stats = regionprops(L, 'Area'); % Create struct with relevant object properties
% we add the values for each area to a vector
for n=1:length(Stats)
    Area(n)=Stats(n).Area;
end

%% Object classification
% Based on your object features, classify the objects, i.e. for each
% labelled object: decide if it belongs to the three classes: Rice, SmallMacs, or LargeMacs 
% In case you didn't suceed in cleaining up all false objects, you should
% discard them here, so they don't count as the classes of objects

% we group each object by creating 2 bounds to divide them in to 3 groups
upperbound = 6000;
lowerbound = 2000;

Rice = find(Area<lowerbound);% Vector containing the labels of all objects classifies as rice
SmallMacs = find(Area>lowerbound & Area < upperbound); % Vector containing the labels of all objects classifies as SmallMacs
LargeMacs = find(Area>upperbound);% Vector containing the labels of all objects classifies as LargeMacs

%% Count the objects for each class.

noRice = length(Rice);% Number of rices
noSmallMacs = length(SmallMacs); % Number of small macoronis
noLargeMacs = length(LargeMacs);% Number of large macoronis

%% Create an RGB-image, IMG, displaying the different classes of objects in different colors
% Use for example: Colored objects on black background, colored objects on
% the original background, highlight the borders of the objects in the
% original image in different colors (or some other way of displayig the
% objects)

% we create a new image "RGB" with all zeroes
[M,N] = size(L);
RGB = zeros(M,N,3);
% for each object group (rice, smallmacs, largemacs), we iterate through
% each object and add a 1 where we find a part of this object, 
% for example: L == Rice(n) gives a 1 where there are rice in the image L,
% we add this to RGB(:,:,1) through "RGB(:,:,1) = RGB(:,:,1) +" to keep the
% previous values
for n=1:noRice
RGB(:,:,1) = RGB(:,:,1) + (L == Rice(n));
end
for n=1:noSmallMacs
RGB(:,:,2) = RGB(:,:,2) + (L == SmallMacs(n));
end
for n=1:noLargeMacs
RGB(:,:,3) = RGB(:,:,3) + (L == LargeMacs(n));
end
IMG = RGB; % Output RGB-image displaying the three classes of objects in different colors

%% Test your code on the three test images
% % Your code is supposed to work for the three images:
%
% Image          noRice   noSmallMacs   noLargeMacs
% MacnRice1.tif  48       12            6
% MacnRice2.tif  60       14            6
% MacnRice3.tif  42       11            5



