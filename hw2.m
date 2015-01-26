% Bahadır Akın Akgül
% Introduction to Image Processing Course Homework 2
% github.com/megatony
% www.akinakgul.com

% PART 1
% In this part, you will implement a Gaussian smoothing filter. The Gaussian’s standard deviation
% (sigma) and the filter size should be adjustable.
% Your program should first compute the coefficients for a square Gaussian mask (N xN) using the
% following equation: (u,v) = (0,0) should correspond to the center of the mask.
% Consider the following image (“sc3.tiff”). You are going to reduce the noise in this image with
% your Gaussian filter. Choose N and sigma so that the noise is effectively reduced with the least
% amount of blurring. Include in your report, various output images with different choices of N
% and sigma, and compare the results.

function gradientBlur( image_file, squareSize, sigmaValue )
defaultImage = imread(image_file);
figure;
title('Original Image');
imshow(defaultImage);
squareSize = 2.*round((squareSize+1)/2)-1;
wide = size(defaultImage,1);
height = size(defaultImage,2);
processedImage = zeros(wide+squareSize-1,height+squareSize-1);
processedImage((squareSize+1)/2:end-(squareSize-1)/2,(squareSize+1)/2:end-
(squareSize-1)/2) = defaultImage;
for i=1:(squareSize-1)/2
processedImage(i,(squareSize+1)/2:end-(squareSize-1)/2) = defaultImage(1,:);
processedImage(i:(squareSize-1)/2,i:(squareSize-1)/2) = defaultImage(1,1);
processedImage((squareSize+1)/2:end-(squareSize-1)/2,i) = defaultImage(:,1);
processedImage((squareSize+1)/2:end-(squareSize-1)/2,end-i+1) =
defaultImage(:,end);
processedImage(i:(squareSize-1)/2,end-(squareSize-1)/2:end) =
defaultImage(1,end);
processedImage(end-i+1,(squareSize+1)/2:end-(squareSize-1)/2) =
defaultImage(end,:);
processedImage(end-(squareSize-1)/2:end,i:(squareSize-1)/2) =
defaultImage(end,1);
processedImage(end-(squareSize-1)/2:end,end-(squareSize-1)/2:end) =
defaultImage(end,end);
end;
functionG = zeros(squareSize);
for i=1:squareSize
 for j = 1:squareSize;
 functionG(i,j)=(1/(2*pi*(sigmaValue)^2))*exp(-
((i*i+j*j)/(2*(sigmaValue)^2)));
 end;
end;
outputFunction = zeros(wide+squareSize-1,height+squareSize-1);
for i=(squareSize+1)/2:wide+(squareSize-1)/2
 for j = (squareSize+1)/2:height+(squareSize-1)/2;
 w = processedImage(i-(squareSize-1)/2:i+(squareSize-1)/2,j-(squareSize-
1)/2:j+(squareSize-1)/2);
 ws = w.*functionG;
 sigmaValue = sum(ws(:));
 outputFunction(i,j) = sigmaValue;
 end;
end;
outputFunction( ~any(outputFunction,2), : ) = [];
outputFunction( :, ~any(outputFunction,1) ) = [];
figure;
title('Processed Image');
imshow(outputFunction,[min(outputFunction(:)) max(outputFunction(:))]);
end

% Testing code

gradientBlur('sc3.tiff',38,12)
gradientBlur('sc3.tiff',38,6)
gradientBlur('sc3.tiff',19,12)
gradientBlur('sc3.tiff',19,6)
gradientBlur('sc3.tiff',19,3)
gradientBlur('sc3.tiff',5,12)

% PART 2
% Consider the “chessboard.tiff” image. Apply various edge detection methods with different
% parameters, until you get an edge map that includes as many borderlines between the black
% and white chess fields as possible. You can use MATLAB’s “edge” function
% (http://www.mathworks.com/help/images/ref/edge.html). Report which methods you have
% tried, and include the resulting edge maps in your report. Give the parameters of the best
% performing method.

image = imread('chessboard.tif');
processedImage = edge(image,'sobel');
imshow(processedImage)
title('Edge detection: Sobel');

image = imread('chessboard.tif');
processedImage = edge(image,'prewitt');
imshow(processedImage)
title('Edge detection: Prewitt');

image = imread('chessboard.tif');
processedImage = edge(image,'roberts');
imshow(processedImage)
title('Edge detection: Roberts');

image = imread('chessboard.tif');
processedImage = edge(image,'log');
imshow(processedImage)
title('Edge detection: Laplacian of Gaussian');

image = imread('chessboard.tif');
processedImage = edge(image,'zerocross');
imshow(processedImage)
title('Edge detection: Zero cross method');

image = imread('chessboard.tif');
processedImage = edge(image,'canny');
imshow(processedImage)
title('Edge detection: Canny');