%created by- Saurabh Singh
%date- 31/01/2026
clc;
clear all;
close all;

inputImage = imread("I.jpg");

if size(inputImage,3)==3
    grayImage = rgb2gray(inputImage);
else
    grayImage = inputImage;
end

grayImage = double(grayImage);  
% Converting image to double for DCT operations

quantMatrix = [16 11 10 16 24 40 51 61;
               12 12 14 19 26 58 60 55;
               14 13 16 24 40 57 69 56;
               14 17 22 29 51 87 80 62;
               18 22 37 56 68 109 103 77;
               24 35 55 64 81 104 113 92;
               49 64 78 87 103 121 120 101;
               72 92 95 98 112 100 103 99];
% Standard JPEG quantization matrix

compressionFactor = 10;
quantMatrix = quantMatrix * compressionFactor;
% Increasing quantization strength

blockDim = 8;  
% JPEG block size

[numRows, numCols] = size(grayImage);
reconImage = zeros(numRows, numCols);
% Output reconstructed image

for row = 1:blockDim:(numRows-blockDim+1)
    for col = 1:blockDim:(numCols-blockDim+1)

        imageBlock = grayImage(row:row+7, col:col+7);
        imageBlock = imageBlock - 128;      

        dctCoeff = dct2(imageBlock);        

        quantCoeff = round(dctCoeff ./ quantMatrix);  

        dequantCoeff = quantCoeff .* quantMatrix;     

        idctBlock = idct2(dequantCoeff);    
        idctBlock = idctBlock + 128;        

        reconImage(row:row+7, col:col+7) = idctBlock;

    end
end

reconImage = uint8(reconImage);

figure;
imshow(uint8(grayImage));
title("Original Image");

figure;
imshow(reconImage);
title("Reconstructed Image After High JPEG Compression");
