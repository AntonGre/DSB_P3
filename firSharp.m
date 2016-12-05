function A = firSharp(Picture)
 

%F�rst converters det til YCBCR colour image
YCBCR = rgb2ycbcr(Picture);
%%imshow(YCBCR);

b = fspecial('unsharp');

% filter p� luma=y
YCBCR(:,:,1)=filter2(b,YCBCR(:,:,1));


A = ycbcr2rgb(YCBCR);
end