I = imread('handBW.pnm');
%figure(2);imshow(I);
%figure(3);imhist(I);
%figure(1);mtresh(I,75,100);
b = multithresh(I,2);
seqI=imquantize(I, b);
I2 = label2rgb(seqI);
figure(4);imshow(I2);clear();
%load cdata;
%figure(1);
%plot(cdata(:,1),cdata(:,2),'.')