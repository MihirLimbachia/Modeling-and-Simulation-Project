function [newanimalgrid,newagegrid,newrationgrid]=reproduce(extanimalgrid,extagegrid,extrationgrid)
global MALESHEEP FEMALESHEEP MALEWOLF FEMALEWOLF SHEEP_ENERGY WOLF_ENERGY MAX_SHEEP_RATION MAX_WOLF_RATION GRASS BORDER SHEEP_REPRODUCTION_AGE WOLF_REPRODUCTION_AGE;     
    newanimalgrid=extanimalgrid;
    newagegrid=extagegrid;
    newrationgrid=extrationgrid;
    m=size(newrationgrid,1);
    n=size(newrationgrid,2);
    for i=2:1:m-1;
        for j=2:1:n-1
            if newanimalgrid(i,j)==FEMALESHEEP
                        N=newanimalgrid(i-1,j);
                        S=newanimalgrid(i+1,j);
                        E=newanimalgrid(i,j-1);
                        W=newanimalgrid(i,j+1);
                        NE=newanimalgrid(i-1,j-1);
                        NW=newanimalgrid(i-1,j+1);
                        SE=newanimalgrid(i+1,j-1);
                        SW=newanimalgrid(i+1,j+1);
                        ls=[];
                        lsE=[];
                        Nsg=1;Esg=2;Wsg=3;Ssg=4;
                        NEsg=5;NWsg=6;SEsg=7;SWsg=8;
                        if N==MALESHEEP  ls=[ls Nsg];end
                        if  S==MALESHEEP ls=[ls Ssg];end
                        if  E==MALESHEEP ls=[ls Esg];end
                        if  W==MALESHEEP ls=[ls Wsg];end
                        if  NE==MALESHEEP ls=[ls NEsg];end
                        if  NW==MALESHEEP ls=[ls NWsg];end
                        if  SE==MALESHEEP ls=[ls SEsg];end
                        if  SW==MALESHEEP ls=[ls SWsg];end
                        if N==0  lsE=[lsE Nsg];end
                        if S==0 lsE=[lsE Ssg];end
                        if E==0 lsE=[lsE Esg];end
                        if W==0 lsE=[lsE Wsg];end
                        if NE==0 lsE=[lsE NEsg];end
                        if NW==0 lsE=[lsE NWsg];end
                        if SE==0 lsE=[lsE SEsg];end
                        if SW==0 lsE=[lsE SWsg];end
                        mov=0;
                        if (size(lsE,1)>0)
                            x=randi(size(lsE,2));
                            if x~=0 
                                mov=lsE(1,x);
                            end
                        end
                        switch mov
                            case Nsg
                                w=randi(2);
                                if(w==1)    
                                newanimalgrid(i-1,j)=MALESHEEP;
                                else
                                newanimalgrid(i-1,j)=FEMALESHEEP;
                                end
                                newrationgrid(i-1,j)= newrationgrid(i,j)/2;
                                newrationgrid(i,j)=newrationgrid(i,j)/2;
                                newagegrid(i-1,j)=0;
                             case Esg
                                w=randi(2);
                                if(w==1)    
                                newanimalgrid(i,j-1)=MALESHEEP;
                                else
                                newanimalgrid(i,j-1)=FEMALESHEEP;
                                end
                                newrationgrid(i,j-1)= newrationgrid(i,j)/2;
                                newrationgrid(i,j)=newrationgrid(i,j)/2;
                                newagegrid(i,j-1)=0;
                             case Ssg
                                w=randi(2);
                                if(w==1)    
                                newanimalgrid(i+1,j)=MALESHEEP;
                                else
                                newanimalgrid(i+1,j)=FEMALESHEEP;
                                end
                                newrationgrid(i+1,j)= newrationgrid(i,j)/2;
                                newrationgrid(i,j)=newrationgrid(i,j)/2;
                                newagegrid(i+1,j)=0;
                             case Wsg
                                w=randi(2);
                                if(w==1)    
                                newanimalgrid(i,j+1)=MALESHEEP;
                                else
                                newanimalgrid(i,j+1)=FEMALESHEEP;
                                end
                                newrationgrid(i,j+1)= newrationgrid(i,j)/2;
                                newrationgrid(i,j)=newrationgrid(i,j)/2;
                                newagegrid(i,j+1)=0;
                             case NEsg
                                w=randi(2);
                                if(w==1)    
                                newanimalgrid(i-1,j-1)=MALESHEEP;
                                else
                                newanimalgrid(i-1,j-1)=FEMALESHEEP;
                                end
                                newrationgrid(i-1,j-1)= newrationgrid(i,j)/2;
                                newrationgrid(i,j)=newrationgrid(i,j)/2;
                                newagegrid(i-1,j-1)=0;
                             case NWsg
                               w=randi(2);
                                if(w==1)    
                                newanimalgrid(i-1,j+1)=MALESHEEP;
                                else
                                newanimalgrid(i-1,j+1)=FEMALESHEEP;
                                end
                                newrationgrid(i-1,j+1)= newrationgrid(i,j)/2;
                                newrationgrid(i,j)=newrationgrid(i,j)/2;
                                newagegrid(i-1,j+1)=0;
                            case SWsg
                                w=randi(2);
                                if(w==1)    
                                newanimalgrid(i+1,j+1)=MALESHEEP;
                                else
                                newanimalgrid(i+1,j+1)=FEMALESHEEP;
                                end
                                newrationgrid(i+1,j+1)= newrationgrid(i,j)/2;
                                newrationgrid(i,j)=newrationgrid(i,j)/2;
                                newagegrid(i+1,j+1)=0;
                            case SEsg
                                w=randi(2);
                                if(w==1)    
                                newanimalgrid(i+1,j-1)=MALESHEEP;
                                else
                                newanimalgrid(i+1,j-1)=FEMALESHEEP;
                                end
                                newrationgrid(i+1,j-1)= newrationgrid(i,j)/2;
                                newrationgrid(i,j)=newrationgrid(i,j)/2;
                                newagegrid(i+1,j-1)=0;
                            otherwise
                                nothingtodo=0;
                        end           
            end
                
            if newanimalgrid(i,j)==FEMALEWOLF
                        N=newanimalgrid(i-1,j);
                        S=newanimalgrid(i+1,j);
                        E=newanimalgrid(i,j-1);
                        W=newanimalgrid(i,j+1);
                        NE=newanimalgrid(i-1,j-1);
                        NW=newanimalgrid(i-1,j+1);
                        SE=newanimalgrid(i+1,j-1);
                        SW=newanimalgrid(i+1,j+1);
                        ls=[];
                        lsE=[];
                        Nsg=1;Esg=2;Wsg=3;Ssg=4;
                        NEsg=5;NWsg=6;SEsg=7;SWsg=8;
                        if N==MALEWOLF  ls=[ls Nsg];end
                        if  S==MALEWOLF ls=[ls Ssg];end
                        if  E==MALEWOLF ls=[ls Esg];end
                        if  W==MALEWOLF ls=[ls Wsg];end
                        if  NE==MALEWOLF ls=[ls NEsg];end
                        if  NW==MALEWOLF ls=[ls NWsg];end
                        if  SE==MALEWOLF ls=[ls SEsg];end
                        if  SW==MALEWOLF ls=[ls SWsg];end
                        if N==0 lsE=[lsE Nsg];end
                        if S==0 lsE=[lsE Ssg];end
                        if E==0 lsE=[lsE Esg];end
                        if W==0 lsE=[lsE Wsg];end
                        if NE==0 lsE=[lsE NEsg];end
                        if NW==0 lsE=[lsE NWsg];end
                        if SE==0 lsE=[lsE SEsg];end
                        if SW==0 lsE=[lsE SWsg];end
                        mov=0;
                        if size(lsE,1)>0
                            x=randi(size(lsE,2));
                            if x~=0 
                                mov=lsE(1,x);
                            end
                        end
                        switch mov
                            case Nsg
                                w=randi(2);
                                if(w==1)    
                                newanimalgrid(i-1,j)=MALEWOLF;
                                else
                                newanimalgrid(i-1,j)=FEMALEWOLF;
                                end
                                newrationgrid(i-1,j)= newrationgrid(i,j)/2;
                                newrationgrid(i,j)=newrationgrid(i,j)/2;
                                newagegrid(i-1,j)=0;
                             case Esg
                                w=randi(2);
                                if(w==1)    
                                newanimalgrid(i,j-1)=MALEWOLF;
                                else
                                newanimalgrid(i,j-1)=FEMALEWOLF;
                                end
                                newrationgrid(i,j-1)= newrationgrid(i,j)/2;
                                newrationgrid(i,j)=newrationgrid(i,j)/2;
                                newagegrid(i,j-1)=0;
                             case Ssg
                                w=randi(2);
                                if(w==1)    
                                newanimalgrid(i+1,j)=MALEWOLF;
                                else
                                newanimalgrid(i+1,j)=FEMALEWOLF;
                                end
                                newrationgrid(i+1,j)= newrationgrid(i,j)/2;
                                newrationgrid(i,j)=newrationgrid(i,j)/2;
                                newagegrid(i+1,j)=0;
                             case Wsg
                                w=randi(2);
                                if(w==1)    
                                newanimalgrid(i,j+1)=MALEWOLF;
                                else
                                newanimalgrid(i,j+1)=FEMALEWOLF;
                                end
                                newrationgrid(i,j+1)= newrationgrid(i,j)/2;
                                newrationgrid(i,j)=newrationgrid(i,j)/2;
                                newagegrid(i,j+1)=0;
                             case NEsg
                                w=randi(2);
                                if(w==1)    
                                newanimalgrid(i-1,j-1)=MALEWOLF;
                                else
                                newanimalgrid(i-1,j-1)=FEMALEWOLF;
                                end
                                newrationgrid(i-1,j-1)= newrationgrid(i,j)/2;
                                newrationgrid(i,j)=newrationgrid(i,j)/2;
                                newagegrid(i-1,j-1)=0;
                             case NWsg
                               w=randi(2);
                                if(w==1)    
                                newanimalgrid(i-1,j+1)=MALEWOLF;
                                else
                                newanimalgrid(i-1,j+1)=FEMALEWOLF;
                                end
                                newrationgrid(i-1,j+1)= newrationgrid(i,j)/2;
                                newrationgrid(i,j)=newrationgrid(i,j)/2;
                                newagegrid(i-1,j+1)=0;
                            case SWsg
                                w=randi(2);
                                if(w==1)    
                                newanimalgrid(i+1,j+1)=MALEWOLF;
                                else
                                newanimalgrid(i+1,j+1)=FEMALEWOLF;
                                end
                                newrationgrid(i+1,j+1)= newrationgrid(i,j)/2;
                                newrationgrid(i,j)=newrationgrid(i,j)/2;
                                newagegrid(i+1,j+1)=0;
                            case SEsg
                                w=randi(2);
                                if(w==1)    
                                newanimalgrid(i+1,j-1)=MALEWOLF;
                                else
                                newanimalgrid(i+1,j-1)=FEMALEWOLF;
                                end
                                newrationgrid(i+1,j-1)= newrationgrid(i,j)/2;
                                newrationgrid(i,j)=newrationgrid(i,j)/2;
                                newagegrid(i+1,j-1)=0;
                            otherwise
                                nothingtodo=0;
                        end
                        end 
            end    
        end
    end
