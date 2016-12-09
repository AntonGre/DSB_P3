
% firblur funktion returnere blurre et billede A af parameteren picture,
% Wn er knækværdien for lavpas fir filter som picture bliver kørt igennem
function A = firSmooth(picture,Wn)

b = fir1(100,Wn); %Laver lavpas filter, med orden 100 og vinkelfrekvense fra parameter

%figure()
%freqz(b); %Fremviser filter

A = im2double(picture); %Konvert billede om til bedre præcision.
x_size = size(picture(1:end,1,1)); %Gemmer størrelse på X-aksen


% filtfilt fir funktionen bliver brugt på således der ikke skabes
% noget faseforskydning på billedet, ellers vil noget af billedet blive
% sort på venstre side, hvis vi havde brugt en af de andre filter
% funktioner

% filter på den røde farve
for i = 1:x_size
   A(i,1:end,1)=filtfilt(b,1,A(i,1:end,1));
end

% filter på den Grøn farve
for i = 1:x_size
   A(i,1:end,2)=filtfilt(b,1,A(i,1:end,2));
end

%filter på den Blå farve
for i = 1:x_size
  A(i,1:end,3)=filtfilt(b,1,A(i,1:end,3));
end
end
