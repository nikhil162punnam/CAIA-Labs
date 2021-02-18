wr=imread('wrench.png')
J = imrotate(wr,20);
K = imrotate(wr,20,'bilinear');
% Transpose of the matrix is computed faster for 90 degrees
%imtool(J)
%imtool(K)
tic
k1 = imrotate(wr,90)
toc
t1 = toc

tic 
k2 = imrotate(wr,20)
toc
t2 = toc

