function newgrid=extendwithconstantboundaryvalue(grid)
   global BORDER
    m=size(grid,1);
    n=size(grid,2);
    row= BORDER.*ones(1,n);
    col=BORDER.*ones(m+2,1);
    newgridtemp=[row;grid;row];
    newgrid=[col newgridtemp col];
end