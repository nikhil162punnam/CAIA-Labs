I1 = imread('rectangle.png')
%For rectangle
% The result shows that the image contains components of all frequencies, but that their magnitude gets smaller 
% for higher frequencies. Hence, low frequencies contain more image information than the higher ones. 
% The transform image also tells us that there are two dominating directions in the Fourier image, one passing vertically
% and one horizontally through the center. These originate from the regular patterns in the background of the original 
% image. 
I2 = imread('cameraman.png')
% For cameraman
% The result shows that the image contains components of all frequencies, but that their magnitude gets smaller
% for higher frequencies. Hence, low frequencies contain more image information than the higher ones. 
% The transform image also tells us that there are more than two dominating directions in the Fourier image, 
% passing through the center. These originate from the regular patterns in the background of the original image. 


% Q11
fftoriginal1 = fft2(double(I1))
fftshifted1 = fftshift(fftoriginal1)
%imshow(log(abs(fftshifted1)),[])
Io1 = log(abs(fftshifted1))

fftoriginal2 = fft2(double(I2))
fftshifted2 = fftshift(fftoriginal2)
Io2 = log(abs(fftshifted2))

subplot(2,2,1)
imagesc(I1)
subplot(2,2,2)
imagesc(Io1)
subplot(2,2,3)
imagesc(I2)
subplot(2,2,4)
imagesc(Io2)

% Q12
oddsignal1 = fft2(rand(1,5))
oddsignal2 = fftshift(oddsignal1)
% Swap the left and right halves of a row vector. If a vector has an odd number of elements,
% then the middle element is considered part of the left half of the vector.

evensignal1 = fft2(rand(1,6))
evensignal2 = fftshift(evensignal1)
% Swap the left and right halves of a row vector. If a vector has an even number of elements,
% then we just swap left and right halves

oddreverse = ifft2(ifftshift(oddsignal2))
evenreverse = ifft2(ifftshift(evensignal2))

