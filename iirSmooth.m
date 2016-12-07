
% blures med bessel som er iir filter, som kan forklares af v�re en approximiation af 
% gaussingfilter.
function A = iirSmooth(picture,n)

A = im2double(picture); % Gemmer billedet p� A med double pr�cision

% bruger bessel filter, n er orden, det er nu som analog 
[b_analog,a_analog] = besself(n,10000);
[LP_b,LP_a] = bilinear(b_analog,a_analog,10000); %%Konver det til digital
x_size = size(picture(1:end,1,1)); % Finder st�rrelsen p� x-aksen

figure()
freqz(LP_b,LP_a) %%plotter Iir filter


% filter p� den R�d farve
for i = 1:x_size
   A(i,1:end,1)=filtfilt(LP_b,LP_a,A(i,1:end,1));
end

% filter p� den gr�n farve
for i = 1:x_size
   A(i,1:end,2)=filtfilt(LP_b,LP_a,A(i,1:end,2));
end

% filter p� den bl� farve
for i = 1:x_size
   A(i,1:end,3)=filtfilt(LP_b,LP_a,A(i,1:end,3));
end
end
