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
%% LAI
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

%% Figures
figure()
plot(freeTLAI_month_ts(:,1),'-o','LineWidth',2,'Color',[0.9 0.7 0.1]); hold on;
plot(assimbothsepdisoutTLAI_month_ts(:,1),'-o','LineWidth',2,'Color',[0.05 0.15 0.90]); hold on;
plot(obs_lai_month_ts,'-o','Color',[0.35 0.7 0.20],'LineWidth',2); hold on

plot(freeTLAI_month_ts,'-o','LineWidth',2,'Color',[0.9 0.7 0.1]); hold on;
plot(assimbothsepdisoutTLAI_month_ts,'-o','Color',[0.05 0.15 0.90],'LineWidth',2); hold on;
set(gca,'Position',[0.0800 0.120 0.9 0.8250])

ttime=108;
xticks=1:12:108;
xticklabels={'2011';'2012';'2013';'2014';'2015';'2016';'2017';'2018';'2019'};

set(gca,'XLim',[0 ttime+1],'YLim',[0 4.8],'XTick',xticks,'XTickLabel',xticklabels,'FontSize',35);
ylabel('(m^2 m^-^2)','FontSize',35,'FontWeight','Bold');
xlabel('Year','FontSize',35,'FontWeight','Bold');
title('Leaf Area Index','FontSize',35,'FontWeight','Bold');
text(1,4.95,'(a)','FontName','Times New Roman','FontSize',40,'FontWeight','Bold');

h1=legend('Free','Assim','Obs');
set(h1,'Box','off');
set(h1,'FontSize',35);
set(gcf,'Position',[1788 36 1385 819])

%% Biomass
%% Time series
obs_biomass_annual_ts=zeros(size(obstransbiomassinmodelarea,3),1);
for itime=1:size(obstransbiomassinmodelarea,3)
    X=obstransbiomassinmodelarea(:,:,itime).*landarea;
    obs_biomass_annual_ts(itime)=nanmean(X(:))./nanmean(landarea(:));
end
%% In obs domain
filandarea=landarea;
filandarea(isnan(obstransbiomassinmodelarea(:,:,1)))=nan;

freebiomassinobs_month_ts=zeros(size(freebiomass,3),size(freebiomass,4));
assimbothsepdisoutbiomassinobs_month_ts=size(freebiomassinobs_month_ts);
for itime=1:size(freebiomass,3)
    for iens=1:size(freebiomass,4)
        temp=freebiomass(:,:,itime,iens);
        temp(isnan(obstransbiomassinmodelarea(:,:,1)))=nan;
        X=temp.*filandarea;
        freebiomassinobs_month_ts(itime,iens)=nanmean(X(:))./nanmean(filandarea(:));
        
        temp=assimbothsepdisoutbiomass(:,:,itime,iens);
        temp(isnan(obstransbiomassinmodelarea(:,:,1)))=nan;
        X=temp.*filandarea;
        assimbothsepdisoutbiomassinobs_month_ts(itime,iens)=nanmean(X(:))./nanmean(filandarea(:));
    end
end

%% Figures
figure()
plot(freebiomassinobs_month_ts(:,1),'-o','LineWidth',2,'Color',[0.9 0.7 0.1]); hold on;
plot(assimbothsepdisoutbiomassinobs_month_ts(:,1),'-o','LineWidth',2,'Color',[0.05 0.15 0.90]); hold on;
plot(9:12:size(obs_biomass_annual_ts,1)*12,obs_biomass_annual_ts,'-d','Color',[0.35 0.7 0.20],'LineWidth',2); hold on

plot(freebiomassinobs_month_ts,'-o','LineWidth',2,'Color',[0.9 0.7 0.1]); hold on;
plot(assimbothsepdisoutbiomassinobs_month_ts,'-o','LineWidth',2,'Color',[0.05 0.15 0.90]); hold on;
set(gca,'Position',[0.100 0.110 0.88 0.8350])

ttime=108;
xticks=1:12:108;
xticklabels={'2011';'2012';'2013';'2014';'2015';'2016';'2017';'2018';'2019'};

set(gca,'XLim',[0 ttime+1],'YLim',[0 6400],'XTick',xticks,'XTickLabel',xticklabels,'FontSize',35);
ylabel('(gC m^-^2)','FontSize',35,'FontWeight','Bold');
xlabel('Year','FontSize',35,'FontWeight','Bold');
title('Aboveground Biomass','FontSize',35,'FontWeight','Bold');
text(1,6600,'(b)','FontName','Times New Roman','FontSize',40,'FontWeight','Bold');

h1=legend('Free','Assim','Obs');
set(h1,'Box','off');
set(h1,'FontSize',35);
set(h1,'Position',[0.8853 0.7214 0.0791 0.1142]);
set(gcf,'Position',[1788 36 1385 819])

%% Statistics in Table 1
%% LAI
%% Obs
nanmean(obs_lai_month_ts(13:108))%0.8727
num_ens=40;

%% Free
%freeTLAI_month_ts(13:108,1)
mean(mean(freeTLAI_month_ts(13:108,:),1))%2.1434
std(mean(freeTLAI_month_ts(13:108,:),1))%0.0059
rmse = mean(freeTLAI_month_ts(13:108,:),1)' - repmat(nanmean(obs_lai_month_ts(13:108)),num_ens,1); rmse = rmse.^2; rmse = nanmean(rmse); freelairmse = rmse.^0.5 %1.2707
freelaibias=mean(mean(freeTLAI_month_ts(13:108,:),1))-nanmean(obs_lai_month_ts(13:108));%1.2707
%% Assim
%assimbothsepdisoutTLAI_month_ts(13:108,1)
mean(mean(assimbothsepdisoutTLAI_month_ts(13:108,:),1))%0.8915
std(mean(assimbothsepdisoutTLAI_month_ts(13:108,:),1))%0.0014
rmse = mean(assimbothsepdisoutTLAI_month_ts(13:108,:),1)' - repmat(nanmean(obs_lai_month_ts(13:108)),num_ens,1); rmse = rmse.^2; rmse = nanmean(rmse); assimlairmse = rmse.^0.5 %0.0189
assimlaibias=mean(mean(assimbothsepdisoutTLAI_month_ts(13:108,:),1))-nanmean(obs_lai_month_ts(13:108));%0.0188

%% Percentage Change
(mean(mean(assimbothsepdisoutTLAI_month_ts(13:108,:),1))-mean(mean(freeTLAI_month_ts(13:108,:),1)))/mean(mean(freeTLAI_month_ts(13:108,:),1))%-0.5841
%(0.8915-2.1434)/2.1434

(assimlairmse-freelairmse)/freelairmse%-0.9852
%(0.0189-1.2707)/1.2707

(assimlaibias-freelaibias)/freelaibias%-0.9852
%(0.0188-1.2707)/1.2707


%% Biomass
%% Obs
obs_biomass_annual_ts(4)%1691.98
num_ens=40;

%% Free
%freebiomassinobs_month_ts(37:48,1)
mean(mean(freebiomassinobs_month_ts(37:48,:),1))%5914.10
std(mean(freebiomassinobs_month_ts(37:48,:),1))%15.9607
rmse = mean(freebiomassinobs_month_ts(37:48,:),1)' - repmat(obs_biomass_annual_ts(4),num_ens,1); rmse = rmse.^2; rmse = nanmean(rmse); freebiomassrmse = rmse.^0.5; %4222.16
freebiomassbias=mean(mean(freebiomassinobs_month_ts(37:48,:),1))-obs_biomass_annual_ts(4);%4222.13

%% Assim
%assimbothsepdisoutbiomassinobs_month_ts(37:48,1)
mean(mean(assimbothsepdisoutbiomassinobs_month_ts(37:48,:),1))%1669.49
std(mean(assimbothsepdisoutbiomassinobs_month_ts(37:48,:),1))%1.2848
rmse = mean(assimbothsepdisoutbiomassinobs_month_ts(37:48,:),1)' - repmat(obs_biomass_annual_ts(4),num_ens,1); rmse = rmse.^2; rmse = nanmean(rmse); assimbiomassrmse = rmse.^0.5; %22.5227
assimbiomassbias=mean(mean(assimbothsepdisoutbiomassinobs_month_ts(37:48,:),1))-obs_biomass_annual_ts(4);%-22.4869

%% Percentage Change
(mean(mean(assimbothsepdisoutbiomassinobs_month_ts(37:48,:),1))-mean(mean(freebiomassinobs_month_ts(37:48,:),1)))/mean(mean(freebiomassinobs_month_ts(37:48,:),1))%-0.7177
%(1669.5-5914.1)/5914.1

(assimbiomassrmse-freebiomassrmse)/freebiomassrmse%-0.9947
%(22.5227-4222.16)/4222.16

(assimbiomassbias-freebiomassbias)/freebiomassbias%-1.0053
%(-22.4869-4222.13)/4222.13