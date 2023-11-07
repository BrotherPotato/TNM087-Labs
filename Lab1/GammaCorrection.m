function GImage = GammaCorrection( OImage, Gamma, Lower, Upper )
%function GImage = GammaCorrection( OImage, Gamma, Lower, Upper )

%   Implement gamma correction:
%   Truncate the original gray values using lower and upper quantiles
%   (Lower, Upper) and then apply gamma correction with exponent Gamma 
%   to the input image OImage,
%   the result is the double image GImage with maximum gray value one
%
%% Who has done it
%
% Authors: Magnus Kling LiU-ID: magkl572, Max Wiklundh LiU-ID: maxwi824
% You can work in groups of max 2 students
%
%% Syntax of the function
%
%   Input arguments:
%       OImage: Grayscale image of type uint8 or double
%       Gamma: exponent used in the gamma correction, 
%       Lower: value in the range 0, 1
%       Upper: value in the range 0, 1 and lower < upper
%       Lower and Upper are quantile values. 
%   Output argument: GImage: gamma corrected gray value image of type double
%
% You MUST NEVER change the first line
%
%% Basic version control (in case you need more than one attempt)
%
% Version: 1
% Date: today's date
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
%% Image class handling
% Make sure that you can handle input images of class uint8, uint16 and double 

Im = imread(OImage); % reads a imagefile
Im = im2double(Im); % converts image to double if needed (if it is a uint8 or uint16)

%% Compute lower and upper gray value boundaries. 
% Use the parameteers Lower and Upper to find the corresponding gray values
% for the boundaries
% Look at the help function for the command quantile
%
lowgv = quantile(Im(:),Lower); % Lower-bound gray value
uppgv = quantile(Im(:),Upper); % Upper-bound gray value



%% Compute a scaled version GImage of the image, where: 
% the lower-bound gray value is zero 
% the upper-bound gray value is one 
% because 0^Gamma = 0 and 1^Gamma = 1
%
GImage = (Im - lowgv)/(uppgv-lowgv);
GImage = min(GImage, 1); % set each pixel to the min between the pixel value and 1
GImage = max(GImage, 0); % set each pixel to the max between the pixel value and 0



%% Gamma mapping of the previous result 
% Make sure that your image is in the range [0,1] before applying gamma
% correction!
%
GImage = GImage.^Gamma; % apply gamma correction (which is an elementwise operation)

imshow(GImage) % show the image



end

%% Experiments with your code
%
% Use your code to modify the images 'aerialview-washedout.tif' and
% 'spillway-dark.tif' for different values for Gamma, Lower and Upper
% Write some comments on your experiments and propose some good parameters
% to use (don't forget to comment your text so that the code will work)
% 
% 'spillway-dark.tif':
%
% 0.6, 0.01, 0.80
% to low gamma makes some stones look grainy
% a lower value of 0.01 in order to give a bit more contrast
% a upper value of 0.80 since higer values do not change anything and lower
% values makes the water completely white
%
% 'aerialview-washedout.tif'
%
%  2.9, 0.01, 0.98
% a gamma around 2.9 gives good contrast
% a lower value of 0.01 to make the image look less bleak
% a higher value of 0.98 lower values makes some parts completely white
%
%
% The image ?IntensityRampGamma25.tif? illustrates the effect of an intensity
% ramp displayed on a monitor with gamma =2.5. 
% Which value for gamma should you use in your code to correct the image to appear as a linear intensity ramp?
% (Set Lower=0 and Upper=1)
% Gamma = 0.4 då 1/2.5 = 0.4