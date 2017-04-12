function newgrid=initrationgrid(rationgrid,animalgrid)
    global MALESHEEP FEMALESHEEP MALEWOLF FEMALEWOLF MAX_SHEEP_RATION MAX_WOLF_RATION SHEEP_ENERGY WOLF_ENERGY
    newgrid=zeros(size(rationgrid));
    for i=1:1:size(newgrid,1)
        for j=1:1:size(newgrid,2)
            if animalgrid(i,j)==MALESHEEP || animalgrid(i,j)==FEMALESHEEP
                newgrid(i,j)=SHEEP_ENERGY + randi(MAX_SHEEP_RATION-SHEEP_ENERGY);
            else if animalgrid(i,j)==MALEWOLF || animalgrid(i,j)==FEMALEWOLF      
                newgrid(i,j)=WOLF_ENERGY+randi(MAX_WOLF_RATION-WOLF_ENERGY);
                end
            end
        end
    end
end