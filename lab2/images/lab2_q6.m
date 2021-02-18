I = imread('wagon_shot_noise.png')
%Q6
Imed = medfilt2(I,[5,5])

h1 = fspecial('average',10)
I1 = imfilter(I,h1,'replicate')

h2 = fspecial('gaussian',5,0.9)
I2 = imfilter(I,h2,'replicate')
% Q7
%subplot(3,1,1)
%imshow(Imed)
%subplot(3,1,2)
%imshow(I1)
%subplot(3,1,3)
%imshow(I2)

% Median filtering helps in reducing noise at the same time preserving
% edges

%Q8

% Median filtering is more time consuming because it needs to sort the
% neighbourhood values

% Q10
% At the borders the value of the output after the filter is reduced
% because the values out of the boundary is take to be zero and henced the
% image is darkened.

% Q9
newimage = myMedian(I(128:192,128:192))
subplot(3,1,1)
imshow(I(128:192,128:192))
subplot(3,1,2)
Imedn = medfilt2(I(128:192,128:192),[3,3])
imshow(Imedn)
subplot(3,1,3)
imshow(newimage)