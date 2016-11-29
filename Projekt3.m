clc; 
clear; 
close all;

c = imread('untitled.jpg');
figure();
imshow(c);
x = im2double(c);
[x_size,y_size,z_size] = size(x);

LP = fir1(100,0.20);
HP = fir1(100,0.50,'high');
X_1 = zeros(x_size,y_size,z_size);
X_2 = zeros(x_size,y_size,z_size);
b = x(1,1:end,1);

% filtfilt fir funktionen bliver brugt på således der ikke skabes
% noget faseforskydning på billedet


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


% filter på den Rød farve
for i = 1:x_size
   X_2(i,1:end,1)=filtfilt(HP,1,X_1(i,1:end,1));
end

% filter på den Grøn farve
for i = 1:x_size
   X_2(i,1:end,2)=filtfilt(HP,1,X_1(i,1:end,2));
end

%filter på den Blå farve
for i = 1:x_size
  X_2(i,1:end,3)=filtfilt(HP,1,X_1(i,1:end,3));
end

figure();
imshow(X_2)