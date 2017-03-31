function newgrid=extendwithconstantboundaryvalue(grid,constant)
    m=size(grid,1);
    n=size(grid,2);
    row=constant.*zeros(1,n);
    col=constant.*zeros(m+2,1);
    newgridtemp=[row;grid;row];
    newgrid=[col newgridtemp col];
end