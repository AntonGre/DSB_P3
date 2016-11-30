clc; 
clear; 
close all;

c = imread('untitled.jpg');
figure();
imshow(c);
x = im2double(c);
[x_size,y_size,z_size] = size(x);

LP = fir1(100,0.20);
HP = fir1(100,0.0002,'high');
X_1 = zeros(x_size,y_size,z_size);
X_2 = zeros(x_size,y_size,z_size);
b = x(1,1:end,1);

% filtfilt fir funktionen bliver brugt p� s�ledes der ikke skabes
% noget faseforskydning p� billedet

%% Billedet skal blurres

% filter p� den R�d farve
for i = 1:x_size
   X_1(i,1:end,1)=filtfilt(LP,1,x(i,1:end,1));
end

% filter p� den Gr�n farve
for i = 1:x_size
   X_1(i,1:end,2)=filtfilt(LP,1,x(i,1:end,2));
end

%filter p� den Bl� farve
for i = 1:x_size
  X_1(i,1:end,3)=filtfilt(LP,1,x(i,1:end,3));
end

figure();
imshow(X_1)

%% Billedet skal skarpes

%F�rst converters det til YCBCR colour image
YCBCR = rgb2ycbcr(X_1);
%%imshow(YCBCR);

b = fspecial('unsharp');

% filter p� Y 
   YCBCR(:,:,1)=filter2(b,YCBCR(:,:,1));
   
% % filter p� den Gr�n farve
% for i = 1:x_size
%    X_2(i,1:end,2)=filtfilt(B1,1,YCBCR(i,1:end,2));
% end
% 
% %filter p� den Bl� farve
% for i = 1:x_size
%   X_2(i,1:end,3)=filtfilt(B1,1,YCBCR(i,1:end,3));
% end

X_2 = ycbcr2rgb(YCBCR);

figure();
imshow(X_2)

