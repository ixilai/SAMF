close all
clear all
clc

chosen=5;

%D=cell2mat(struct2cell(load('Dzq.mat')));
 for ii=5:chosen
%      img1 = imread(['source\Grayscale dataset\',num2str(2*ii-1),'.tif']);
%      img2 = imread(['source\Grayscale dataset\',num2str(2*ii),'.tif']);
    img1 = im2double(imread(['source\Lytro dataset\',num2str(2*ii-1),'.jpg']));
    img2 = im2double(imread(['source\Lytro dataset\',num2str(2*ii),'.jpg']));
%       img1 = imread(['E:\图像融合\多模态源图像\多聚焦图像\MFFW\',num2str(2*ii-1),'.TIF']);
%       img2 = imread(['E:\图像融合\多模态源图像\多聚焦图像\MFFW\',num2str(2*ii),'.TIF']);

%               img1 = imread(['E:\图像融合\多模态源图像\多聚焦图像\MFI-WHU2\',num2str(2*ii-1),'.jpg']);
%         img2 = imread(['E:\图像融合\多模态源图像\多聚焦图像\MFI-WHU2\',num2str(2*ii),'.jpg']);

% [imagename1, imagepath1]=uigetfile('E:\图像融合\多模态源图像\多聚焦图像\MFFW\*.jpg;*.bmp;*.png;*.tif;*.tiff;*.pgm;*.gif','Please choose the first input image');
% img1=imread(strcat(imagepath1,imagename1));  
% [imagename2, imagepath2]=uigetfile('E:\图像融合\多模态源图像\多聚焦图像\MFFW\*.jpg;*.bmp;*.png;*.tif;*.tiff;*.pgm;*.gif','Please choose the first input image');
% img2=imread(strcat(imagepath2,imagename2)); 
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
   

close all;
   imwrite(F,['Lytro\', num2str(ii),'.tif']);
 end
  