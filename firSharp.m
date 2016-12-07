function A = firSharp(Picture)
 

%Først converters det til YCBCR colour image
YCBCR = rgb2ycbcr(Picture);

b = fspecial('unsharp'); %Finder b værdien for et 2D højpasfilter med fspeical
figure()
freqz2(b); %Plotter 2D HP filter

% filter på luma som er y, som er det første domæne. 
YCBCR(:,:,1)=filter2(b,YCBCR(:,:,1));

A = ycbcr2rgb(YCBCR); % Konverter det tilbage til RGB farve model.
end