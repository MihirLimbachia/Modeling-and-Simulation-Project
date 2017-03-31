function newgrid=initgrassgrid(grassgrid,probg)
    global GRASS
    newgrid=zeros(size(grassgrid));
    for i=1:1:size(grassgrid,1)
        for j=1:1:size(grassgrid,2)
            if rand()<=probg
                newgrid(i,j)=GRASS;
            else newgrid(i,j)=-1;
            end
        end
    end
end