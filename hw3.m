% Bahadır Akın Akgül
% Introduction to Image Processing Course Homework 3
% github.com/megatony
% www.akinakgul.com

% STEP 1
% Apply OTSU’s thresholding method to the image, using MATLAB functions “graythresh”
% and “im2bw”. Report the threshold returned by the “graythresh” function and display the
% thresholded image. Is it possible to extract all the characters from the resulting binary image?
image = imread('document1.bmp');
level = graythresh(image);
processedImage = im2bw(image,level);
imshow(image)
title('Original Image - Otsu thresholding method (Step1)');
imshow(processedImage)
title('Processed Image - Otsu thresholding method (Step1)');
% STEP 2
% Try a couple of other threshold values on this image, and display the results. Can you
% find a global threshold that will make it possible to extract all the characters from the resulting
% binary image?
thr05Image = im2bw(image,0.5);
figure(1)
imshow(thr05Image)
title('Processed Image - Otsu thresholding method with 0.5 threshold (Step2)');
thr02Image = im2bw(image,0.2);
figure(2)
imshow(thr02Image)
title('Processed Image - Otsu thresholding method with 0.2 threshold (Step2)');
thr03Image = im2bw(image,0.3);
figure(3);
imshow(thr03Image)
title('Processed Image - Otsu thresholding method with 0.3 threshold (Step2)');
thr025Image = im2bw(image,0.25);
figure(4)
imshow(thr025Image)
title('Processed Image - Otsu thresholding method with 0.25 threshold (Step2)');
thr0225Image = im2bw(image,0.225);
figure(5)
imshow(thr0225Image)
title('Processed Image - Otsu thresholding method with 0.225 threshold (Step2)');
% STEP 3
% Write a MATLAB program that calculates the local mean of NxN neighborhood of each
% pixel. In other words, you are going to calculate a matrix M:
% M(i,j) = mean(NxN window of the original image centered at pixel location (i,j))
% Display the resulting image M. You can replicate the border pixels using MATLAB’s padarray
% function. Choose N as 7.
pad = padarray(image,[3,3],'replicate','pre');
pad = uint32(pad);
processed_pad = zeros(460,911);
localMean = uint32(0);
for i=1:454
for j=1:905
for k=i:i+6
for m=j:j+6
localMean = localMean + pad(k,m);
end
end
processed_pad(i+3,j+3) = localMean/49;
localMean = 0;
end
end
% STEP 4
% Apply the following thresholding scheme to the original image I :
% BW(i,j) = 1 if I(i,j) > M(i,j)
% BW(i,j) = 0 otherwise
% Display the resulting binary image BW. Comment on the result.
grayImage = rgb2gray(image);
finalImage_A = zeros(457,908);
finalImage_B = zeros(457,908);
meanImage = imresize(imcrop(processed_pad, [4, 4, 904, 453]), [457 908]);
for i=1:457
for j=1:908
if(grayImage(i,j)>meanImage(i,j))
finalImage_A(i,j) = im2bw(image(i,j),1);
else
finalImage_A(i,j) = im2bw(image(i,j),0);
end
end
end
figure(1);
imshow(finalImage_A);
title('Step 4 - Processed Image');
% STEP 5
% This time, apply the following thresholding scheme to the original image I:
% BW(i,j) = 1 if I(i,j) > M(i,j) - 10
% BW(i,j) = 0 otherwise
% Display the resulting binary image BW. Comment on the result.
for i=1:457
for j=1:908
if(grayImage(i,j)>meanImage(i,j))
finalImage_B(i,j) = im2bw(image(i,j),1);
else
finalImage_B(i,j) = im2bw(image(i,j),0);
end
end
end
figure(2);
imshow(finalImage_B);
title('Step 5 - Processed Image');
