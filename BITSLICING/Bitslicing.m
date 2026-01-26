clc;
clear all;
close all;

rgbImg = imread('IMAGE.jpg');     % Read RGB image
grayImg = rgb2gray(rgbImg);       % Convert RGB to Grayscale

imshow(grayImg);
title('Grayscale Image');

[rows, cols] = size(grayImg);

% -------- Bit Plane Slicing --------

% 0th bit plane
for r = 1:rows
    for c = 1:cols
        bitPlane0(r,c) = bitand(grayImg(r,c), 1);
    end
end

% 1st bit plane
for r = 1:rows
    for c = 1:cols
        bitPlane1(r,c) = bitand(grayImg(r,c), 2);
    end
end

% 2nd bit plane
for r = 1:rows
    for c = 1:cols
        bitPlane2(r,c) = bitand(grayImg(r,c), 4);
    end
end

% 3rd bit plane
for r = 1:rows
    for c = 1:cols
        bitPlane3(r,c) = bitand(grayImg(r,c), 8);
    end
end

% 4th bit plane
for r = 1:rows
    for c = 1:cols
        bitPlane4(r,c) = bitand(grayImg(r,c), 16);
    end
end

% 5th bit plane
for r = 1:rows
    for c = 1:cols
        bitPlane5(r,c) = bitand(grayImg(r,c), 32);
    end
end

% 6th bit plane
for r = 1:rows
    for c = 1:cols
        bitPlane6(r,c) = bitand(grayImg(r,c), 64);
    end
end

% 7th bit plane
for r = 1:rows
    for c = 1:cols
        bitPlane7(r,c) = bitand(grayImg(r,c), 128);
    end
end

figure;

subplot(2,4,1); imshow(bitPlane0); title('0th Bit Plane');
subplot(2,4,2); imshow(bitPlane1); title('1st Bit Plane');
subplot(2,4,3); imshow(bitPlane2); title('2nd Bit Plane');
subplot(2,4,4); imshow(bitPlane3); title('3rd Bit Plane');

subplot(2,4,5); imshow(bitPlane4); title('4th Bit Plane');
subplot(2,4,6); imshow(bitPlane5); title('5th Bit Plane');
subplot(2,4,7); imshow(bitPlane6); title('6th Bit Plane');
subplot(2,4,8); imshow(bitPlane7); title('7th Bit Plane');

% -------- Bit Plane Removal --------
% Removing 0th, 5th, and 7th bit planes

for r = 1:rows
    for c = 1:cols
        removeBit0(r,c) = bitand(grayImg(r,c), (255 - 2^0));
        removeBit5(r,c) = bitand(grayImg(r,c), (255 - 2^5));
        removeBit7(r,c) = bitand(grayImg(r,c), (255 - 2^7));
    end
end

figure; 
subplot(1,3,1); imshow(removeBit0); title('0th Bit Removed');
subplot(1,3,2); imshow(removeBit5); title('5th Bit Removed');
subplot(1,3,3); imshow(removeBit7); title('7th Bit Removed');