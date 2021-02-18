% Q1
I = imread('cameraman.png');

h1 = fspecial('average',7)
% Averaging is type of smoothing filter with filter being a square matrix
% of length 10
I1 = imfilter(I,h1,'replicate')

h2 = fspecial('gaussian',31,31/2)
% Gaussian filter applies an averaging technique on a filter of given size
% with weights as distributed as sigma
I2 = imfilter(I,h2,'replicate')

h3 = fspecial('disk',3)
% Disk is also a smoothing filter with filter being a square matrix of
% length 2*radius+1
I3 = imfilter(I,h3,'replicate')

h4 = fspecial('laplacian',0.3)
% Laplacian produces a sharpening effect on the image
I4 = imfilter(I,h4,'replicate')

subplot(5,1,1)
imshow(I)
subplot(5,1,2)
imshow(I1)
subplot(5,1,3)
imshow(I2)
subplot(5,1,4)
imshow(I3)
subplot(5,1,5)
imshow(I4)

% Q2
% Guassian, disk and average are low pass filters and all of them produce a
% kind of smoothing effect on the image.


% Q3
I = imread('cameraman.png');
% Use the filters directly for low-pass
hlow = fspecial('average',5)
Ilow = imfilter(I,hlow,'replicate')
%imshow(Ilow)

% Calculate the output of filters and subtract original from the
% output to get high-pass filters
Ihigh = I + 5 * (I - Ilow)
%imshow(Ihigh)

% Band pass
Iband = imfilter(Ihigh,hlow,'replicate')
%imshow(Iband)
%imagesc([I,Iband])