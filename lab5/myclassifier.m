% Using BoundingBox method of regionprops.
% Gives an average estimate of ~ 58.33 % in ~ 11 sec on a i5-8250U

function fin = myclassifier(Img)

thresh_gray = 0.2;
% TO make the background black for filtering of unwanted objects
Img = ~im2bw(Img, thresh_gray);

% Applying a 7x7 mean fiter
newIm = imfilter(Img, ones(7,7)./(7^2));

% Gives the connected components from the image
Img_CC = bwconncomp(newIm);
% Applying a boundixBox to separate each connected component
Img_props = regionprops(Img_CC,'BoundingBox');

EachDigit = {};
propCount = length(Img_props);
% It crops the image into each digit or prop as found by the regionprops
for i=1:propCount
    EachDigit{i} = imcrop(newIm, Img_props(i).BoundingBox);
end

% If all the three digits are connected or overlapping
if (propCount == 1)
    coordinates = size(EachDigit{1});
    xcord = coordinates(1);
    ycord = coordinates(2);
    % split the bounding box into 3 equal width boxes i.e 1/3,1/3,1/3
    EachDigit{2} = imcrop(EachDigit{1}, [xcord/3,    1, xcord/3*2, ycord]);
    EachDigit{3} = imcrop(EachDigit{1}, [xcord/3 * 2 1, xcord    , ycord]);
    % third the size of 1
    EachDigit{1} = imcrop(EachDigit{1}, [1,      1, xcord/3  , ycord]);
% If two digits are connected or overlapping
elseif (propCount == 2)
    % figure out which is wider and split it.
    if (size(EachDigit{1}, 2) >= size(EachDigit{2}, 2)) 
        % split first image
        coordinates = size(EachDigit{1});
        xcord = coordinates(1);
        ycord = coordinates(2);
        % the second prop is the third digit
        EachDigit{3} = EachDigit{2};
        % split the first prop into two digits
        % split the bounding box into 2 equal width boxes i.e 1/2,1/2
        EachDigit{2} = imcrop(EachDigit{1}, [xcord/2, 1, xcord,   ycord]);
        % half the size of 1
        EachDigit{1} = imcrop(EachDigit{1}, [1,   1, xcord/2, ycord]);
    else 
        % split second image
        coordinates = size(EachDigit{2});
        xcord = coordinates(1);
        ycord = coordinates(2);
        % The second prop has two digits
        % half the size of 2
        EachDigit{2} = imcrop(EachDigit{2}, [1,   1, xcord/2, ycord]);
        EachDigit{3} = imcrop(EachDigit{2}, [xcord/2, 1, xcord,   ycord]);
    end
% If there are exactly 3 props, then our work is done. No cropping
% required. If there are more than 3 props identified, then our filtering
% has not worked properly and will result in decrease in accuracy.
end

% Now that the digits are discerned, all that is left is identify what each
% digit is. This can be done by recognising the orientiation of the digit
% in the image.
iden = [3,3,3];
for i=1:length(EachDigit)
    inv = ~~EachDigit{i};
    OriDig = regionprops(inv, 'Orientation');
    digi = OriDig.Orientation;
    if (digi > 88)
        % If the orientation is greater than 88 degrees, then it is zero
        iden(i) = 0;
    elseif (digi < 0)
        % If the orientation is less than 0 degrees, then it is one
        iden(i) = 1;
    else
        iden(i)=2;
    end
end

fin = iden(1:3);
end
