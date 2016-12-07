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

X_11 = firSmooth(c,0.2);
figure();
imshow(X_11)
%% Billedet skarpes med fir filter


D = firSharp(c);
figure();
imshow(D)

%% Billedet blures med iir filter


V = iirSmooth(c,25);
figure()
imshow(V)

% P�f�re salt pepper p� billedet
c_salt = imnoise(c,'salt & pepper');
figure()
imshow(c_salt)

% fjerner det med smooth
V1 = iirSmooth(c_salt,25);
figure()
imshow(V1)



%% sk�rping med iir filter 

I = rgb2gray(c);
BW1 = edge(I,'canny');

figure()
imshow(BW1)


% x = im2double(c);
% YCBCR = rgb2ycbcr(im2double(c));
% [b,a] = ellip(6,3,50,0.80,'high');
% %[numd,dend] = bessely(30,10000);
% [b,a] = bilinear(b,a,10000);
% x_size = size(c(1:end,1,1));
% 
% % filter p� den R�d farve
% for i = 1:x_size
%    YCBCR(i,1:end,1)=filtfilt(b,a,YCBCR(i,1:end,1));
% end
% 
% % % filter p� den gr�n farve
% % for i = 1:x_size
% %    x(i,1:end,2)=filtfilt(b,a,x(i,1:end,2));
% % end
% % 
% % % filter p� den bl� farve
% % for i = 1:x_size
% %    x(i,1:end,3)=filtfilt(b,a,x(i,1:end,3));
% % end
% 
% x = ycbcr2rgb(YCBCR);
% figure()
% imshow(x)



%% Funktioner 

%% b
