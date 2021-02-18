I1 = imread('cameraman.png')
I2 = imread('wagon.png')

h = fspecial('sobel')
h1 = h.'

Ih1 = imfilter(I1,h1,'replicate')
Ih2 = imfilter(I2,h1,'replicate')

subplot(2,2,1)
imshow(Ih1)
subplot(2,2,2)
imshow(I1)
subplot(2,2,3)
imshow(Ih2)
subplot(2,2,4)
imshow(I2)