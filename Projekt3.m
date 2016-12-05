clc; 
clear; 
close all;

import firBlur.*
import firSharp.*
import iirBlur.*

c = imread('untitled.jpg');
figure();
imshow(c);
x = im2double(c);
[x_size,y_size,z_size] = size(x);

LP = fir1(100,0.20);
HP = fir1(100,0.0002,'high');
X_1 = zeros(x_size,y_size,z_size);



% filtfilt fir funktionen bliver brugt p� s�ledes der ikke skabes
% noget faseforskydning p� billedet

%% Billedet blurres med fir filter

X_11 = firBlur(c,0.2);
figure();
imshow(X_11)
%% Billedet skarpes med fir filter



D = firSharp(X_11);
figure();
title('med firsharp')
imshow(D)

%% Billedet blures med iir filter

%Blures med gaussingfilter lidt snyd
X_3 = zeros(x_size,y_size,z_size);
sigma = 5;

X_3(:,:,1) = imgaussfilt(x(:,:,1),sigma);
X_3(:,:,2) = imgaussfilt(x(:,:,2),sigma);
X_3(:,:,3) = imgaussfilt(x(:,:,3),sigma);


figure();
imshow(X_3)


V = iirBlur(x,25);
figure()
imshow(V)
%% sk�rping med iir filter 





%% Funktioner 

%% b
