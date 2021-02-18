% Q9
function newimage = myMedian(Img)
    [Irow, Icol] = size(Img)
    newimage = zeros(Irow,Icol)
    for r = 1:Irow
        for c = 1:Icol
            newI = Img(max(1,r-1):min(r+1,Icol),max(1,c-1):min(c+1,Irow))
            newimage(r,c) = median(sort(reshape(newI,1,[])))
        end
    end
end

