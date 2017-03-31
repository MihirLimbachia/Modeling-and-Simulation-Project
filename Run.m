clear all;
close all;

global MALESHEEP FEMALESHEEP MALEWOLF FEMALEWOLF SHEEP_ENERGY WOLF_ENERGY MAX_SHEEP_RATION MAX_WOLF_RATION GRASS BORDER SHEEP_REPRODUCTION_AGE WOLF_REPRODUCTION_AGE;
MALESHEEP=1;
FEMALESHEEP=2;
MALEWOLF=3;
FEMALEWOLF=4;
SHEEP_ENERGY=20;
BORDER=100;
WOLF_ENERGY=17;
SHEEP_REPRODUCTION_AGE=2;
WOLF_REPRODUCTION_AGE=4;
MAX_SHEEP_RATION=2*SHEEP_ENERGY;
MAX_WOLF_RATION=2*WOLF_ENERGY;
GRASS=4;
probgrass=1;
m=50;
n=50;
expected_no_sheep=300;
expected_no_wolf=15;
psheep=expected_no_sheep/(m*n);
pwolf=expected_no_wolf/(m*n);
grassgrid=zeros(m,n);
grassgrid=initgrassgrid(grassgrid,probgrass);
animalgrid=zeros(m,n);
animalgrid=initanimalgrid(animalgrid,psheep,pwolf,expected_no_sheep,expected_no_wolf);
animalagegrid=zeros(size(animalgrid));
rationgrid=zeros(m,n);
rationgrid=initrationgrid(rationgrid,animalgrid);
agegrid=zeros(m,n);
t=300;
grassgrids = zeros(m,n,t+1);
animalgrids = zeros(m,n,t+1);
grassgrids(:,:,1)=grassgrid;
animalgrids(:,:,1)=animalgrid;
popsheep=zeros(1,t+1);
popwolf=zeros(1,t+1);
popgrass=zeros(1,t+1);
[popsheep(1),popwolf(1),popgrass(1)]=getpopulation(animalgrid,grassgrid);
for i=2:1:t+1
    extgrassgrid=extendwithconstantboundaryvalue(grassgrid,BORDER);
    extanimalgrid=extendwithconstantboundaryvalue(animalgrid,BORDER);
    extrationgrid=extendwithconstantboundaryvalue(rationgrid,BORDER);
    extagegrid=extendwithconstantboundaryvalue(agegrid,BORDER);
    [extgrassgrid,extanimalgrid,extrationgrid]=consume(extgrassgrid,extanimalgrid,extrationgrid,extagegrid);   
    [extanimalgrid,extgrassgrid,extrationgrid]=move(extanimalgrid,extgrassgrid,extrationgrid,extagegrid);  
    [extanimalgrid,extagegrid,extrationgrid]=reproduce(extanimalgrid,extagegrid,extrationgrid);
    grassgrid=dextgrid(extgrassgrid);
    animalgrid=dextgrid(extanimalgrid);
    rationgrid=dextgrid(extrationgrid);
    rationgrid=decreaseration(rationgrid,animalgrid);
    agegrid=dextgrid(extagegrid);
    agegrid=agechange(agegrid,animalgrid);
    grassgrid=grow(grassgrid);
    animalgrid=die(animalgrid,rationgrid,agegrid);
    [popsheep(i),popwolf(i),popgrass(i)]=getpopulation(animalgrid,grassgrid);
    grassgrids(:,:,i)=grassgrid;
    animalgrids(:,:,i)=animalgrid;
end
figure;
plot(popsheep,'r');
hold on
plot(popwolf,'k');
hold on
plot(popgrass,'g');

figure;

M=animdiffusion(grassgrids,animalgrids);

