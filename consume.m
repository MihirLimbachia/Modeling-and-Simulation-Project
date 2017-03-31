function [newgrassgrid,newanimalgrid,newrationgrid,newagegrid]= consume(grassgrid,animalgrid,rationgrid,extagegrid)
    global MALESHEEP FEMALESHEEP MALEWOLF FEMALEWOLF MAX_SHEEP_RATION MAX_WOLF_RATION SHEEP_ENERGY WOLF_ENERGY GRASS BORDER
    newgrassgrid=grassgrid;
    newanimalgrid=animalgrid;
    newrationgrid=rationgrid;
    newagegrid=extagegrid;
    n=size(animalgrid,1);
    m=size(animalgrid,2);
    for i=2:1:n-1
        for j=2:1:m-1
            if animalgrid(i,j)==MALESHEEP || animalgrid(i,j)==FEMALESHEEP
                if grassgrid(i,j)==GRASS && rationgrid(i,j)<MAX_SHEEP_RATION
                    newgrassgrid(i,j)=0;
                    newrationgrid(i,j)=min(MAX_SHEEP_RATION,rationgrid(i,j)+SHEEP_ENERGY);
                end
            end
        end
    end
    
    for i=2:1:n-1
        for j=2:1:m-1
            if newanimalgrid(i,j)==MALEWOLF || newanimalgrid(i,j)==FEMALEWOLF
                    if(newrationgrid(i,j)<MAX_WOLF_RATION)    
                        N=newanimalgrid(i-1,j);
                        S=newanimalgrid(i+1,j);
                        E=newanimalgrid(i,j-1);
                        W=newanimalgrid(i,j+1);
                        NE=newanimalgrid(i-1,j-1);
                        NW=newanimalgrid(i-1,j+1);
                        SE=newanimalgrid(i+1,j-1);
                        SW=newanimalgrid(i+1,j+1);
                        ls=[];
                        Nsg=1;Esg=2;Wsg=3;Ssg=4;
                        NEsg=5;NWsg=6;SEsg=7;SWsg=8;
                        if N==MALESHEEP || N==FEMALESHEEP ls=[ls Nsg];end
                        if  S==MALESHEEP || S==FEMALESHEEP ls=[ls Ssg];end
                        if  E==MALESHEEP || E==FEMALESHEEP ls=[ls Esg];end
                        if  W==MALESHEEP || W==FEMALESHEEP ls=[ls Wsg];end
                        if  NE==MALESHEEP || NE==FEMALESHEEP ls=[ls NEsg];end
                        if  NW==MALESHEEP || NW==FEMALESHEEP ls=[ls NWsg];end
                        if  SE==MALESHEEP || SE==FEMALESHEEP ls=[ls SEsg];end
                        if  SW==MALESHEEP || SW==FEMALESHEEP ls=[ls SWsg];end
                        if(size(ls,2)==0)
                             ls2=[];
                             if N==0 ls2=[ls2 Nsg];end
                             if S==0 ls2=[ls2 Ssg];end
                             if E==0 ls2=[ls2 Esg];end
                             if W==0 ls2=[ls2 Wsg];end
                             if NE==0 ls2=[ls2 NEsg];end
                             if NW==0 ls2=[ls2 NWsg];end
                             if SE==0 ls2=[ls2 SEsg];end
                             if SW==0 ls2=[ls2 SWsg];end  
                             mov=0;
                             if size(ls2,1)>0
                                x=randi(size(ls2,2));
                                if x~=0 
                                mov=ls2(1,x);
                                end
                             end 
                        switch mov
                            case Nsg
                                newanimalgrid(i-1,j)=newanimalgrid(i,j);
                                newanimalgrid(i,j)=0;
                                newrationgrid(i-1,j)= newrationgrid(i,j);
                                newrationgrid(i,j)=0;
                                newagegrid(i-1,j)=newagegrid(i,j);
                                newagegrid(i,j)=0;
                             case Esg
                                newanimalgrid(i,j-1)=newanimalgrid(i,j);
                                newanimalgrid(i,j)=0;
                                newrationgrid(i,j-1)=newrationgrid(i,j);
                                newrationgrid(i,j)=0;
                                newagegrid(i,j-1)=newagegrid(i,j);
                                newagegrid(i,j)=0;
                             case Ssg
                                newanimalgrid(i+1,j)=newanimalgrid(i,j);
                                newanimalgrid(i,j)=0;
                                newrationgrid(i+1,j)=newrationgrid(i,j);
                                newrationgrid(i,j)=0;
                                newagegrid(i+1,j)=newagegrid(i,j);
                                newagegrid(i,j)=0;
                             case Wsg
                                newanimalgrid(i,j+1)=newanimalgrid(i,j);
                                newanimalgrid(i,j)=0;
                                newrationgrid(i,j+1)=newrationgrid(i,j);
                                newrationgrid(i,j)=0;
                                newagegrid(i,j+1)=newagegrid(i,j);
                                newagegrid(i,j)=0;
                             case NEsg
                                newanimalgrid(i-1,j-1)=newanimalgrid(i,j);
                                newanimalgrid(i,j)=0;
                                newrationgrid(i-1,j-1)=newrationgrid(i,j);
                                newrationgrid(i,j)=0;
                                newagegrid(i-1,j-1)=newagegrid(i,j);
                                newagegrid(i,j)=0;
                             case NWsg
                                newanimalgrid(i-1,j+1)=newanimalgrid(i,j);
                                newanimalgrid(i,j)=0;
                                newrationgrid(i-1,j+1)=newrationgrid(i,j);
                                newrationgrid(i,j)=0;
                                newagegrid(i-1,j+1)=newagegrid(i,j);
                                newagegrid(i,j)=0;
                            case SWsg
                                newanimalgrid(i+1,j+1)=newanimalgrid(i,j);
                                newanimalgrid(i,j)=0;
                                newrationgrid(i+1,j+1)=newrationgrid(i,j);
                                newrationgrid(i,j)=0;
                                newagegrid(i+1,j+1)=newagegrid(i,j);
                                newagegrid(i,j)=0;
                            case SEsg
                                newanimalgrid(i+1,j-1)=newanimalgrid(i,j);
                                newanimalgrid(i,j)=0;
                                newrationgrid(i+1,j-1)=newrationgrid(i,j);
                                newrationgrid(i,j)=0;
                                newagegrid(i+1,j-1)=newagegrid(i,j);
                                newagegrid(i,j)=0;
                        end
                        else
                            x=randi(size(ls,2));
                            mov=ls(1,x);
                        switch mov
                            case Nsg
                                newanimalgrid(i-1,j)=newanimalgrid(i,j);
                                newanimalgrid(i,j)=0;
                                newrationgrid(i-1,j)=min(MAX_WOLF_RATION,newrationgrid(i,j)+WOLF_ENERGY);
                                newrationgrid(i,j)=0;
                                newagegrid(i-1,j)=newagegrid(i,j);
                                newagegrid(i,j)=0;
                             case Esg
                                newanimalgrid(i,j-1)=newanimalgrid(i,j);
                                newanimalgrid(i,j)=0;
                                newrationgrid(i,j-1)=min(MAX_WOLF_RATION,newrationgrid(i,j)+WOLF_ENERGY);
                                newrationgrid(i,j)=0;
                                newagegrid(i,j-1)=newagegrid(i,j);
                                newagegrid(i,j)=0;
                             case Ssg
                                newanimalgrid(i+1,j)=newanimalgrid(i,j);
                                newanimalgrid(i,j)=0;
                                newrationgrid(i+1,j)=min(MAX_WOLF_RATION,newrationgrid(i,j)+WOLF_ENERGY);
                                newrationgrid(i,j)=0;
                                newagegrid(i+1,j)=newagegrid(i,j);
                                newagegrid(i,j)=0;
                             case Wsg
                                newanimalgrid(i,j+1)=newanimalgrid(i,j);
                                newanimalgrid(i,j)=0;
                                newrationgrid(i,j+1)=min(MAX_WOLF_RATION,newrationgrid(i,j)+WOLF_ENERGY);
                                newrationgrid(i,j)=0;
                                newagegrid(i,j+1)=newagegrid(i,j);
                                newagegrid(i,j)=0;
                             case NEsg
                                newanimalgrid(i-1,j-1)=newanimalgrid(i,j);
                                newanimalgrid(i,j)=0;
                                newrationgrid(i-1,j-1)=min(MAX_WOLF_RATION,newrationgrid(i,j)+WOLF_ENERGY);
                                newrationgrid(i,j)=0;
                                newagegrid(i-1,j-1)=newagegrid(i,j);
                                newagegrid(i,j)=0;
                             case NWsg
                                newanimalgrid(i-1,j+1)=newanimalgrid(i,j);
                                newanimalgrid(i,j)=0;
                                newrationgrid(i-1,j+1)=min(MAX_WOLF_RATION,newrationgrid(i,j)+WOLF_ENERGY);
                                newrationgrid(i,j)=0;
                                newagegrid(i-1,j+1)=newagegrid(i,j);
                                newagegrid(i,j)=0;
                            case SWsg
                                newanimalgrid(i+1,j+1)=newanimalgrid(i,j);
                                newanimalgrid(i,j)=0;
                                newrationgrid(i+1,j+1)=min(MAX_WOLF_RATION,newrationgrid(i,j)+WOLF_ENERGY);
                                newrationgrid(i,j)=0;
                                newagegrid(i+1,j+1)=newagegrid(i,j);
                                newagegrid(i,j)=0;
                            case SEsg
                                newanimalgrid(i+1,j-1)=newanimalgrid(i,j);
                                newanimalgrid(i,j)=0;
                                newrationgrid(i+1,j-1)=min(MAX_WOLF_RATION,newrationgrid(i,j)+WOLF_ENERGY);
                                newrationgrid(i,j)=0;
                                newagegrid(i+1,j-1)=newagegrid(i,j);
                                newagegrid(i,j)=0;
                            otherwise
                                nothingtodo=0;
                        end
                        end
              end
              end
          end
        end
            
    end
