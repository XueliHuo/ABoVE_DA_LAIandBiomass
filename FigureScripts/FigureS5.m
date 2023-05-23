clear all
%% Load Data
%% Aboveground Biomass component
%% free
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/';
load([basedir,'LEAFCLIVESTEMCDEADSTEMCfreerun.mat']);
%% assimbothsepdisout
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/';
load([basedir,'LEAFCLIVESTEMCDEADSTEMCassimbothsepdisout.mat']);

%% Root component
%% free
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/';
load([basedir,'FROOTCLIVECROOTCDEADCROOTCfreerun.mat']);
%% assimbothsepdisout
%% Root component
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/';
load([basedir,'FROOTCLIVECROOTCDEADCROOTCassimbothsepdisout.mat']);

%% Geographic Information
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/';
load([basedir,'geoinfo.mat']);

%% Load Wang Biomass observation
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/';
load([basedir,'obstransbiomassinmodelarea.mat']);

%% Monthly time series of biomass component
% Free run 
freeLEAFC_month_ts=zeros(size(freeLEAFC,3),size(freeLEAFC,4));
freeLIVESTEMC_month_ts=zeros(size(freeLIVESTEMC,3),size(freeLIVESTEMC,4));
freeDEADSTEMC_month_ts=zeros(size(freeDEADSTEMC,3),size(freeDEADSTEMC,4));

for itime=1:size(freeLEAFC,3)
    for iens=1:size(freeLEAFC,4)
        X=freeLEAFC(:,:,itime,iens).*landarea;
        freeLEAFC_month_ts(itime,iens)=nanmean(X(:))./nanmean(landarea(:));
        
        X=freeLIVESTEMC(:,:,itime,iens).*landarea;
        freeLIVESTEMC_month_ts(itime,iens)=nanmean(X(:))./nanmean(landarea(:));
        
        X=freeDEADSTEMC(:,:,itime,iens).*landarea;
        freeDEADSTEMC_month_ts(itime,iens)=nanmean(X(:))./nanmean(landarea(:));
    end
end

% Assim
assimbothsepdisoutLEAFC_month_ts=zeros(size(assimbothsepdisoutLEAFC,3),size(assimbothsepdisoutLEAFC,4));
assimbothsepdisoutLIVESTEMC_month_ts=zeros(size(assimbothsepdisoutLIVESTEMC,3),size(assimbothsepdisoutLIVESTEMC,4));
assimbothsepdisoutDEADSTEMC_month_ts=zeros(size(assimbothsepdisoutDEADSTEMC,3),size(assimbothsepdisoutDEADSTEMC,4));

for itime=1:size(assimbothsepdisoutLEAFC,3)
    for iens=1:size(assimbothsepdisoutLEAFC,4)
        X=assimbothsepdisoutLEAFC(:,:,itime,iens).*landarea;
        assimbothsepdisoutLEAFC_month_ts(itime,iens)=nanmean(X(:))./nanmean(landarea(:));
        
        X=assimbothsepdisoutLIVESTEMC(:,:,itime,iens).*landarea;
        assimbothsepdisoutLIVESTEMC_month_ts(itime,iens)=nanmean(X(:))./nanmean(landarea(:));
        
        X=assimbothsepdisoutDEADSTEMC(:,:,itime,iens).*landarea;
        assimbothsepdisoutDEADSTEMC_month_ts(itime,iens)=nanmean(X(:))./nanmean(landarea(:));
    end
end

%% Monthly time series of Root component
% Free run 
freeFROOTC_month_ts=zeros(size(freeFROOTC,3),size(freeFROOTC,4));
freeLIVECROOTC_month_ts=zeros(size(freeLIVECROOTC,3),size(freeLIVECROOTC,4));
freeDEADCROOTC_month_ts=zeros(size(freeDEADCROOTC,3),size(freeDEADCROOTC,4));

for itime=1:size(freeFROOTC,3)
    for iens=1:size(freeFROOTC,4)
        X=freeFROOTC(:,:,itime,iens).*landarea;
        freeFROOTC_month_ts(itime,iens)=nanmean(X(:))./nanmean(landarea(:));
        
        X=freeLIVECROOTC(:,:,itime,iens).*landarea;
        freeLIVECROOTC_month_ts(itime,iens)=nanmean(X(:))./nanmean(landarea(:));
        
        X=freeDEADCROOTC(:,:,itime,iens).*landarea;
        freeDEADCROOTC_month_ts(itime,iens)=nanmean(X(:))./nanmean(landarea(:));
    end
end

% Assim
assimbothsepdisoutFROOTC_month_ts=zeros(size(assimbothsepdisoutFROOTC,3),size(assimbothsepdisoutFROOTC,4));
assimbothsepdisoutLIVECROOTC_month_ts=zeros(size(assimbothsepdisoutLIVECROOTC,3),size(assimbothsepdisoutLIVECROOTC,4));
assimbothsepdisoutDEADCROOTC_month_ts=zeros(size(assimbothsepdisoutDEADCROOTC,3),size(assimbothsepdisoutDEADCROOTC,4));

for itime=1:size(assimbothsepdisoutFROOTC,3)
    for iens=1:size(assimbothsepdisoutFROOTC,4)
        X=assimbothsepdisoutFROOTC(:,:,itime,iens).*landarea;
        assimbothsepdisoutFROOTC_month_ts(itime,iens)=nanmean(X(:))./nanmean(landarea(:));
        
        X=assimbothsepdisoutLIVECROOTC(:,:,itime,iens).*landarea;
        assimbothsepdisoutLIVECROOTC_month_ts(itime,iens)=nanmean(X(:))./nanmean(landarea(:));
        
        X=assimbothsepdisoutDEADCROOTC(:,:,itime,iens).*landarea;
        assimbothsepdisoutDEADCROOTC_month_ts(itime,iens)=nanmean(X(:))./nanmean(landarea(:));
    end
end

%% Annual ABoVEgroundC
num_year=9;
num_ens=40;

% free
freeLEAFC_annual_ts=zeros(num_year,num_ens);
freeLIVESTEMC_annual_ts=zeros(num_year,num_ens);
freeDEADSTEMC_annual_ts=zeros(num_year,num_ens);
for iy=1:num_year
    ims=1+(iy-1)*12;
    ime=iy*12;
    freeLEAFC_annual_ts(iy,:)=mean(freeLEAFC_month_ts(ims:ime,:),1);
    freeLIVESTEMC_annual_ts(iy,:)=mean(freeLIVESTEMC_month_ts(ims:ime,:),1);
    freeDEADSTEMC_annual_ts(iy,:)=mean(freeDEADSTEMC_month_ts(ims:ime,:),1);
end

% assim
assimbothsepdisoutLEAFC_annual_ts=zeros(num_year,num_ens);
assimbothsepdisoutLIVESTEMC_annual_ts=zeros(num_year,num_ens);
assimbothsepdisoutDEADSTEMC_annual_ts=zeros(num_year,num_ens);
for iy=1:num_year
    ims=1+(iy-1)*12;
    ime=iy*12;
    assimbothsepdisoutLEAFC_annual_ts(iy,:)=mean(assimbothsepdisoutLEAFC_month_ts(ims:ime,:),1);
    assimbothsepdisoutLIVESTEMC_annual_ts(iy,:)=mean(assimbothsepdisoutLIVESTEMC_month_ts(ims:ime,:),1);
    assimbothsepdisoutDEADSTEMC_annual_ts(iy,:)=mean(assimbothsepdisoutDEADSTEMC_month_ts(ims:ime,:),1);
end

%% Annual ROOTC
num_year=9;
num_ens=40;

% free
freeFROOTC_annual_ts=zeros(num_year,num_ens);
freeLIVECROOTC_annual_ts=zeros(num_year,num_ens);
freeDEADCROOTC_annual_ts=zeros(num_year,num_ens);
for iy=1:num_year
    ims=1+(iy-1)*12;
    ime=iy*12;
    freeFROOTC_annual_ts(iy,:)=mean(freeFROOTC_month_ts(ims:ime,:),1);
    freeLIVECROOTC_annual_ts(iy,:)=mean(freeLIVECROOTC_month_ts(ims:ime,:),1);
    freeDEADCROOTC_annual_ts(iy,:)=mean(freeDEADCROOTC_month_ts(ims:ime,:),1);
end


% assim
assimbothsepdisoutFROOTC_annual_ts=zeros(num_year,num_ens);
assimbothsepdisoutLIVECROOTC_annual_ts=zeros(num_year,num_ens);
assimbothsepdisoutDEADCROOTC_annual_ts=zeros(num_year,num_ens);
for iy=1:num_year
    ims=1+(iy-1)*12;
    ime=iy*12;
    assimbothsepdisoutFROOTC_annual_ts(iy,:)=mean(assimbothsepdisoutFROOTC_month_ts(ims:ime,:),1);
    assimbothsepdisoutLIVECROOTC_annual_ts(iy,:)=mean(assimbothsepdisoutLIVECROOTC_month_ts(ims:ime,:),1);
    assimbothsepdisoutDEADCROOTC_annual_ts(iy,:)=mean(assimbothsepdisoutDEADCROOTC_month_ts(ims:ime,:),1);
end

%% In obs domain
filandarea=landarea;
filandarea(isnan(obstransbiomassinmodelarea(:,:,1)))=nan;

%% Monthly time series of biomass component in Wang's region
% Free run 
freeLEAFC_inobsarea_month_ts=zeros(size(freeLEAFC,3),size(freeLEAFC,4));
freeLIVESTEMC_inobsarea_month_ts=zeros(size(freeLIVESTEMC,3),size(freeLIVESTEMC,4));
freeDEADSTEMC_inobsarea_month_ts=zeros(size(freeDEADSTEMC,3),size(freeDEADSTEMC,4));

for itime=1:size(freeLEAFC,3)
    for iens=1:size(freeLEAFC,4)
        X=freeLEAFC(:,:,itime,iens).*filandarea;
        freeLEAFC_inobsarea_month_ts(itime,iens)=nanmean(X(:))./nanmean(filandarea(:));
        
        X=freeLIVESTEMC(:,:,itime,iens).*filandarea;
        freeLIVESTEMC_inobsarea_month_ts(itime,iens)=nanmean(X(:))./nanmean(filandarea(:));
        
        X=freeDEADSTEMC(:,:,itime,iens).*filandarea;
        freeDEADSTEMC_inobsarea_month_ts(itime,iens)=nanmean(X(:))./nanmean(filandarea(:));
    end
end

% Assim
assimbothsepdisoutLEAFC_inobsarea_month_ts=zeros(size(assimbothsepdisoutLEAFC,3),size(assimbothsepdisoutLEAFC,4));
assimbothsepdisoutLIVESTEMC_inobsarea_month_ts=zeros(size(assimbothsepdisoutLIVESTEMC,3),size(assimbothsepdisoutLIVESTEMC,4));
assimbothsepdisoutDEADSTEMC_inobsarea_month_ts=zeros(size(assimbothsepdisoutDEADSTEMC,3),size(assimbothsepdisoutDEADSTEMC,4));

for itime=1:size(assimbothsepdisoutLEAFC,3)
    for iens=1:size(assimbothsepdisoutLEAFC,4)
        X=assimbothsepdisoutLEAFC(:,:,itime,iens).*filandarea;
        assimbothsepdisoutLEAFC_inobsarea_month_ts(itime,iens)=nanmean(X(:))./nanmean(filandarea(:));
        
        X=assimbothsepdisoutLIVESTEMC(:,:,itime,iens).*filandarea;
        assimbothsepdisoutLIVESTEMC_inobsarea_month_ts(itime,iens)=nanmean(X(:))./nanmean(filandarea(:));
        
        X=assimbothsepdisoutDEADSTEMC(:,:,itime,iens).*filandarea;
        assimbothsepdisoutDEADSTEMC_inobsarea_month_ts(itime,iens)=nanmean(X(:))./nanmean(filandarea(:));
    end
end

%% Monthly time series bellow ground (i.e., root) carbon component in Wang region
% Free run
freeFROOTC_inobsarea_month_ts=zeros(size(freeFROOTC,3),size(freeFROOTC,4));
freeLIVECROOTC_inobsarea_month_ts=zeros(size(freeLIVECROOTC,3),size(freeLIVECROOTC,4));
freeDEADCROOTC_inobsarea_month_ts=zeros(size(freeDEADCROOTC,3),size(freeDEADCROOTC,4));

for itime=1:size(freeFROOTC,3)
    for iens=1:size(freeFROOTC,4)
        X=freeFROOTC(:,:,itime,iens).*filandarea;
        freeFROOTC_inobsarea_month_ts(itime,iens)=nanmean(X(:))./nanmean(filandarea(:));
        
        X=freeLIVECROOTC(:,:,itime,iens).*filandarea;
        freeLIVECROOTC_inobsarea_month_ts(itime,iens)=nanmean(X(:))./nanmean(filandarea(:));
        
        X=freeDEADCROOTC(:,:,itime,iens).*filandarea;
        freeDEADCROOTC_inobsarea_month_ts(itime,iens)=nanmean(X(:))./nanmean(filandarea(:));
    end
end

% Assim
assimbothsepdisoutFROOTC_inobsarea_month_ts=zeros(size(assimbothsepdisoutFROOTC,3),size(assimbothsepdisoutFROOTC,4));
assimbothsepdisoutLIVECROOTC_inobsarea_month_ts=zeros(size(assimbothsepdisoutLIVECROOTC,3),size(assimbothsepdisoutLIVECROOTC,4));
assimbothsepdisoutDEADCROOTC_inobsarea_month_ts=zeros(size(assimbothsepdisoutDEADCROOTC,3),size(assimbothsepdisoutDEADCROOTC,4));

for itime=1:size(assimbothsepdisoutFROOTC,3)
    for iens=1:size(assimbothsepdisoutFROOTC,4)
        X=assimbothsepdisoutFROOTC(:,:,itime,iens).*filandarea;
        assimbothsepdisoutFROOTC_inobsarea_month_ts(itime,iens)=nanmean(X(:))./nanmean(filandarea(:));
        
        X=assimbothsepdisoutLIVECROOTC(:,:,itime,iens).*filandarea;
        assimbothsepdisoutLIVECROOTC_inobsarea_month_ts(itime,iens)=nanmean(X(:))./nanmean(filandarea(:));
        
        X=assimbothsepdisoutDEADCROOTC(:,:,itime,iens).*filandarea;
        assimbothsepdisoutDEADCROOTC_inobsarea_month_ts(itime,iens)=nanmean(X(:))./nanmean(filandarea(:));
    end
end

%% Annual ABoVEgroundC in Wang Region
num_year=9;
num_ens=40;

% free
freeLEAFC_inobsarea_annual_ts=zeros(num_year,num_ens);
freeLIVESTEMC_inobsarea_annual_ts=zeros(num_year,num_ens);
freeDEADSTEMC_inobsarea_annual_ts=zeros(num_year,num_ens);
for iy=1:num_year
    ims=1+(iy-1)*12;
    ime=iy*12;
    freeLEAFC_inobsarea_annual_ts(iy,:)=mean(freeLEAFC_inobsarea_month_ts(ims:ime,:),1);
    freeLIVESTEMC_inobsarea_annual_ts(iy,:)=mean(freeLIVESTEMC_inobsarea_month_ts(ims:ime,:),1);
    freeDEADSTEMC_inobsarea_annual_ts(iy,:)=mean(freeDEADSTEMC_inobsarea_month_ts(ims:ime,:),1);
end

% assim
assimbothsepdisoutLEAFC_inobsarea_annual_ts=zeros(num_year,num_ens);
assimbothsepdisoutLIVESTEMC_inobsarea_annual_ts=zeros(num_year,num_ens);
assimbothsepdisoutDEADSTEMC_inobsarea_annual_ts=zeros(num_year,num_ens);
for iy=1:num_year
    ims=1+(iy-1)*12;
    ime=iy*12;
    assimbothsepdisoutLEAFC_inobsarea_annual_ts(iy,:)=mean(assimbothsepdisoutLEAFC_inobsarea_month_ts(ims:ime,:),1);
    assimbothsepdisoutLIVESTEMC_inobsarea_annual_ts(iy,:)=mean(assimbothsepdisoutLIVESTEMC_inobsarea_month_ts(ims:ime,:),1);
    assimbothsepdisoutDEADSTEMC_inobsarea_annual_ts(iy,:)=mean(assimbothsepdisoutDEADSTEMC_inobsarea_month_ts(ims:ime,:),1);
end

%% Annual ROOTC in Wang region
num_year=9;
num_ens=40;

% free
freeFROOTC_inobsarea_annual_ts=zeros(num_year,num_ens);
freeLIVECROOTC_inobsarea_annual_ts=zeros(num_year,num_ens);
freeDEADCROOTC_inobsarea_annual_ts=zeros(num_year,num_ens);
for iy=1:num_year
    ims=1+(iy-1)*12;
    ime=iy*12;
    freeFROOTC_inobsarea_annual_ts(iy,:)=mean(freeFROOTC_inobsarea_month_ts(ims:ime,:),1);
    freeLIVECROOTC_inobsarea_annual_ts(iy,:)=mean(freeLIVECROOTC_inobsarea_month_ts(ims:ime,:),1);
    freeDEADCROOTC_inobsarea_annual_ts(iy,:)=mean(freeDEADCROOTC_inobsarea_month_ts(ims:ime,:),1);
end

% assim
assimbothsepdisoutFROOTC_inobsarea_annual_ts=zeros(num_year,num_ens);
assimbothsepdisoutLIVECROOTC_inobsarea_annual_ts=zeros(num_year,num_ens);
assimbothsepdisoutDEADCROOTC_inobsarea_annual_ts=zeros(num_year,num_ens);
for iy=1:num_year
    ims=1+(iy-1)*12;
    ime=iy*12;
    assimbothsepdisoutFROOTC_inobsarea_annual_ts(iy,:)=mean(assimbothsepdisoutFROOTC_inobsarea_month_ts(ims:ime,:),1);
    assimbothsepdisoutLIVECROOTC_inobsarea_annual_ts(iy,:)=mean(assimbothsepdisoutLIVECROOTC_inobsarea_month_ts(ims:ime,:),1);
    assimbothsepdisoutDEADCROOTC_inobsarea_annual_ts(iy,:)=mean(assimbothsepdisoutDEADCROOTC_inobsarea_month_ts(ims:ime,:),1);
end

%% Figure
%% LEAFC
figure()
plot(freeLEAFC_annual_ts(:,1),'LineStyle','-','LineWidth',2,'Color',[0.9 0.7 0.1]); hold on;
plot(assimbothsepdisoutLEAFC_annual_ts(:,1),'LineStyle','-','Color',[0.8 0.15 0.10],'LineWidth',2); hold on;
plot(freeLEAFC_inobsarea_annual_ts(:,1),'LineStyle','--','LineWidth',2,'Color',[0.9 0.7 0.1]); hold on;
plot(assimbothsepdisoutLEAFC_inobsarea_annual_ts(:,1),'LineStyle','--','Color',[0.8 0.15 0.10],'LineWidth',2); hold on;

plot(freeLEAFC_annual_ts,'LineStyle','-','LineWidth',2,'Color',[0.9 0.7 0.1]); hold on;
plot(assimbothsepdisoutLEAFC_annual_ts,'LineStyle','-','Color',[0.8 0.15 0.10],'LineWidth',2); hold on;
plot(freeLEAFC_inobsarea_annual_ts,'LineStyle','--','LineWidth',2,'Color',[0.9 0.7 0.1]); hold on;
plot(assimbothsepdisoutLEAFC_inobsarea_annual_ts,'LineStyle','--','Color',[0.8 0.15 0.10],'LineWidth',2); hold on;
set(gca,'Position',[0.105 0.110 0.88 0.8250])

ttime=9;
xticks=1:9;
xticklabels={'2011';'2012';'2013';'2014';'2015';'2016';'2017';'2018';'2019'};

set(gca,'XLim',[0.5 ttime+0.5],'YLim',[0 200],'XTick',xticks,'XTickLabel',xticklabels,'FontSize',30);
ylabel('gC/m^2','FontSize',30,'FontWeight','Bold');
xlabel('Year','FontSize',30,'FontWeight','Bold');
title('Annual Leaf Carbon','FontSize',35,'FontWeight','Bold');
text(0.6,210,'(a)','FontSize',35,'FontWeight','Bold');

h1=legend('ABoVE Free','ABoVE Assim','ABoVE(core) Free','ABoVE(core) Assim');
set(h1,'Position',[0.7042 0.508 0.2088 0.0802]);
set(h1,'Box','off');
set(gcf,'Position',[2008 47 992 719])
grid on

%% LIVESTEMC
figure()
plot(freeLIVESTEMC_annual_ts(:,1),'LineWidth',2,'Color',[0.2 0.45 0.60 0.25]); hold on;
plot(assimbothsepdisoutLIVESTEMC_annual_ts(:,1),'Color',[0.1 0.2 0.9],'LineWidth',2); hold on;
plot(freeLIVESTEMC_inobsarea_annual_ts(:,1),'LineStyle','--','LineWidth',2,'Color',[0.2 0.45 0.60 0.25]); hold on;
plot(assimbothsepdisoutLIVESTEMC_inobsarea_annual_ts(:,1),'Color',[0.1 0.2 0.9],'LineStyle','--','LineWidth',2); hold on;

plot(freeLIVESTEMC_annual_ts,'LineWidth',2,'Color',[0.2 0.45 0.60 0.25]); hold on;
plot(assimbothsepdisoutLIVESTEMC_annual_ts,'Color',[0.1 0.2 0.9],'LineWidth',2); hold on;
plot(freeLIVESTEMC_inobsarea_annual_ts,'LineStyle','--','LineWidth',2,'Color',[0.2 0.45 0.60 0.25]); hold on;
plot(assimbothsepdisoutLIVESTEMC_inobsarea_annual_ts,'Color',[0.1 0.2 0.9],'LineStyle','--','LineWidth',2); hold on;
set(gca,'Position',[0.09 0.110 0.89 0.8250])

ttime=9;
xticks=1:9;
xticklabels={'2011';'2012';'2013';'2014';'2015';'2016';'2017';'2018';'2019'};

set(gca,'XLim',[0.5 ttime+0.5],'YLim',[0 18],'XTick',xticks,'XTickLabel',xticklabels,'FontSize',30);
ylabel('gC/m^2','FontSize',30,'FontWeight','Bold');
xlabel('Year','FontSize',30,'FontWeight','Bold');
title('Annual Livestem Carbon','FontSize',35,'FontWeight','Bold');
text(0.6,18.8,'(b)','FontSize',35,'FontWeight','Bold');

h1=legend('ABoVE Free','ABoVE Assim','ABoVE(core) Free','ABoVE(core) Assim');
set(h1,'Position',[0.7042 0.538 0.2088 0.0802]);
set(h1,'Box','off');
set(gcf,'Position',[2008 47 992 719])
grid on

%% DEADSTEMC
figure()
plot(freeDEADSTEMC_annual_ts(:,1),'LineWidth',2,'Color',[0.15 0.85 0.10 0.25]); hold on;
plot(assimbothsepdisoutDEADSTEMC_annual_ts(:,1),'Color',[0.4 0.7 0.1],'LineWidth',2); hold on;
plot(freeDEADSTEMC_inobsarea_annual_ts(:,1),'LineStyle','--','LineWidth',2,'Color',[0.15 0.85 0.10 0.25]); hold on;
plot(assimbothsepdisoutDEADSTEMC_inobsarea_annual_ts(:,1),'Color',[0.4 0.7 0.1],'LineStyle','--','LineWidth',2); hold on;

plot(freeDEADSTEMC_annual_ts,'LineWidth',2,'Color',[0.15 0.85 0.10 0.25]); hold on;
plot(assimbothsepdisoutDEADSTEMC_annual_ts,'Color',[0.4 0.7 0.1],'LineWidth',2); hold on;
plot(freeDEADSTEMC_inobsarea_annual_ts,'LineStyle','--','LineWidth',2,'Color',[0.15 0.85 0.10 0.25]); hold on;
plot(assimbothsepdisoutDEADSTEMC_inobsarea_annual_ts,'Color',[0.4 0.7 0.1],'LineStyle','--','LineWidth',2); hold on;
set(gca,'Position',[0.135 0.12 0.855 0.8150])

ttime=9;
xticks=1:9;
xticklabels={'2011';'2012';'2013';'2014';'2015';'2016';'2017';'2018';'2019'};

set(gca,'XLim',[0.5 ttime+0.5],'YLim',[0 6000],'XTick',xticks,'XTickLabel',xticklabels,'FontSize',35);
ylabel('gC/m^2','FontSize',30,'FontWeight','Bold');
xlabel('Year','FontSize',30,'FontWeight','Bold');
title('Annual Deadstem Carbon','FontSize',35,'FontWeight','Bold');
text(0.6,6300,'(c)','FontSize',35,'FontWeight','Bold');

h1=legend('ABoVE Free','ABoVE Assim','ABoVE(core) Free','ABoVE(core) Assim');
set(h1,'Position',[0.7042 0.528 0.2088 0.0802]);
set(h1,'Box','off');
set(gcf,'Position',[2008 47 992 719])
grid on

%% FROOTC
figure()
plot(freeFROOTC_annual_ts(:,1),'LineStyle','-','LineWidth',2,'Color',[0.9 0.7 0.1]); hold on;
plot(assimbothsepdisoutFROOTC_annual_ts(:,1),'LineStyle','-','Color',[0.8 0.15 0.10],'LineWidth',2); hold on;
plot(freeFROOTC_inobsarea_annual_ts(:,1),'LineStyle','--','LineWidth',2,'Color',[0.9 0.7 0.1]); hold on;
plot(assimbothsepdisoutFROOTC_inobsarea_annual_ts(:,1),'LineStyle','--','Color',[0.8 0.15 0.10],'LineWidth',2); hold on;

plot(freeFROOTC_annual_ts,'LineStyle','-','LineWidth',2,'Color',[0.9 0.7 0.1]); hold on;
plot(assimbothsepdisoutFROOTC_annual_ts,'LineStyle','-','Color',[0.8 0.15 0.10],'LineWidth',2); hold on;
plot(freeFROOTC_inobsarea_annual_ts,'LineStyle','--','LineWidth',2,'Color',[0.9 0.7 0.1]); hold on;
plot(assimbothsepdisoutFROOTC_inobsarea_annual_ts,'LineStyle','--','Color',[0.8 0.15 0.10],'LineWidth',2); hold on;
set(gca,'Position',[0.105 0.110 0.88 0.8250])

ttime=9;
xticks=1:9;
xticklabels={'2011';'2012';'2013';'2014';'2015';'2016';'2017';'2018';'2019'};

set(gca,'XLim',[0.5 ttime+0.5],'YLim',[0 300],'XTick',xticks,'XTickLabel',xticklabels,'FontSize',30);
ylabel('gC/m^2','FontSize',30,'FontWeight','Bold');
xlabel('Year','FontSize',30,'FontWeight','Bold');
title('Annual Fine Root Carbon','FontSize',35,'FontWeight','Bold');
text(0.6,313,'(d)','FontSize',35,'FontWeight','Bold');

h1=legend('ABoVE Free','ABoVE Assim','ABoVE(core) Free','ABoVE(core) Assim');
set(h1,'Position',[0.7042 0.508 0.2088 0.0802]);
set(h1,'Box','off');
set(gcf,'Position',[2008 47 992 719])
grid on


%% LIVECROOTC
figure()
plot(freeLIVECROOTC_annual_ts(:,1),'LineWidth',2,'Color',[0.2 0.45 0.60 0.25]); hold on;
plot(assimbothsepdisoutLIVECROOTC_annual_ts(:,1),'Color',[0.1 0.2 0.9],'LineWidth',2); hold on;
plot(freeLIVECROOTC_inobsarea_annual_ts(:,1),'LineStyle','--','LineWidth',2,'Color',[0.2 0.45 0.60 0.25]); hold on;
plot(assimbothsepdisoutLIVECROOTC_inobsarea_annual_ts(:,1),'Color',[0.1 0.2 0.9],'LineStyle','--','LineWidth',2); hold on;

plot(freeLIVECROOTC_annual_ts,'LineWidth',2,'Color',[0.2 0.45 0.60 0.25]); hold on;
plot(assimbothsepdisoutLIVECROOTC_annual_ts,'Color',[0.1 0.2 0.9],'LineWidth',2); hold on;
plot(freeLIVECROOTC_inobsarea_annual_ts,'LineStyle','--','LineWidth',2,'Color',[0.2 0.45 0.60 0.25]); hold on;
plot(assimbothsepdisoutLIVECROOTC_inobsarea_annual_ts,'Color',[0.1 0.2 0.9],'LineStyle','--','LineWidth',2); hold on;
set(gca,'Position',[0.075 0.110 0.905 0.8250])

ttime=9;
xticks=1:1:9;
xticklabels={'2011';'2012';'2013';'2014';'2015';'2016';'2017';'2018';'2019'};

set(gca,'XLim',[0.5 ttime+0.5],'YLim',[0 5.5],'XTick',xticks,'XTickLabel',xticklabels,'FontSize',30);
ylabel('gC/m^2','FontSize',30,'FontWeight','Bold');
xlabel('Year','FontSize',30,'FontWeight','Bold');
title('Annual Live Coarse Root Carbon','FontSize',35,'FontWeight','Bold');
text(0.6,5.73,'(e)','FontSize',35,'FontWeight','Bold');

h1=legend('ABoVE Free','ABoVE Assim','ABoVE(core) Free','ABoVE(core) Assim');
set(h1,'Position',[0.7042 0.51 0.2088 0.0802]);
set(h1,'Box','off');
set(gcf,'Position',[2008 47 992 719])
grid on

%% DEADCROOTC
figure()
plot(freeDEADCROOTC_annual_ts(:,1),'LineWidth',2,'Color',[0.15 0.85 0.10 0.25]); hold on;
plot(assimbothsepdisoutDEADCROOTC_annual_ts(:,1),'Color',[0.4 0.7 0.1],'LineWidth',2); hold on;
plot(freeDEADCROOTC_inobsarea_annual_ts(:,1),'LineStyle','--','LineWidth',2,'Color',[0.15 0.85 0.10 0.25]); hold on;
plot(assimbothsepdisoutDEADCROOTC_inobsarea_annual_ts(:,1),'Color',[0.4 0.7 0.1],'LineStyle','--','LineWidth',2); hold on;

plot(freeDEADCROOTC_annual_ts,'LineWidth',2,'Color',[0.15 0.85 0.10 0.25]); hold on;
plot(assimbothsepdisoutDEADCROOTC_annual_ts,'Color',[0.4 0.7 0.1],'LineWidth',2); hold on;
plot(freeDEADCROOTC_inobsarea_annual_ts,'LineStyle','--','LineWidth',2,'Color',[0.15 0.85 0.10 0.25]); hold on;
plot(assimbothsepdisoutDEADCROOTC_inobsarea_annual_ts,'Color',[0.4 0.7 0.1],'LineStyle','--','LineWidth',2); hold on;
set(gca,'Position',[0.125 0.12 0.855 0.8150])

ttime=9;
xticks=1:1:9;
xticklabels={'2011';'2012';'2013';'2014';'2015';'2016';'2017';'2018';'2019'};

set(gca,'XLim',[0.5 ttime+0.5],'YLim',[0 1850],'XTick',xticks,'XTickLabel',xticklabels,'FontSize',30);
ylabel('gC/m^2','FontSize',30,'FontWeight','Bold');
xlabel('Year','FontSize',30,'FontWeight','Bold');
title('Annual Dead Coarse Root Carbon','FontSize',35,'FontWeight','Bold');
text(0.6,1930,'(f)','FontSize',35,'FontWeight','Bold');

h1=legend('ABoVE Free','ABoVE Assim','ABoVE(core) Free','ABoVE(core) Assim');
set(h1,'Position',[0.7042 0.54 0.2088 0.0802]);
set(h1,'Box','off');
set(gcf,'Position',[2008 47 992 719])
grid on