
% blures med bessel som er iir filter, som bliver en approximiation af 
% gaussingfilter.
function A = iirSmooth(picture,n)

A = picture;
[numd,dend] = besself(n,10000);
[LP_b,LP_a] = bilinear(numd,dend,10000);
x_size = size(picture(1:end,1,1));

figure()
freqz(LP_b,LP_a)
% filter p� den R�d farve
for i = 1:x_size
   A(i,1:end,1)=filtfilt(LP_b,LP_a,picture(i,1:end,1));
end

% filter p� den gr�n farve
for i = 1:x_size
   A(i,1:end,2)=filtfilt(LP_b,LP_a,picture(i,1:end,2));
end

% filter p� den bl� farve
for i = 1:x_size
   A(i,1:end,3)=filtfilt(LP_b,LP_a,picture(i,1:end,3));
end
end
