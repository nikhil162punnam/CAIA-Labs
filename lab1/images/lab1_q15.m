original = imread('download.jpeg')
filtered = imread('15_filtered.png')
subtracted = imread('15_subtracted.png')
subplot(3,1,1)
imshow(original)
subplot(3,1,2)
imshow(filtered)
subplot(3,1,3)
imshow(subtracted)

im=imread('download.jpeg')

gray=rgb2gray(im)
resizedGray=imresize(gray,[128,128])
newimage = single(resizedGray)
imtool(newimage)

for c = 1:128
    for r = 1:128
        newimage(c,r)=sum(sum(resizedGray(max(1,c-2):min(c+2,128),max(1,r-2):min(r+2,128))))
    end
end
newimage=round(newimage/25)
newimage=uint8(newimage)
imtool(newimage)
change=newimage-resizedGray
imtool(change)