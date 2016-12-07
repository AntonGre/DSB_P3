
% firblur funktion returnere blurre et billede A af parameteren picture,
% Wn er kn�kv�rdien for lavpas fir filter som picture bliver k�rt igennem
function A = firSmooth(picture,Wn)

b = fir1(100,Wn);
figure()
freqz(b);
A = im2double(picture);
x_size = size(picture(1:end,1,1));

% filter p� den r�de farve
for i = 1:x_size
   A(i,1:end,1)=filtfilt(b,1,A(i,1:end,1));
end

% filter p� den Gr�n farve
for i = 1:x_size
   A(i,1:end,2)=filtfilt(b,1,A(i,1:end,2));
end

%filter p� den Bl� farve
for i = 1:x_size
  A(i,1:end,3)=filtfilt(b,1,A(i,1:end,3));
end
end

% 
% function A = firSharp(Picture)
% 
% end