function newgrassgrid=grow(grassgrid)
global GRASS
newgrassgrid=grassgrid;
    for i=1:1:size(grassgrid,1)
        for j=1:1:size(grassgrid,2)
            if newgrassgrid(i,j)~=GRASS && newgrassgrid(i,j)~=-1   
                    newgrassgrid(i,j)=newgrassgrid(i,j)+1;
            end
        end
    end
end