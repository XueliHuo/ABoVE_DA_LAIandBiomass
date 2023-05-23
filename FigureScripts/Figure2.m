clear all
%% Load geographic information
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/';
load([basedir,'geoinfo.mat']);
%% Model LAI and biomass
%% free
load([basedir,'biomassTLAIfreerun.mat']);
%% assimbothsepdisout
load([basedir,'biomassTLAIassimbothsepdisout.mat']);
%% Modis LAI observation and Wang biomass
load([basedir,'obslaimonth.mat']);
load([basedir,'obstransbiomassinmodelarea.mat']);

%% LAI Observation
obslai_avg_time_ens_lasteight=squeeze(nanmean(obs_lai_month(:,:,[19:12:103;20:12:104]),3));

%% Free run LAI
freeTLAI_avg_ens=squeeze(nanmean(freeTLAI,4));
freelai_avg_ens_lasteight=squeeze(nanmean(freeTLAI_avg_ens(:,:,[19:12:103;20:12:104]),3));
freelai_avg_ens_lasteight(isnan(obslai_avg_time_ens_lasteight))=nan;

%% Assim run LAI
assimbothsepdisoutTLAI_avg_ens=squeeze(nanmean(assimbothsepdisoutTLAI,4));
assimbothsepdisoutlai_avg_ens_lasteight=squeeze(nanmean(assimbothsepdisoutTLAI_avg_ens(:,:,[19:12:103;20:12:104]),3));
assimbothsepdisoutlai_avg_ens_lasteight(isnan(obslai_avg_time_ens_lasteight))=nan;
%% LAI
difflaispatialfreemobs=freelai_avg_ens_lasteight-obslai_avg_time_ens_lasteight;
figure();
lon=obs_lon-360;
lat=obs_lat;

[Plg,Plt]=meshgrid(lon,lat);
m_proj('Lambert Conformal Conic','lon',[lon(1),lon(size(lon,1))],'lat',[lat(1),lat(size(lat,1))]);  % Example for stereographic projection
m_pcolor(Plg,Plt,difflaispatialfreemobs);
%colormap('spring');
shading flat;
m_grid('fontname','Times New Roman','fontsize',18);
m_coast('linewidth',2,'color','k');
c = centered_colorbar;
c.Label.String = 'LAI (m^2 m^-^2)';
c.Location = 'southoutside';
c.FontSize = 28;
c.FontWeight = 'bold';
c.FontName = 'Times New Roman';
set(gca,'Position',[0.0500 0.21 0.90 0.7338]);
set(gcf,'Position',[1000 765 807 573]);
text(-0.08,0.29,'Free-Obs','FontName','Times New Roman','FontSize',35,'FontWeight','Bold');
text(-0.415,0.29,'(a)','FontName','Times New Roman','FontSize',35,'FontWeight','Bold');
text(-0.09,0.255,'2012-2019 average','FontName','Times New Roman','FontSize',20);
print(gcf,'/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-EPS-Figures/Figure2a.jpg','-djpeg','-r500'); 

% Assim
difflaispatialassimmobs=assimbothsepdisoutlai_avg_ens_lasteight-obslai_avg_time_ens_lasteight;
figure();
lon=obs_lon-360;
lat=obs_lat;

[Plg,Plt]=meshgrid(lon,lat);
m_proj('Lambert Conformal Conic','lon',[lon(1),lon(size(lon,1))],'lat',[lat(1),lat(size(lat,1))]);  % Example for stereographic projection
m_pcolor(Plg,Plt,difflaispatialassimmobs);
%colormap('spring');
shading flat;
m_grid('fontname','Times New Roman','fontsize',18);
m_coast('linewidth',2,'color','k');
c = centered_colorbar;
c.Label.String = 'LAI (m^2 m^-^2)';
c.Location = 'southoutside';
c.FontSize = 28;
c.FontWeight = 'bold';
c.FontName = 'Times New Roman';
set(gca,'Position',[0.0500 0.21 0.90 0.7338]);
set(gcf,'Position',[1000 765 807 573]);
text(-0.095,0.29,'Assim-Obs','FontName','Times New Roman','FontSize',35,'FontWeight','Bold');
text(-0.418,0.29,'(b)','FontName','Times New Roman','FontSize',35,'FontWeight','Bold');
text(-0.09,0.255,'2012-2019 average','FontName','Times New Roman','FontSize',20);
set(gca,'Clim',[-7.0468 7.0468])
print(gcf,'/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-EPS-Figures/Figure2b.jpg','-djpeg','-r500'); 

%% biomass
% free 
freebiomass_avg_ens=squeeze(nanmean(freebiomass,4));
diffbiomassspatialfreemobs=squeeze(nanmean(freebiomass_avg_ens(:,:,37:48),3))-obstransbiomassinmodelarea(:,:,4);
figure();
lon=obs_lon-360;
lat=obs_lat;

[Plg,Plt]=meshgrid(lon,lat);
m_proj('Lambert Conformal Conic','lon',[lon(1),lon(size(lon,1))],'lat',[lat(1),lat(size(lat,1))]);  % Example for stereographic projection
m_pcolor(Plg,Plt,diffbiomassspatialfreemobs);
%colormap('spring');
shading flat;
m_grid('fontname','Times New Roman','fontsize',18);
m_coast('linewidth',2,'color','k');
c = centered_colorbar;
c.Label.String = 'Aboveground Biomass (gC m^-^2)';
c.Location = 'southoutside';
c.FontSize = 28;
c.FontWeight = 'bold';
c.FontName = 'Times New Roman';
%c.Position= [0.1577 0.07 0.7196 0.0227];
set(gca,'Position',[0.0500 0.215 0.90 0.7336]);
set(gcf,'Position',[1000 765 807 573]);
text(-0.08,0.29,'Free-Obs','FontName','Times New Roman','FontSize',35,'FontWeight','Bold');
text(-0.415,0.29,'(c)','FontName','Times New Roman','FontSize',35,'FontWeight','Bold');
text(-0.03,0.25,'in 2014','FontName','Times New Roman','FontSize',20);
print(gcf,'/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-EPS-Figures/Figure2c.jpg','-djpeg','-r500'); 

% Assim
assimbothsepdisoutbiomass_avg_ens=squeeze(nanmean(assimbothsepdisoutbiomass,4));
diffbiomassspatialassimmobs=squeeze(nanmean(assimbothsepdisoutbiomass_avg_ens(:,:,37:48),3))-obstransbiomassinmodelarea(:,:,4);
figure();
lon=obs_lon-360;
lat=obs_lat;

[Plg,Plt]=meshgrid(lon,lat);
m_proj('Lambert Conformal Conic','lon',[lon(1),lon(size(lon,1))],'lat',[lat(1),lat(size(lat,1))]);  % Example for stereographic projection
m_pcolor(Plg,Plt,diffbiomassspatialassimmobs);
%colormap('spring');
shading flat;
m_grid('fontname','Times New Roman','fontsize',18);
m_coast('linewidth',2,'color','k');
c = centered_colorbar;
c.Label.String = 'Aboveground Biomass (gC m^-^2)';
c.Location = 'southoutside';
c.FontSize = 28;
c.FontWeight = 'bold';
c.FontName = 'Times New Roman';
%c.Position= [0.1577 0.07 0.7196 0.0227];
set(gca,'Position',[0.0500 0.215 0.90 0.7336]);
set(gcf,'Position',[1000 765 807 573]);
text(-0.09,0.29,'Assim-Obs','FontName','Times New Roman','FontSize',35,'FontWeight','Bold');
text(-0.415,0.29,'(d)','FontName','Times New Roman','FontSize',35,'FontWeight','Bold');
text(-0.03,0.25,'in 2014','FontName','Times New Roman','FontSize',20);
set(gca,'Clim',[-16796 16796])
print(gcf,'/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-EPS-Figures/Figure2d.jpg','-djpeg','-r500'); 


%% Histogram 
% LAI spatial bias
nbins=80;
[freecounts,freecenters]=hist(difflaispatialfreemobs(:),nbins);
[assimcounts,assimcenters]=hist(difflaispatialassimmobs(:),nbins);
totgrids=sum(freecounts);

figure()
hfree=histogram(difflaispatialfreemobs(:),nbins); hold on;
hassim=histogram(difflaispatialassimmobs(:),nbins);
hfree.FaceAlpha=0.2;
hassim.FaceAlpha=0.2;
hfree.FaceColor=[0.6500 0.3250 0.0980];
hassim.FaceColor=[0.2010 0.6450 0.9330];
plot(freecenters,freecounts,'Color','r','Linewidth',2); hold on
plot(assimcenters,assimcounts,'Color','b','Linewidth',2); hold on

set(gca,'Position',[0.100 0.13 0.88 0.8050])
set(gca,'FontSize',30);
xlabel('Bias (m^2 m^-^2)','FontSize',38,'FontWeight','Bold');
ylabel('Number of grids','FontSize',38,'FontWeight','Bold');
title('Leaf Area Index','FontSize',38,'FontWeight','Bold');
text(-4.8,1570,'(e)','FontName','Times New Roman','FontSize',45,'FontWeight','Bold');

h1=legend('Free-Obs','Assim-Obs');
set(h1,'Box','off');
set(h1,'FontSize',35);
set(gcf,'Position',[1918 -120 1215 755])
print(gcf,'/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Figures/SubFigureEPS/Figure2e.jpg','-djpeg','-r500'); 

% biomass spatial bias
nbins=80;
[freecounts,freecenters]=hist(diffbiomassspatialfreemobs(:),nbins);
[assimcounts,assimcenters]=hist(diffbiomassspatialassimmobs(:),nbins);
totgrids=sum(freecounts);

figure()
hfree=histogram(diffbiomassspatialfreemobs(:),nbins); hold on;
hassim=histogram(diffbiomassspatialassimmobs(:),nbins);
hfree.FaceAlpha=0.2;
hassim.FaceAlpha=0.2;
hfree.FaceColor=[0.6500 0.0250 0.0980];
hassim.FaceColor=[0.0110 0.0450 0.7330];
plot(freecenters,freecounts,'Color','r','Linewidth',2); hold on
plot(assimcenters,assimcounts,'Color','b','Linewidth',2); hold on

set(gca,'Position',[0.100 0.135 0.88 0.8050])
set(gca,'FontSize',30);
xlabel('Bias (gC m^-^2)','FontSize',38,'FontWeight','Bold');
ylabel('Number of grids','FontSize',38,'FontWeight','Bold');
title('Aboveground Biomass','FontSize',38,'FontWeight','Bold');
text(-5800,3120,'(f)','FontName','Times New Roman','FontSize',45,'FontWeight','Bold');


h1=legend('Free-Obs','Assim-Obs');
set(h1,'Box','off');
set(h1,'FontSize',35);
set(gcf,'Position',[1918 -120 1215 755])
print(gcf,'/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Figures/SubFigureEPS/Figure2f.jpg','-djpeg','-r500'); 

%% Statistics
% Free LAI overestimation percentage of grids
sum(~isnan(difflaispatialfreemobs),'all')%16074
sum(difflaispatialfreemobs>0,'all')%13311
sum(difflaispatialfreemobs<=0,'all')%2763
13311/16074%0.8281

sum(~isnan(diffbiomassspatialfreemobs),'all')%9603
sum(diffbiomassspatialfreemobs>0,'all')%9128
sum(diffbiomassspatialfreemobs<=0,'all')%475
9128/9603% 0.9505