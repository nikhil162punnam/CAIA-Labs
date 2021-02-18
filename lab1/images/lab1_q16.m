im=imread('download.jpeg')
gray=rgb2gray(im)
I = gray
[h,w]=size(gray);

pixelcount = zeros(1,256);

for i = 1:h
    for j = 1:w
        pixelcount( gray(i,j) +1) = pixelcount( gray(i,j) +1) + 1;
    end
end
subplot(5,1,1)
bar(pixelcount)

normcount = zeros(1,256);

for i = 1:256
    normcount(i) = pixelcount(i)/(h*w);
end
subplot(5,1,2)
bar(normcount)

cumlcount = zeros(1,256);

for i =1:256
    if i ==1
        cumlcount(i) = normcount(i)
    else
        cumlcount(i) = normcount(i) + cumlcount(i-1)
    end
end
subplot(5,1,3)
bar(cumlcount)

lookup = zeros(1,256);
for i = 1:256
    lookup(i) = uint8(255 * cumlcount(i));
end

for i = 1:h
    for j = 1:w
        I(i,j)=lookup(I(i,j) + 1);
    end
end

subplot(5,1,4)
histeq(gray)
subplot(5,1,5)
imshow(I)