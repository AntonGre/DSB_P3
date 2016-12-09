
% firblur funktion returnere blurre et billede A af parameteren picture,
% Wn er kn�kv�rdien for lavpas fir filter som picture bliver k�rt igennem
function A = firSmooth(picture,Wn)

b = fir1(100,Wn); %Laver lavpas filter, med orden 100 og vinkelfrekvense fra parameter

%figure()
%freqz(b); %Fremviser filter

A = im2double(picture); %Konvert billede om til bedre pr�cision.
x_size = size(picture(1:end,1,1)); %Gemmer st�rrelse p� X-aksen


% filtfilt fir funktionen bliver brugt p� s�ledes der ikke skabes
% noget faseforskydning p� billedet, ellers vil noget af billedet blive
% sort p� venstre side, hvis vi havde brugt en af de andre filter
% funktioner

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
