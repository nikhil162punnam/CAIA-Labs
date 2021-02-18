I=imread('napoleon.png')
Is = single(I)
%whos Is
%whos I
% imtool(Is)
% imtool(I-50)
subplot(2,1,1)
imagesc((Is/64)*64)
subplot(2,1,2)
imagesc((I/64)*64)
%colorbar
% imagesc((Is/64)*64)
% imagesc((I/64)*64)
