function [newanimalgrid,newrationgrid,newagegrid]=die(animalgrid,rationgrid,agegrid)
global MALESHEEP FEMALESHEEP MALEWOLF FEMALEWOLF MAX_SHEEP_RATION MAX_WOLF_RATION SHEEP_ENERGY WOLF_ENERGY GRASS BORDER SHEEP_REPRODUCTION_AGE
global WOLF_REPRODUCTION_AGE  
    m=size(animalgrid,1);
    n=size(animalgrid,2);
    newanimalgrid=animalgrid;
    newrationgrid=rationgrid;
    newagegrid=agegrid;
    for i=1:1:m
        for j=1:1:n
        %    if newanimalgrid(i,j)~=MALEWOLF &&  newanimalgrid(i,j)~=FEMALEWOLF
                if rationgrid(i,j)<=0
                    newrationgrid(i,j)=0;
                    newanimalgrid(i,j)=0;
                    newagegrid(i,j)=0;
                end
                
              %   if agegrid(i,j)>=3*SHEEP_REPRODUCTION_AGE && (animalgrid(i,j)==FEMALESHEEP || MALESHEEP) 
              %      newrationgrid(i,j)=0;
              %      newanimalgrid(i,j)=0;
              %      newagegrid(i,j)=0;
              %   end
              %   if agegrid(i,j)>=3*WOLF_REPRODUCTION_AGE && (animalgrid(i,j)==FEMALEWOLF || MALEWOLF) 
              %      newrationgrid(i,j)=0;
              %      newanimalgrid(i,j)=0;
              %      newagegrid(i,j)=0;
              %   end  
        %    end 
        end
    end
end