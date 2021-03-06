function M=animdiffusion(grassgrids,animalgrids)
global MALESHEEP FEMALESHEEP MALEWOLF FEMALEWOLF MAX_SHEEP_RATION MAX_WOLF_RATION SHEEP_ENERGY WOLF_ENERGY GRASS BORDER
size(grassgrids)
lengthGrids = size(grassgrids, 3);
M = moviein(lengthGrids);

m = size(grassgrids, 1);
n = size(grassgrids, 2);

grids=zeros(m,n,lengthGrids+1);

grass=1;barren=2;gms=3;gmw=4;bms=5;bmw=6;gfs=7;gfw=8;bfs=9;bfw=10;
for k=1:lengthGrids
    g=grassgrids(:,:,k);
    a=animalgrids(:,:,k);
    grid=zeros(m,n);
    for i=1:1:m
        for j=1:1:n
            if g(i,j)==GRASS
                 if a(i,j)==MALESHEEP
                    grid(i,j)=gms;
                 elseif a(i,j)==FEMALESHEEP
                      grid(i,j)=gfs;  
                 
                 elseif a(i,j)==MALEWOLF
                      grid(i,j)=gmw;
                 
                 elseif a(i,j)==FEMALEWOLF
                      grid(i,j)=gfw;     
                 else 
                     grid(i,j)=grass;
                 end       
            end
            if g(i,j)~=GRASS
                 if a(i,j)==MALESHEEP
                    grid(i,j)=bms;
                 elseif a(i,j)==FEMALESHEEP
                      grid(i,j)=bfs;  
                 
                 elseif a(i,j)==MALEWOLF
                      grid(i,j)=bmw;
                 
                 elseif a(i,j)==FEMALEWOLF
                      grid(i,j)=bfw;     
                 else 
                     grid(i,j)=barren;
                 end       
            end
            
        end
    end
        grids(:,:,k)=grid;
end
% seperate male - female 
%{
map = zeros(10+1, 3);
map(barren+1,:)=[(165.0/255),(42.0/255),(42.0/255)];
map(grass+1,:)=[0,1,0];                           
map(gfs+1,:)=[(205.0/255),(255.0/255),(155.0/255)];
map(gms+1,:)=[0,(250.0/255),(154.0/255)];
map(gmw+1,:)=[(255.0/255),(0.0/255),(0.0/255)];
map(gfw+1,:)=[(220.0/255);(143.0/255);(177.0/255)];
map(bms+1,:)=[(139.0/255),(115.0/255),(85.0/255)];
map(bfs+1,:)=[(255.0/255),(211.0/255),(155.0/255)];
map(bmw+1,:)=[(128.0/255),(106.0/255),(251.0/255)];
map(bfw+1,:)=[(210.0/255),(197.0/255),(32.0/255)];
% single color male female - male color
%}

map = zeros(10+1, 3);
map(barren+1,:)=[(165.0/255),(42.0/255),(42.0/255)];
map(grass+1,:)=[0,1,0];                           
map(gfs+1,:)=[0,(250.0/255),(154.0/255)];
map(gms+1,:)=[0,(250.0/255),(154.0/255)];
map(gmw+1,:)=[(255.0/255),(0.0/255),(0.0/255)];
map(gfw+1,:)=[(255.0/255),(0.0/255),(0.0/255)];
map(bms+1,:)=[(139.0/255),(115.0/255),(85.0/255)];
map(bfs+1,:)=[(139.0/255),(115.0/255),(85.0/255)];
map(bmw+1,:)=[(128.0/255),(106.0/255),(251.0/255)];
map(bfw+1,:)=[(128.0/255),(106.0/255),(251.0/255)];




colormap(map);
for k = 1:lengthGrids
    g = grids(:, :, k);
    image(g + 1)
    colormap(map);
    axis([0 m 0 n]);
    axis equal;
    axis off;
    M(k) = getframe;
end;
to_gif(M, 'E:\Sem 6\ModSim\1_t6.gif', 'LoopCount', 0, 'DelayTime', 0)
end