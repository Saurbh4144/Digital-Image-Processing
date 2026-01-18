%basic for Image Processing 
clc;
clear all;
close all; 

% Create a 8*8 matrix with random numbers between 0 and 255
A = randi([0,255],8,8);
display(A);

%Upload the input image
I = imread("MED.png");
figure();
imshow(I); %show the image

% to convert image to grayscale
Ig=rgb2gray(I); 
figure();
imshow(Ig); %show the gray image

%the image is converted to red channel only
Ired=imread("MED.png");
Ired(:,:,2)=0; %making the pixels of green zero
Ired(:,:,3)=0; %making the pixels of blue zero
figure();
imshow(Ired);

%to convert the image to black and white.
BW=Ig>128;
figure();
imshow(BW);
