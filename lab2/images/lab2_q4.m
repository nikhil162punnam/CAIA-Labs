% Q1
I1 = imread('cameraman.png');
alpha1 = 5

hsmooth1 = fspecial('average',10)
Ismooth1 = imfilter(I1,hsmooth1,'replicate')

Isharp1 = I1 + alpha1*(I1-Ismooth1)
%imshow(Isharp1)

I2 = imread('wagon.png');
alpha2 = 7

hsmooth2 = fspecial('average',10)
Ismooth2 = imfilter(I2,hsmooth2,'replicate')

Isharp2 = I2 + alpha2*(I2-Ismooth2)

%sharpun = fspecial('unsharp')
%Isharpnew = imfilter(I1,sharpun,'replicate')

%subplot(2,1,1)
%imagesc(Isharp1)
%subplot(2,1,2)
%imagesc(Isharpnew)
imshow(Isharp2)
imagesc([Isharp1,I1])

subplot(2,2,1)
imagesc(Isharp1)
subplot(2,2,2)
imagesc(I1)
subplot(2,2,3)
imagesc(Isharp2)
subplot(2,2,4)
imagesc(I2)
