clc; 
clear; 
close all;

addpath('C:\Users\anton\Desktop\DSB_P3');
import firBlur.*
c = imread('untitled.jpg');
figure();
imshow(c);
x = im2double(c);
[x_size,y_size,z_size] = size(x);

LP = fir1(100,0.20);
HP = fir1(100,0.0002,'high');
X_1 = zeros(x_size,y_size,z_size);



% filtfilt fir funktionen bliver brugt på således der ikke skabes
% noget faseforskydning på billedet

%% Billedet blurres med fir filter

% filter på den Rød farve
for i = 1:x_size
   X_1(i,1:end,1)=filtfilt(LP,1,x(i,1:end,1));
end

% filter på den Grøn farve
for i = 1:x_size
   X_1(i,1:end,2)=filtfilt(LP,1,x(i,1:end,2));
end

%filter på den Blå farve
for i = 1:x_size
  X_1(i,1:end,3)=filtfilt(LP,1,x(i,1:end,3));
end

figure();
imshow(X_1)

X_11 = firBlur(x,LP);
figure();
imshow(X_11)

%% Billedet skarpes med fir filter
X_2 = zeros(x_size,y_size,z_size);

%Først converters det til YCBCR colour image
YCBCR = rgb2ycbcr(X_1);
%%imshow(YCBCR);

b = fspecial('unsharp');

% filter på luma=y
   YCBCR(:,:,1)=filter2(b,YCBCR(:,:,1));


X_2 = ycbcr2rgb(YCBCR);

figure();
imshow(X_2)

%% Billedet blures med iir filter

%Blures med gaussingfilter lidt snyd
X_3 = zeros(x_size,y_size,z_size);
sigma = 5;

X_3(:,:,1) = imgaussfilt(x(:,:,1),sigma);
X_3(:,:,2) = imgaussfilt(x(:,:,2),sigma);
X_3(:,:,3) = imgaussfilt(x(:,:,3),sigma);


figure();
imshow(X_3)


% blures med bessel som er iir filter, som bliver en approximiation af 
% gaussingfilter.
[numd,dend] = besself(20,10000);
[LP_b,LP_a] = bilinear(numd,dend,10000);

% filter på den Rød farve
for i = 1:x_size
   X_3(i,1:end,1)=filtfilt(LP_b,LP_a,x(i,1:end,1));
end

% filter på den grøn farve
for i = 1:x_size
   X_3(i,1:end,2)=filtfilt(LP_b,LP_a,x(i,1:end,2));
end

% filter på den blå farve
for i = 1:x_size
   X_3(i,1:end,3)=filtfilt(LP_b,LP_a,x(i,1:end,3));
end

figure()
imshow(X_3)

%% skærping med iir filter 

