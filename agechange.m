function agegrid= agechange(agegrid,animalgrid)
    m=size(agegrid,1);
    n=size(agegrid,2);
    for i=1:1:m
        for j=1:1:n
            if(animalgrid(i,j)~=0)
                agegrid(i,j)=agegrid(i,j)+1;
            end
        end
    end
end