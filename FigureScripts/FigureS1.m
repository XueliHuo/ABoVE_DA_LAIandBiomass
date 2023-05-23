clear all
%% Load NEON AOP and ground measured top canopy height
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/';
load([basedir,'AOPgroundCHTOP.mat']);
%% Figure S1 (a) HEALY
figure()
scatter(HEAL4m3groundCanopyHeight,HEAL4m3AOPCanopyHeight,100,'b','filled'); 
ylabel("Lidar Canopy Height (m)");
xlabel("Ground Measured Canopy Height (m)");
title("HEAL 2021",'FontSize',35);

hold on;
plot(1:1:14,1:1:14,'r--');
set(gca,'FontSize',30);
text(0.3,14.6,'(a)','FontSize',36,'Fontweight','bold');
set(gca,'Position',[0.085 0.135 0.89 0.80])
set(gcf,'Position',[244 239 1004 646])
set(gca,'Box','on');
grid on;

%% Figure S1 (b) DELTA JUNCTION
figure()
scatter(DEJU4m3groundCanopyHeight,DEJU4m3AOPCanopyHeight,100,'b','filled'); 
ylabel("Lidar Canopy Height (m)");
xlabel("Ground Measured Canopy Height (m)");
title("DEJU 2021",'FontSize',35);

hold on;
plot(2:1:13,2:1:13,'r--');
set(gca,'Xlim',[2 13], 'Ylim',[2 13],'FontSize',30);
text(2.2,13.5,'(b)','FontSize',36,'Fontweight','bold');
set(gca,'Position',[0.085 0.135 0.89 0.80])
set(gcf,'Position',[244 239 1004 646])
set(gca,'Box','on');
grid on;