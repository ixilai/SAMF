close all
clear all
clc

addpath function
addpath RF

chosen=80;
 for ii=1:chosen

   img1 = imread(['.\source\Road-MF\',num2str(2*ii-1),'.jpg']);
   img2 = imread(['.\source\Road-MF\',num2str(2*ii),'.jpg']);

    if size(img1,3)>1
    f1=rgb2gray(img1); 
    else
    f1=im2double(img1);
    end
    if size(img2,3)>1
    f2=rgb2gray(img2); 
    else
    f2=im2double(img2);
    end   
    f1=im2double(f1);
    f2=im2double(f2);

    [row,column]=size(f1);
    F=zeros(row,column);


    [map,IFF]=main3(f1,f2);


if size(img1,3)>1
for i=1:3
    F(:,:,i)=F_generation(img1(:,:,i),img2(:,:,i),map);
end
else
    F=F_generation(f1,f2,map);
end
figure,imshow(F);
%imwrite(F,['.\result\', num2str(ii),'.jpg']);
end
  