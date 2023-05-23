clear all
%% Load respiration data
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/';
load([basedir,'ERSRfreeassimbothsepdisout.mat']);

%% Load geographic information
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/';
load([basedir,'geoinfo.mat']);
%% Respiration component
% Free run 
freeER_month_ts=zeros(size(freeER,3),size(freeER,4));
freeSR_month_ts=zeros(size(freeSR,3),size(freeSR,4));

for itime=1:size(freeER,3)
    for iens=1:size(freeER,4)
        X=freeER(:,:,itime,iens).*landarea;
        freeER_month_ts(itime,iens)=nanmean(X(:))./nanmean(landarea(:));
        
        X=freeSR(:,:,itime,iens).*landarea;
        freeSR_month_ts(itime,iens)=nanmean(X(:))./nanmean(landarea(:));
        
    end
end

% Assim
assimbothsepdisoutER_month_ts=zeros(size(assimbothsepdisoutER,3),size(assimbothsepdisoutER,4));
assimbothsepdisoutSR_month_ts=zeros(size(assimbothsepdisoutSR,3),size(assimbothsepdisoutSR,4));

for itime=1:size(assimbothsepdisoutER,3)
    for iens=1:size(assimbothsepdisoutER,4)
        X=assimbothsepdisoutER(:,:,itime,iens).*landarea;
        assimbothsepdisoutER_month_ts(itime,iens)=nanmean(X(:))./nanmean(landarea(:));
        
        X=assimbothsepdisoutSR(:,:,itime,iens).*landarea;
        assimbothsepdisoutSR_month_ts(itime,iens)=nanmean(X(:))./nanmean(landarea(:));
        
    end
end

clear freeER freeSR
clear assimbothsepdisoutER assimbothsepdisoutSR

%% ER
num_month=12;
num_ens=40;

freeER_seasonal_ts=zeros(num_month,num_ens);
for im=1:12
    ims=im;
    for iens=1:num_ens
        freeER_seasonal_ts(im,iens)=mean(freeER_month_ts(ims:12:36,iens),1);
    end
end

assimbothsepdisoutER_seasonal_ts=zeros(num_month,num_ens);
for im=1:12
    ims=im;
    for iens=1:num_ens
        assimbothsepdisoutER_seasonal_ts(im,iens)=mean(assimbothsepdisoutER_month_ts(ims:12:36,iens),1);
    end
end

%% SR
num_month=12;
num_ens=40;

freeSR_seasonal_ts=zeros(num_month,num_ens);
for im=1:12
    ims=im;
    for iens=1:num_ens
        freeSR_seasonal_ts(im,iens)=mean(freeSR_month_ts(ims:12:36,iens),1);
    end
end

assimbothsepdisoutSR_seasonal_ts=zeros(num_month,num_ens);
for im=1:12
    ims=im;
    for iens=1:num_ens
        assimbothsepdisoutSR_seasonal_ts(im,iens)=mean(assimbothsepdisoutSR_month_ts(ims:12:36,iens),1);
    end
end

day_convert=3600*24;

%% Figure
%% Above Ground Respiration = ER-SR
figure()
plot(freeSR_seasonal_ts(:,1)*day_convert,'LineStyle','-','LineWidth',2,'Color',[0.9 0.8 0.1 0.25]); hold on;
plot(assimbothsepdisoutSR_seasonal_ts(:,1)*day_convert,'LineStyle','-','Color',[0.8 0.45 0.40],'LineWidth',2); hold on;
plot((freeER_seasonal_ts(:,1)-freeSR_seasonal_ts(:,1))*day_convert,'LineStyle','-','LineWidth',2,'Color',[0.6 0.8 0.1 0.25]); hold on;
plot((assimbothsepdisoutER_seasonal_ts(:,1)-assimbothsepdisoutSR_seasonal_ts(:,1))*day_convert,'LineStyle','-','Color',[0.5 0.15 0.80],'LineWidth',2); hold on;

plot(freeSR_seasonal_ts*day_convert,'LineStyle','-','LineWidth',2,'Color',[0.9 0.8 0.1 0.25]); hold on;
plot(assimbothsepdisoutSR_seasonal_ts*day_convert,'LineStyle','-','Color',[0.8 0.45 0.40],'LineWidth',2); hold on;
plot((freeER_seasonal_ts-freeSR_seasonal_ts)*day_convert,'LineStyle','-','LineWidth',2,'Color',[0.6 0.8 0.1 0.25]); hold on;
plot((assimbothsepdisoutER_seasonal_ts-assimbothsepdisoutSR_seasonal_ts)*day_convert,'LineStyle','-','Color',[0.5 0.15 0.80],'LineWidth',2); hold on;
set(gca,'Position',[0.0900 0.110 0.9 0.8250])

ttime=12;
xticks=1:12;
xticklabels={'Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';'Oct';'Nov';'Dec'};

set(gca,'XLim',[0 ttime+1],'YLim',[0 4],'XTick',xticks,'XTickLabel',xticklabels,'FontSize',30);
ylabel('(gC m^-^2 d^-^1)','FontSize',30,'FontWeight','Bold');
xlabel('Year','FontSize',30,'FontWeight','Bold');
title('Seasonal SR and aboveground respiration','FontSize',35,'FontWeight','Bold');

h1=legend('Free SR','Assim SR','Free aboveground respiration','Assim aboveground respiration');
set(h1,'Box','off');
%set(h1,'FontSize',20,'FontWeight','bold');
set(gcf,'Position',[1706 -50 1178 717])