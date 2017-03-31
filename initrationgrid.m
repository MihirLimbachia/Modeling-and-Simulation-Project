function newgrid=initrationgrid(rationgrid,animalgrid)
    global MALESHEEP FEMALESHEEP MALEWOLF FEMALEWOLF MAX_SHEEP_RATION MAX_WOLF_RATION
    newgrid=zeros(size(rationgrid));
    for i=1:1:size(newgrid,1)
        for j=1:1:size(newgrid,2)
            if animalgrid(i,j)==MALESHEEP || animalgrid(i,j)==FEMALESHEEP
                newgrid(i,j)=randi(MAX_SHEEP_RATION);
            else if animalgrid(i,j)==MALEWOLF || animalgrid(i,j)==FEMALEWOLF      
                newgrid(i,j)=randi(MAX_WOLF_RATION);
                end
            end
        end
    end
end