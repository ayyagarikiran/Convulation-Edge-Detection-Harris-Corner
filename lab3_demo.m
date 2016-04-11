function lab3_demo(imag)
img1=imag;
siz=size(imag);
Y= length(siz);
if Y==3
imag=rgb2gray(imag);
end
sigma=1;
[Im Ix Iy]=myEdgeFilter(imag, sigma);
threshold=500000;
[R1] = myHarrisCorner(Ix, Iy, threshold);
Im=uint8(Im);
subplot(2,2,1)
imshow(Im)
title('Im-My edge filter');
%figure()
Ix=uint8(Ix);
subplot(2,2,2)
imshow(Ix);
title('Ix-My edge filter');
Iy=uint8(Iy);
subplot(2,2,3)
imshow(Iy);
title('Iy-My edge filter');
hold on
%imshow(Im);
subplot(2,2,4)
[ind_i,ind_j]=find(R1==255);
imshow(img1)
hold on
plot(ind_j,ind_i,'ro')
title('Harris Corner Detection');
