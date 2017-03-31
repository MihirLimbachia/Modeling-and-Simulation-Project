function [x,y,z] = getpopulation(animalgrid,grassgrid)
    global MALESHEEP FEMALESHEEP MALEWOLF FEMALEWOLF GRASS        
        m=size(animalgrid,1);
        n=size(animalgrid,2);
        x=0;
        y=0;
        z=0;
        for i=1:1:m
            for j=1:1:n
                if animalgrid(i,j)==MALESHEEP || animalgrid(i,j)==FEMALESHEEP
                    x=x+1;
                end
                if animalgrid(i,j)==MALEWOLF || animalgrid(i,j)==FEMALEWOLF
                    y=y+1;
                end
                if grassgrid(i,j)==GRASS
                    z=z+1;
                end 
            end
        end

end