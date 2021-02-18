B1=imread('brain1.png')
B2=imread('brain2.png')
B3=imread('brain3.png')
avgBrain=(B1+B2)/2

imtool(avgBrain)
change=avgBrain-B3
imtool(change)