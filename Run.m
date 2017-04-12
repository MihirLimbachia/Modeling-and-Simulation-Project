clear all;
close all;

global MALESHEEP FEMALESHEEP MALEWOLF FEMALEWOLF SHEEP_ENERGY WOLF_ENERGY MAX_SHEEP_RATION
global  MAX_WOLF_RATION GRASS BORDER SHEEP_REPRODUCTION_AGE WOLF_REPRODUCTION_AGE 
global REPRODUCTION_SHEEP_RATION REPRODUCTION_WOLF_RATION ;
MALESHEEP=1;
FEMALESHEEP=2;
MALEWOLF=3;
FEMALEWOLF=4;
SHEEP_ENERGY=4;                          
WOLF_ENERGY=15;
SHEEP_REPRODUCTION_AGE=8;
WOLF_REPRODUCTION_AGE=8;
REPRODUCTION_SHEEP_RATION=4;
REPRODUCTION_WOLF_RATION=8;
MAX_SHEEP_RATION=2*SHEEP_ENERGY;
MAX_WOLF_RATION=3*WOLF_ENERGY;
GRASS=4;
BORDER=1000;
m=30;
n=30;
expected_no_sheep=250;
expected_no_wolf=7;
psheep=expected_no_sheep/(m*n);
pwolf=expected_no_wolf/(m*n);
probgrass=1;
niter=100;
t=1000;
avgpopsheep=zeros(1,t+1);
avgpopwolf=zeros(1,t+1);
avgpopgrass=zeros(1,t+1);
%for p=1:1:niter
grassgrid=zeros(m,n);
grassgrid=initgrassgrid(grassgrid,probgrass);
animalgrid=zeros(m,n);
animalgrid=initanimalgrid(animalgrid,psheep,pwolf,expected_no_sheep,expected_no_wolf);
animalagegrid=zeros(size(animalgrid));
rationgrid=zeros(m,n);
rationgrid=initrationgrid(rationgrid,animalgrid);
agegrid=zeros(m,n);

grassgrids = zeros(m,n,t+1);
animalgrids = zeros(m,n,t+1);
rationgrids =zeros(m,n,t+1);

popsheep=zeros(1,t+1);
popwolf=zeros(1,t+1);
popgrass=zeros(1,t+1);
[popsheep(1),popwolf(1),popgrass(1)]=getpopulation(animalgrid,grassgrid);
    extgrassgrid=extendwithconstantboundaryvalue(grassgrid);
    extanimalgrid=extendwithconstantboundaryvalue(animalgrid);
    extrationgrid=extendwithconstantboundaryvalue(rationgrid);
    extagegrid=extendwithconstantboundaryvalue(agegrid);
    grassgrids(:,:,1)=grassgrid;
    animalgrids(:,:,1)=animalgrid;
    rationgrids(:,:,1)=rationgrid;
for i=2:1:t+1
    extgrassgrid=extendwithconstantboundaryvalue(grassgrid);
    extanimalgrid=extendwithconstantboundaryvalue(animalgrid);
    extrationgrid=extendwithconstantboundaryvalue(rationgrid);
    extagegrid=extendwithconstantboundaryvalue(agegrid);
    
    [extgrassgrid,extanimalgrid,extrationgrid]=consume(extgrassgrid,extanimalgrid,extrationgrid,extagegrid);   
    [extanimalgrid,extagegrid,extrationgrid]=reproduce(extanimalgrid,extagegrid,extrationgrid);
    [extanimalgrid,extgrassgrid,extrationgrid]=move(extanimalgrid,extgrassgrid,extrationgrid,extagegrid);  
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
    rationgrids(:,:,i)=rationgrid;
end
%avgpopsheep=avgpopsheep + popsheep;
%avgpopwolf=avgpopwolf + popwolf;
%avgpopgrass=avgpopgrass + popgrass;
%figure;
plot(popsheep,'r');
hold on
plot(popwolf,'k');
hold on
plot(popgrass,'g');
legend('Sheep','Wolf','Grass')
xlabel('Time')
ylabel('Population')
title('Population vs Time')
%end
%avgpopsheep=avgpopsheep*1.0/niter;
%avgpopwolf=avgpopwolf*1.0/niter;
%avgpopgrass=avgpopgrass*1.0/niter;
%figure;
%plot(avgpopsheep,'r');
%hold on
%plot(avgpopwolf,'k');
%hold on
%plot(avgpopgrass,'g');
%legend('Sheep','Wolf','Grass')
%figure;
figure;
M=animdiffusion(grassgrids,animalgrids);

%movie2avi(M,'E:\Sem 6\ModSim\1.avi','compression','none','fps',4)
