%Bahadır Akın Akgül
%Introduction to Image Processing Course Homework 1
%github.com/megatony
%www.akinakgul.com

%PART 1
%Generate an RGB image in MATLAB of size 256x256. The background should be pure white.
%There should be a red circle of radius 60 and a green rectangle of height 150 and width 80. You
%can place the circle and the rectangle anywhere in the image as long as they don’t overlap.
%Display the image you have generated. Include the MATLAB code.
canvas = zeros(255,255,3);
for i=1:255
for j=1:255
area = ((i-180)^2+(j-180)^2)^0.5;
if(area<60)
canvas(i,j,1) = 255;
else if(i<150 && j<80)
canvas(i,j,2) =255;
else
canvas(i,j,:) = 255;
end
end
end
end
imshow(canvas)
title(‘Part 1 – Final result’)
%PART 2
%Read the Lena.bmp image. Convert it to a grayscale image by first converting the data to
%double, then taking the average of the R, G, and B components. (DO NOT use the MATLAB
%function rgb2gray). Display the grayscale image and its histogram. Apply gamma transformation
%for (a) γ = 2, (b) γ = 3, (c) γ = 0.5, (d) γ = 0.2. Display the resulting images and their histograms
%for all the four cases. Include the MATLAB code.
%DO NOT use the MATLAB function imadjust. You should write your own gamma transformation
%code. Remember to scale the gray values between 0 and 1 before applying the gamma
%transformation. Then rescale the resulting values between 0 and 255 and convert to uint8.
lena = imread('lena.bmp');
double_lena = double(lena);
r_lena = double_lena(:,:,1);
g_lena = double_lena(:,:,2);
b_lena = double_lena(:,:,3);
gray = (r_lena + g_lena + b_lena)/3;
figure(9);
imshow(uint8(gray))
title('Part 2 - Grayscaled image')
for i=1:512
for j=1:512
a(i,j) = 255 * (gray(i,j)/255)^(2);
b(i,j) = 255 * (gray(i,j)/255)^(3);
c(i,j) = 255 * (gray(i,j)/255)^(0.5);
d(i,j) = 255 * (gray(i,j)/255)^(0.2);
end
end
figure(1);
imshow(uint8(a))
title('Part 2 - Gamma transformation for (a)')
figure(2);
imhist(uint8(a))
title('Part 2 - Histogram for (a)')
figure(3);
imshow(uint8(b))
title('Part 2 - Gamma transformation for (b)')
figure(4);
imhist(uint8(b))
title('Part 2 - Histogram for (b)')
figure(5);
imshow(uint8(c))
title('Part 2 - Gamma transformation for (c)')
figure(6);
imhist(uint8(c))
title('Part 2 - Histogram for (c)')
figure(7);
imshow(uint8(d))
title('Part 2 - Gamma transformation for (d)')
figure(8);
imhist(uint8(d))
title('Part 2 - Histogram for (d)')
%PART 3
%Read the circles.jpg image. Convert it to grayscale. Apply binarization to the image for
%thresholds 80, 120, 140, and display the results (DO NOT use the MATLAB function im2bw).
%Inspect the histogram of the grayscale image. What will be the best threshold to separate the
%objects from the background? Use that threshold and display the result. Include the MATLAB
%code.
myPicture = double(imread('circles.jpg'));
figure(7)
imshow(uint8(myPicture))
title('Part 3 - Original image')
r = myPicture(:,:,1);
g = myPicture(:,:,2);
b = myPicture(:,:,3);
grayPicture = (r+g+b)/3;
figure(1);
imshow(uint8(grayPicture));
title('Part 3 - Grayscaled image')
grayPicture2 = grayPicture;
grayPicture3 = grayPicture;
grayPicture4 = grayPicture;
figure(6)
imhist(uint8(grayPicture))
title('Part 3 - Histogram of grayscaled image')
for i=1:size(grayPicture,1)
for j=1:size(grayPicture,2)
for k=1:size(grayPicture,3)
if(grayPicture(i,j,k)<80)
grayPicture(i,j,k) = 255;
else
grayPicture(i,j,k) = 0;
end
end
end
end
figure(2)
imshow(uint8(grayPicture))
title('Part 3 - Thresolding for 80')
for i=1:size(grayPicture2,1)
for j=1:size(grayPicture2,2)
for k=1:size(grayPicture2,3)
if(grayPicture2(i,j,k)<120)
grayPicture2(i,j,k) = 255;
else
grayPicture2(i,j,k) = 0;
end
end
end
end
figure(3)
imshow(uint8(grayPicture2))
title('Part 3 - Thresolding for 120')
for i=1:size(grayPicture3,1)
for j=1:size(grayPicture3,2)
for k=1:size(grayPicture3,3)
if(grayPicture3(i,j,k)<140)
grayPicture3(i,j,k) = 255;
else
grayPicture3(i,j,k) = 0;
end
end
end
end
figure(4)
imshow(uint8(grayPicture3))
title('Part 3 - Thresolding for 140')
for i=1:size(grayPicture4,1)
for j=1:size(grayPicture4,2)
for k=1:size(grayPicture4,3)
if(grayPicture4(i,j,k)<115)
grayPicture4(i,j,k) = 255;
else
grayPicture4(i,j,k) = 0;
end
end
end
end
figure(5)
imshow(uint8(grayPicture4))
title('Part 3 - Thresolding that I offer according to histogram')