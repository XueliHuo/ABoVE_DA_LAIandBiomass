clear all
%% Load geographic information
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/';
load([basedir,'geoinfo.mat']);
%% Load dominant pft information
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/';
load([basedir,'dominantpft95.mat']);
%% Wang's biomass in CLM model area
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/'
load([basedir,'obstransbiomassinmodelarea.mat']);
%% Dominant PFT within Wang's area
dominantpft(isnan(obstransbiomassinmodelarea(:,:,1)))=nan;
%% Model and Observation HTOP
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/';
load([basedir,'refassimicesat_chtop.mat']);


%% Figure 3 (a)
%% NEON Sites
DEJU_lon=-145.75136;
DEJU_lat=63.88112;
DEJU_ixy=find(abs(obs_lon-DEJU_lon)==min(abs(obs_lon-DEJU_lon),[],'all'));%98
DEJU_jxy=find(abs(obs_lat-DEJU_lat)==min(abs(obs_lat-DEJU_lat),[],'all'));%55

HEAL_lon=-149.21335;
HEAL_lat=63.87580;
HEAL_ixy=find(abs(obs_lon-HEAL_lon)==min(abs(obs_lon-HEAL_lon),[],'all'));%85
HEAL_jxy=find(abs(obs_lat-HEAL_lat)==min(abs(obs_lat-HEAL_lat),[],'all'));%55

%% ICESAT Canopy Height
figure
vartoplot=icesat_ch;
vartoplot(isnan(assimhtop.datmat))=nan;
vartoplot(dominantpft~=3)=nan;
%nanmax(vartoplot(:))%30
%nanmin(vartoplot(:))%0
vartoplot(53:57,94:102)=100;
vartoplot(53:57,81:89)=120;
lon=obs_lon-360;
lat=obs_lat;

[Plg,Plt]=meshgrid(lon,lat);
m_proj('Lambert Conformal Conic','lon',[lon(1),lon(size(lon,1))],'lat',[lat(1),lat(size(lat,1))]);  % Example for stereographic projection
m_pcolor(Plg,Plt,vartoplot);
%colormap('spring');
shading flat;
m_grid('fontname','Times New Roman','fontsize',18);
m_coast('linewidth',2,'color','k');
colormap("jet");
set(gca,'Position',[0.040 0.050 0.940 0.90]);
set(gcf,'Position',[1739 77 835 568]);
text(-0.09,0.29,'NEON Sites','FontName','Times New Roman','FontSize',35,'FontWeight','Bold');
text(-0.415,0.29,'(a)','FontName','Times New Roman','FontSize',35,'FontWeight','Bold');
set(gca,'Clim',[85 130])
print(gcf,'/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-EPS-Figures/Figure3a.jpg','-djpeg','-r500');

%% Figure 3 (b)
%% Histogram of NEBT > 95%
refhtop_nebt=refhtop.datmat;
refhtop_nebt(dominantpft~=3)=nan;

assimhtop_nebt=assimhtop.datmat;
assimhtop_nebt(dominantpft~=3)=nan;

icesat_nebt=icesat_ch;
icesat_nebt(isnan(assimhtop.datmat))=nan;
icesat_nebt(dominantpft~=3)=nan;

nbins=15;
[freecounts,freecenters]=hist(refhtop_nebt(:),nbins);
[assimcounts,assimcenters]=hist(assimhtop_nebt(:),nbins);
[icesatcounts,icesatcenters]=hist(icesat_nebt(:),nbins);
%sum(freecounts)
%sum(assimcounts)
%sum(icesatcounts)

%% Figure
figure()
plot(freecenters,freecounts,'Color',[0 0.4470 0.7410],'Linewidth',6); hold on
plot(assimcenters,assimcounts,'Color',[0.8500 0.3250 0.0980],'Linewidth',6,'Linewidth',6); hold on
plot(icesatcenters,icesatcounts,'Color',[0.2010 0.7450 0.0330],'Linewidth',6,'Linewidth',6); hold on

set(gca,'Position',[0.080 0.125 0.88 0.8050])
set(gca,'XLim',[-1 32],'YLim',[0 90],'XTick',xticks,'XTickLabel',xticklabels,'FontSize',30);
xlabel('Canopy Height (m)','FontSize',30,'FontWeight','Bold');
ylabel('Number of grids','FontSize',30,'FontWeight','Bold');
title('NEBT with fraction > 95%','FontSize',35,'FontWeight','Bold');

h1=legend('Free','Assim','ICESat','Location','Northwest');
set(h1,'Box','off');
set(h1,'FontSize',30);
set(gcf,'Position',[244 239 1004 646])

text(-0.415,93,'(b)','FontName','Times New Roman','FontSize',35,'FontWeight','Bold');

%sort(icesatcenters)
%nanmin(icesat_nebt(:))0
%nanmax(icesat_nebt(:))30
%sort(icesat_nebt(:))

%% Figure 3(c)
%% Load htop in free and assimilation runs
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/';
load([basedir,'freeassimpfthtop.mat']);

%% Manually load the NEON AOP data at DEJU as a numeric matrix
filename = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/DEJU_2019_histogram.txt';
%pctnatpft(DEJU_ixy,DEJU_jxy,:)% not vegetated 6.2611;% NEBT 51.0033;% BDBT 0.3911;% BDBS 13.4156;% C3 Arctic Grass 28.9289
%pctnatveg(DEJU_ixy,DEJU_jxy)%95

%% Final plot
figure
plot(DEJU2019histogram(:,1),DEJU2019histogram(:,3),'Color',[0.2010 0.7450 0.0330],'Linewidth',5); hold on
plot(ones(1,11)*freepfthtop(62044),0:0.1:1,'Color',[0 0.4470 0.7410],'Linewidth',5); hold on
plot(ones(1,11)*assimpfthtop(62044),0:0.1:1,'Color',[0.8500 0.3250 0.0980],'Linewidth',5); hold on


plot(ones(1,11)*freepfthtop(62045),0:0.1:1,'-.','Color',[0 0.4470 0.7410],'Linewidth',5); hold on
plot(ones(1,11)*assimpfthtop(62045),0:0.1:1,'-.','Color',[0.8500 0.3250 0.0980],'Linewidth',5); hold on

plot(ones(1,11)*freepfthtop(62046),0:0.1:1,'--','Color',[0 0.4470 0.7410],'Linewidth',5); hold on
plot(ones(1,11)*assimpfthtop(62046),0:0.1:1,'--','Color',[0.8500 0.3250 0.0980],'Linewidth',5); hold on

plot(ones(1,11)*freepfthtop(62047),0:0.1:1,':','Color',[0 0.4470 0.7410],'Linewidth',5); hold on
plot(ones(1,11)*assimpfthtop(62047),0:0.1:1,':','Color',[0.8500 0.3250 0.0980],'Linewidth',5); hold on

plot([assimpfthtop(62044) freepfthtop(62044)],[0.8 0.8],'Color','k','Linewidth',5); hold on
plot([assimpfthtop(62044) assimpfthtop(62044)+1.5],[0.8 0.75],'Color','k','Linewidth',5); hold on
plot([assimpfthtop(62044) assimpfthtop(62044)+1.5],[0.8 0.85],'Color','k','Linewidth',5); hold on

plot([assimpfthtop(62045) freepfthtop(62045)],[0.6 0.6],'Color','k','Linewidth',5); hold on
plot([assimpfthtop(62045) assimpfthtop(62045)+1.5],[0.6 0.55],'Color','k','Linewidth',5); hold on
plot([assimpfthtop(62045) assimpfthtop(62045)+1.5],[0.6 0.65],'Color','k','Linewidth',5); hold on


yticks=0:0.2:1;
xlabel('Canopy Top Height (m)','FontSize',30,'FontWeight','Bold');
ylabel('Relative Occurrence','FontSize',30);
title('NEON site: Delta Junction','FontSize',35,'FontWeight','Bold');
set(gca,'YTick',yticks,'FontSize',30);
h1=legend('NEON AOP','Free NEBT','Assim NEBT','Free BDBT','Assim BDBT','Free BDBS','Assim BDBS','Free C3AG','Assim C3AG');
% NEBT 29.9611;% BDBT 0.5700;% BDBS 25.8322;% C3 Arctic Grass 36.0711
set(h1,'Box','off');
set(h1,'FontSize',30);
set(gca,'Position',[0.09 0.135 0.89 0.80])
set(gcf,'Position',[244 239 1004 646])

text(0.2,1.04,'(c)','FontName','Times New Roman','FontSize',35,'FontWeight','Bold');

%% Supplement HEAL if needed
%% Manually import the NEON AOP data at HEAL as a numeric matrix
filename = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/HEAL_2019_histogram.txt';
%pctnatpft(HEAL_ixy,HEAL_jxy,:)% not vegetated 7.5656;% NEBT 29.9611;% BDBT 0.5700;% BDBS 25.8322;% C3 Arctic Grass 36.0711
%pctnatveg(HEAL_ixy,HEAL_jxy)%99.9883

%% Final plot
figure
plot(HEAL2019histogram(:,1),HEAL2019histogram(:,3),'Color',[0.2010 0.7450 0.0330],'Linewidth',5); hold on
plot(ones(1,11)*freepfthtop(61974),0:0.1:1,'Color',[0 0.4470 0.7410],'Linewidth',5); hold on
plot(ones(1,11)*assimpfthtop(61974),0:0.1:1,'Color',[0.8500 0.3250 0.0980],'Linewidth',5); hold on

plot(ones(1,11)*freepfthtop(61975),0:0.1:1,'-.','Color',[0 0.4470 0.7410],'Linewidth',5); hold on
plot(ones(1,11)*assimpfthtop(61975),0:0.1:1,'-.','Color',[0.8500 0.3250 0.0980],'Linewidth',5); hold on

plot(ones(1,11)*freepfthtop(61976),0:0.1:1,'--','Color',[0 0.4470 0.7410],'Linewidth',5); hold on
plot(ones(1,11)*assimpfthtop(61976),0:0.1:1,'--','Color',[0.8500 0.3250 0.0980],'Linewidth',5); hold on

plot(ones(1,11)*freepfthtop(61977),0:0.1:1,':','Color',[0 0.4470 0.7410],'Linewidth',5); hold on
plot(ones(1,11)*assimpfthtop(61977),0:0.1:1,':','Color',[0.8500 0.3250 0.0980],'Linewidth',5); hold on

plot([assimpfthtop(61974) freepfthtop(61974)],[0.8 0.8],'Color','k','Linewidth',5); hold on
plot([assimpfthtop(61974) assimpfthtop(61974)+1.5],[0.8 0.75],'Color','k','Linewidth',5); hold on
plot([assimpfthtop(61974) assimpfthtop(61974)+1.5],[0.8 0.85],'Color','k','Linewidth',5); hold on

plot([assimpfthtop(61975) freepfthtop(61975)],[0.6 0.6],'Color','k','Linewidth',5); hold on
plot([assimpfthtop(61975) assimpfthtop(61975)+1.5],[0.6 0.55],'Color','k','Linewidth',5); hold on
plot([assimpfthtop(61975) assimpfthtop(61975)+1.5],[0.6 0.65],'Color','k','Linewidth',5); hold on

yticks=0:0.2:1;
xlabel('Canopy Top Height (m)','FontSize',30,'FontWeight','Bold');
ylabel('Relative Occurrence','FontSize',30);
title('NEON site: Healy','FontSize',35,'FontWeight','Bold');
set(gca,'XLim',[0 50],'YTick',yticks,'FontSize',30);
h1=legend('NEON AOP','Free NEBT','Assim NEBT','Free BDBT','Assim BDBT','Free BDBS','Assim BDBS','Free C3AG','Assim C3AG');
% NEBT 29.9611;% BDBT 0.5700;% BDBS 25.8322;% C3 Arctic Grass 36.0711
set(h1,'Box','off');
set(h1,'FontSize',30);
set(gca,'Position',[0.09 0.135 0.89 0.80])
set(gcf,'Position',[244 239 1004 646])

text(0.2,1.04,'(d)','FontName','Times New Roman','FontSize',35,'FontWeight','Bold');


