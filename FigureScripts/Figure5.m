%% Clear 
clear all
%% Load geographic information
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/';
load([basedir,'geoinfo.mat']);

%% Model LAI
%% free
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/';
load([basedir,'biomassTLAIfreerun.mat']);
clear freebiomass

%% assimbothsepdisout
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/';
load([basedir,'biomassTLAIassimbothsepdisout.mat']);
clear assimbothsepdisoutbiomass

%% Read in Modis LAI observation
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/';
load([basedir,'obslaimonth.mat']);

%% Time series
num_year=9;
num_month=12;
num_time=num_year*num_month;

obs_lai_month_ts=zeros(num_time,1);
for itime=1:num_time
    X=obs_lai_month(:,:,itime).*landarea;
    filandarea=landarea;
    filandarea(isnan(X))=nan;
    obs_lai_month_ts(itime)=nanmean(X(:))./nanmean(filandarea(:));
end
    
%% TLAI
% Free run 
freeTLAI_month_ts=zeros(size(freeTLAI,3),size(freeTLAI,4));
assimbothsepdisoutTLAI_month_ts=zeros(size(assimbothsepdisoutTLAI,3),size(assimbothsepdisoutTLAI,4));
for itime=1:size(freeTLAI,3)
    for iens=1:size(freeTLAI,4)
        X=freeTLAI(:,:,itime,iens).*landarea;
        freeTLAI_month_ts(itime,iens)=nanmean(X(:))./nanmean(landarea(:));
        X=assimbothsepdisoutTLAI(:,:,itime,iens).*landarea;
        assimbothsepdisoutTLAI_month_ts(itime,iens)=nanmean(X(:))./nanmean(landarea(:));
    end
end

%% Figure
%%
figure()
plot(freeTLAI_month_ts(49:60,1),'LineWidth',4,'Color',[0.9 0.7 0.1]); hold on;
plot(assimbothsepdisoutTLAI_month_ts(49:60,1),'LineWidth',4,'Color',[0.05 0.15 0.90]); hold on;
plot(obs_lai_month_ts(49:60),'Color',[0.35 0.7 0.20],'LineWidth',4); hold on

grid on
xticks=1:1:12;
xticklabels={'Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';'Oct';'Nov';'Dec'};

set(gca,'XLim',[0 13],'XTick',xticks,'XTickLabel',xticklabels,'FontSize',30);
ylabel('LAI (m^2 m^-^2)','FontSize',30,'FontWeight','Bold');
title('Seasonal Cycle of LAI','FontSize',35,'FontWeight','Bold');

h1=legend('Free','Assim','MODIS');
set(h1,'Box','off');
set(h1,'FontSize',35);
set(gca,'Position',[0.09 0.07 0.9 0.87])
set(gcf,'Position',[1856 32 1123 790])

text(0.15,4.15,'(a)','FontName','Times New Roman','FontSize',35,'FontWeight','Bold');

%% Load GPP data
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/';
load([basedir,'GPPimprovement.mat']);  
% 
% quantum_yield_infreerunGPP            % implement new parameterization and start from free run initial condition in 2015
% forecastGPP  % default parameterization and start from assimilation run initial condition in 2015
% quantum_yieldgeneralGPP                       % implement new parameterization and start from assimilation run initial condition in 2015

%% Respiration component
% Free and Assimilation run 
freeGPP_month_ts=zeros(size(freeGPP,3),size(freeGPP,4));
assimbothsepdisoutGPP_month_ts=zeros(size(assimbothsepdisoutGPP,3),size(assimbothsepdisoutGPP,4));

for itime=1:size(freeGPP,3)
    for iens=1:size(freeGPP,4)
        X=freeGPP(:,:,itime,iens).*landarea;
        freeGPP_month_ts(itime,iens)=nanmean(X(:))./nanmean(landarea(:));
        
        X=assimbothsepdisoutGPP(:,:,itime,iens).*landarea;
        assimbothsepdisoutGPP_month_ts(itime,iens)=nanmean(X(:))./nanmean(landarea(:));
        
    end
end

% Quantum_yield VS Initialization
forecastGPP_month_ts=zeros(size(forecastGPP,3),size(forecastGPP,4));
quantum_yield_infreerunGPP_month_ts=zeros(size(quantum_yield_infreerunGPP,3),size(quantum_yield_infreerunGPP,4));
quantum_yieldgeneralGPP_month_ts=zeros(size(quantum_yieldgeneralGPP,3),size(quantum_yieldgeneralGPP,4));

for itime=1:size(forecastGPP,3)
    for iens=1:size(forecastGPP,4)
        X=forecastGPP(:,:,itime,iens).*landarea;
        forecastGPP_month_ts(itime,iens)=nanmean(X(:))./nanmean(landarea(:));
        
        X=quantum_yield_infreerunGPP(:,:,itime,iens).*landarea;
        quantum_yield_infreerunGPP_month_ts(itime,iens)=nanmean(X(:))./nanmean(landarea(:));
        
        X=quantum_yieldgeneralGPP(:,:,itime,iens).*landarea;
        quantum_yieldgeneralGPP_month_ts(itime,iens)=nanmean(X(:))./nanmean(landarea(:));
        
    end
end

% Annual Cycle 12 monthly average values
FLUXCOM_cycle_of_GPP_over_global=[-0.213008201360229 -0.187637523974969 ...
      -0.0995969278347433 0.235704943275281 1.30563024895731 ...
      3.05931319684455 3.48231191291744 2.22364143036913 ...
      0.812251884867183 -0.0155533557632937 -0.235844881682181 ...
      -0.234519905926864];

%% Figure
day_convert=3600*24;
figure()
plot(freeGPP_month_ts(49:60,1)*day_convert,'LineWidth',4,'Color',[0.9 0.7 0.1]); hold on;
plot(assimbothsepdisoutGPP_month_ts(49:60,1)*day_convert,'LineWidth',4,'Color',[0.05 0.15 0.90]); hold on;

plot(quantum_yield_infreerunGPP_month_ts*day_convert,'Color','c','LineWidth',4); hold on

plot(forecastGPP_month_ts*day_convert,'Color','r','LineWidth',4); hold on

plot(quantum_yieldgeneralGPP_month_ts*day_convert,'Color','m','LineWidth',4); hold on

plot(FLUXCOM_cycle_of_GPP_over_global,'Color',[0.35 0.7 0.20],'LineWidth',5); hold on


grid on
xticks=1:1:12;
xticklabels={'Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';'Oct';'Nov';'Dec'};

set(gca,'XLim',[0 12.2],'XTick',xticks,'XTickLabel',xticklabels,'FontSize',30);
ylabel('GPP (gC m^-^2 d^-^1)','FontSize',30,'FontWeight','Bold');
title('Seasonal Cycle of GPP','FontSize',35,'FontWeight','Bold');

h1=legend('Free','Assim','Parameterization','Initialization','Parameterization + Initialization','FLUXCOM');
set(h1,'Box','off');
set(h1,'FontSize',28);
set(h1,'Position',[0.12 0.65 0.3468 0.2323])
set(gca,'Position',[0.08 0.07 0.9 0.87])
set(gcf,'Position',[1856 32 1123 790])

text(0.15,8.3,'(b)','FontName','Times New Roman','FontSize',35,'FontWeight','Bold');
