I=imread('napoleon.png')
J = histeq(I);
imhist(I)
imhist(J)
imtool(J)