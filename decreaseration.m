function newrationgrid=decreaseration(rationgrid,animalgrid)
        newrationgrid=rationgrid;
        for i=1:1:size(rationgrid,1)
            for j=1:1:size(rationgrid,2)
                if animalgrid(i,j)~=0
                    newrationgrid(i,j)=newrationgrid(i,j)-1;
                end
            end
        end
end