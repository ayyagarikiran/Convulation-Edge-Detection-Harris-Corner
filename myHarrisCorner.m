function [R] = myHarrisCorner(Ix, Iy, threshold)
% row_zeros=zeros(1,siz(2));
% X=[row_zeros;X;row_zeros];
% colum_zeros=zeros(siz(1)+2,1);
% X=[colum_zeros X colum_zeros];
% X(1,:)=X(2,:);
% X(end,:)=X(end-1,:);
% X(:,1)=X(:,2);
% X(:,end)=X(:,end-1);
% X=single(X);
% for i=2:(siz(1)+1)
%     for j=2:(siz(2)+1)
%         %making a 3X3 matrix
%         addx=0;
%         addy=0;
%         T=[X(i-1,j-1) X(i-1,j) X(i-1,j+1);X(i,j-1) X(i,j) X(i,j+1);X(i+1,j-1) X(i+1,j) X(i+1,j+1)]; 
%         h=[-1 0 1; -2 0 2;-1 0 1];
%         v=[1 2 1; 0 0 0;-1 -2 -1];
%         for k=1:3
%             for l=1:3
%                 addx=addx+T(k,l)*h(4-k,4-l);
%                 addy=addy+T(k,l)*v(4-k,4-l);
%             end
%         end
%         Ix(i-1,j-1)=(1/8)*addx;
%         Iy(i-1,j-1)=(1/8)*addy;
%     end   
% end
%img=imread('img01.jpg');
%sigma=2;
%[Im Ix Iy] = myEdgeFilter(img, sigma);
Ixx=Ix.^2; 
Ixy=Ix.*Iy;
Iyy=Iy.^2;
%fprintf('done with my edge');
k=0.15;
c=0;
g = fspecial('gaussian',[3 3], 3);
Ixx=myImageFilter(Ixx,g);
Iyy=myImageFilter(Iyy,g);
Ixy=myImageFilter(Ixy,g);
% Ixx=single(Ixx);
% Iyy=single(Iyy);
% Ixy=single(Ixy);
 siz=size(Ixx);
%threshold=30000;
R=zeros(siz(1),siz(2));
for i=1:siz(1)
    for j=1:siz(2)
        H=[Ixx(i,j) Ixy(i,j); Ixy(i,j) Iyy(i,j)];
        Im(i,j)= det(H)-k*(trace(H)^2);
        if (Im(i,j)/100)>threshold
            R(i,j)=255;
            c=c+1;
        end
    end
end
            
        
