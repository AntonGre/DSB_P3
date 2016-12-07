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


D = firSharp(x);
figure();
imshow(D)

%% Billedet blures med iir filter


V = iirSmooth(x,25);
figure()
imshow(V)



%% skærping med iir filter 

% X_21 = x;
% [numd,dend] = bessely(30,10000);
% [LP_b,LP_a] = bilinear(numd,dend,10000);
% x_size = size(picture(1:end,1,1));
% 
% % filter på den Rød farve
% for i = 1:x_size
%    X_21(i,1:end,1)=filtfilt(LP_b,LP_a,x(i,1:end,1));
% end
% 
% % filter på den grøn farve
% for i = 1:x_size
%    X_21(i,1:end,2)=filtfilt(LP_b,LP_a,x(i,1:end,2));
% end
% 
% % filter på den blå farve
% for i = 1:x_size
%    X_21(i,1:end,3)=filtfilt(LP_b,LP_a,x(i,1:end,3));
% end
% 
% figure()
% imshow(X_21)



%% Funktioner 

%% b
