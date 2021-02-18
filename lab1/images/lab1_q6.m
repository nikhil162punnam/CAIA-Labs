I=imread('napoleon.png')
g=1/2
%g=2
L=double(I).^g
out = uint8(L .* (255/max(max(L))));
imtool(out)
histeq(I)