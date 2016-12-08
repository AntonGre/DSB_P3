clc; 
clear; 
close all;

import firSmooth.*
import firSharp.*
import iirSmooth.*

c = imread('Fruitball.jpg');
figure();
imshow(c);


%% Billedet blurres med fir filter
c_salt = imnoise(c,'salt & pepper');
figure()
imshow(c_salt)

X_11 = firSmooth(c,0.1);
figure();
imshow(X_11)

X_1C = firSmooth(c_salt,0.1);
figure();
imshow(X_1C)

%% Billedet skarpes med fir filter


D = firSharp(c);
figure();
imshow(D)

%% Billedet blures med iir filter


V = iirSmooth(c,25);
figure()
imshow(V)

% Påføre salt pepper på billedet
c_salt = imnoise(c,'salt & pepper');
figure()
imshow(c_salt)

% fjerner det med smooth
V1 = iirSmooth(c_salt,25);
figure()
imshow(V1)



