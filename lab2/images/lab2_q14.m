I = imread('freqdist.png')

% FFT of image
I = double(I);
fft_i= fft2(I);
% FFT of the filter
t = 10
[xsize, ysize] = size(I);
[xx,yy] = meshgrid(-xsize/2: xsize/2-1, -ysize/2 : ysize/2-1);
gauss=1/2/pi/t*exp(-((xx).^2+(yy).^2)/t/2);
gaussfft = fft2(gauss)
% Applyting the filter
fft_m = fft_i .* gaussfft
% IFFT of the result
new_m = ifft2(fft_m)
caxis([0,255])
%Plotting
subplot(2,1,1)
imagesc(I)
subplot(2,1,2)
imagesc(new_m)