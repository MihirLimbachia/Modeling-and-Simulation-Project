function [newanimalgrid,newgrassgrid,newrationgrid,newagegrid]= move(extanimalgrid,extgrassgrid,extrationgrid,extagegrid)
     global MALESHEEP FEMALESHEEP GRASS BORDER MALEWOLF FEMALEWOLF   

    newanimalgrid=extanimalgrid;
    newgrassgrid=extgrassgrid;
    newrationgrid=extrationgrid;
    newagegrid=extagegrid;
    n=size(newanimalgrid,1);
    m=size(newanimalgrid,2);
    for i=2:1:n-1
        for j=2:1:m-1
            
            if extanimalgrid(i,j)==MALESHEEP || extanimalgrid(i,j)==FEMALESHEEP
            
                if(extgrassgrid(i,j)~=GRASS)       
                        N=newgrassgrid(i-1,j);
                        S=newgrassgrid(i+1,j);
                        E=newgrassgrid(i,j-1);
                        W=newgrassgrid(i,j+1);
                        NE=newgrassgrid(i-1,j-1);
                        NW=newgrassgrid(i-1,j+1);
                        SE=newgrassgrid(i+1,j-1);
                        SW=newgrassgrid(i+1,j+1);
                        Na=newanimalgrid(i-1,j);
                        Sa=newanimalgrid(i+1,j);
                        Ea=newanimalgrid(i,j-1);
                        Wa=newanimalgrid(i,j+1);
                        NEa=newanimalgrid(i-1,j-1);
                        NWa=newanimalgrid(i-1,j+1);
                        SEa=newanimalgrid(i+1,j-1);
                        SWa=newanimalgrid(i+1,j+1);
                        ls=[];
                        Nsg=1;Esg=2;Wsg=3;Ssg=4;
                        NEsg=5;NWsg=6;SEsg=7;SWsg=8;
                        if N==GRASS && Na==0 ls=[ls Nsg];end
                        if  S==GRASS && Sa==0 ls=[ls Ssg];end
                        if  E==GRASS && Ea==0 ls=[ls Esg];end
                        if  W==GRASS && Wa==0 ls=[ls Wsg];end               %% find the location which has grass which is empty. sheep moves to a location preferably with grass
                        if  NE==GRASS && NEa==0 ls=[ls NEsg];end
                        if  NW==GRASS && NWa==0 ls=[ls NWsg];end
                        if  SE==GRASS && SEa==0 ls=[ls SEsg];end
                        if  SW==GRASS && SWa==0 ls=[ls SWsg];end
                        mov=0;
                        if(size(ls,1)==0 || size(ls,2)==0)                                   %% if no such location with a grass without any other empty site at random
                             ls2=[];
                             if N~=BORDER && Na==0 ls2=[ls2 Nsg];end
                             if S~=BORDER && Sa==0 ls2=[ls2 Ssg];end
                             if E~=BORDER && Ea==0 ls2=[ls2 Esg];end
                             if W~=BORDER && Wa==0 ls2=[ls2 Wsg];end
                             if NE~=BORDER && NEa==0 ls2=[ls2 NEsg];end   
                             if NW~=BORDER && NWa==0 ls2=[ls2 NWsg];end
                             if SE~=BORDER && SEa==0 ls2=[ls2 SEsg];end
                             if SW~=BORDER && SWa==0 ls2=[ls2 SWsg];end  
                             mov=0;
                             if size(ls2,1)>0
                                x=randi(size(ls2,2));
                                if x~=0 
                                mov=ls2(1,x);
                                end
                             end
                        else
                            x=randi(size(ls,2));
                            mov=ls(1,x);
                        end
                        
                        switch mov
                            case Nsg
                                newanimalgrid(i-1,j)=newanimalgrid(i,j);
                                newanimalgrid(i,j)=0;                      % move the sheep
                                newrationgrid(i-1,j)=newrationgrid(i,j);
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
                            otherwise
                                nothingtod0=0;
                        end
                end
            end
           
          %{
            if extanimalgrid(i,j)==MALEWOLF || extanimalgrid(i,j)==FEMALEWOLF       
                        Na=newanimalgrid(i-1,j);
                        Sa=newanimalgrid(i+1,j);
                        Ea=newanimalgrid(i,j-1);
                        Wa=newanimalgrid(i,j+1);
                        NEa=newanimalgrid(i-1,j-1);
                        NWa=newanimalgrid(i-1,j+1);
                        SEa=newanimalgrid(i+1,j-1);
                        SWa=newanimalgrid(i+1,j+1);
                        ls=[];
                        Nsg=1;Esg=2;Wsg=3;Ssg=4;
                        NEsg=5;NWsg=6;SEsg=7;SWsg=8;
                        if Na==0 ls=[ls Nsg];end
                        if Sa==0 ls=[ls Ssg];end
                        if  Ea==0 ls=[ls Esg];end
                        if  Wa==0 ls=[ls Wsg];end               %% find the location which is empty. Wolf moves to a neigbouring empty site
                        if  NEa==0 ls=[ls NEsg];end
                        if  NWa==0 ls=[ls NWsg];end
                        if  SEa==0 ls=[ls SEsg];end
                        if  SWa==0 ls=[ls SWsg];end
                        mov=0;
                        if(size(ls,1)~=0 && size(ls,2)~=0)                       %% if no such empty location wolf stays there
                            x=randi(size(ls,2));
                            mov=ls(1,x);
                        end
                        switch mov
                            case Nsg
                                newanimalgrid(i-1,j)=newanimalgrid(i,j);
                                newanimalgrid(i,j)=0;                      % move the wolf to the neighbouring empty site
                                newrationgrid(i-1,j)=newrationgrid(i,j);
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
                            otherwise
                                nothingtod0=0;
                        end
                end
            %}
            end
            
        end
end