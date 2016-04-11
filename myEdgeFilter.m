function [Im Ix Iy] = myEdgeFilter(img, sigma)
X=img;
siz=size(X);
row_zeros=zeros(1,siz(2));
X=[row_zeros;X;row_zeros];
colum_zeros=zeros(siz(1)+2,1);
X=[colum_zeros X colum_zeros];
X(1,:)=X(2,:);
X(end,:)=X(end-1,:);
X(:,1)=X(:,2);
X(:,end)=X(:,end-1);
%g = fspecial('gaussian',[3 3], sigma);
%X=myImageFilter(X,g);
%X = imgaussfilt(X,2);
X=single(X);
h=[-1 0 1; -2 0 2;-1 0 1];
v=[1 2 1; 0 0 0;-1 -2 -1];
Ix=myImageFilter(X,h);
Iy=(myImageFilter(X,v));
Im=sqrt(Ix.^2+Iy.^2);
% for i=1:siz(1)
%     for j=1:siz(2)
%         Im(i,j)=sqrt(Ix(i,j)^2+Iy(i,j)^2);
%     end
% end
%imshow(Im);
        
        