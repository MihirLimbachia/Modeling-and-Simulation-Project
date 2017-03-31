function newgrid=initanimalgrid(animalgrid,psheep,pwolf,nsheep,nwolf)
    global MALESHEEP FEMALESHEEP MALEWOLF FEMALEWOLF;
    cs=0;
    cw=0;
    while(cs~=nsheep || cw~=nwolf)
    cs=0;
    cw=0;
    newgrid=zeros(size(animalgrid));
    for i=1:1:size(newgrid,1)
        for j=1:1:size(newgrid,2)
            r=rand();
            if r<=pwolf
                if(rand()<=0.5)
                newgrid(i,j)=MALEWOLF;
                else
                newgrid(i,j)=FEMALEWOLF;    
                end
                cw=cw+1;
            else if r<=pwolf+psheep
                 if(rand()<=0.5)
                newgrid(i,j)=MALESHEEP;
                else
                newgrid(i,j)=FEMALESHEEP;    
                 end
                cs=cs+1; 
                end  
            end
        end
    end
    end
    disp(cs);
    disp(cw);
end
    