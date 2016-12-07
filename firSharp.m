function A = firSharp(Picture)
 

%F�rst converters det til YCBCR colour image
YCBCR = rgb2ycbcr(Picture);

b = fspecial('unsharp'); %Finder b v�rdien for et 2D h�jpasfilter med fspeical
figure()
freqz2(b); %Plotter 2D HP filter

% filter p� luma som er y, som er det f�rste dom�ne. 
YCBCR(:,:,1)=filter2(b,YCBCR(:,:,1));

A = ycbcr2rgb(YCBCR); % Konverter det tilbage til RGB farve model.
end