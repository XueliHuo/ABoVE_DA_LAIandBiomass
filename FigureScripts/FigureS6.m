clear all
%% Load dominant pft information
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/';
load([basedir,'dominantpft50.mat']);

%% Load Wang Biomass observation
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/';
load([basedir,'obstransbiomassinmodelarea.mat']);

%% Load geographic information
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/';
load([basedir,'geoinfo.mat']);

%% Aboveground Biomass component
%% free
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/';
load([basedir,'LEAFCLIVESTEMCDEADSTEMCfreerun.mat']);
%% assimbothsepdisout
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA/JGR-Bio-Data/';
load([basedir,'LEAFCLIVESTEMCDEADSTEMCassimbothsepdisout.mat']);

%% Root component
%% free
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA//JGR-Bio-Data/';
load([basedir,'FROOTCLIVECROOTCDEADCROOTCfreerun.mat']);

%% assimbothsepdisout
basedir = '/Users/xuelihuo/DART_CLM_PRAC/ABoVE_DA//JGR-Bio-Data/';
load([basedir,'FROOTCLIVECROOTCDEADCROOTCassimbothsepdisout.mat']);


%% Freerun
freeLEAFC_avg_ens=nanmean(freeLEAFC,4);
freeLEAFC_avg_ens_2019=squeeze(nanmean(freeLEAFC_avg_ens(:,:,97:108),3));
freeLIVESTEMC_avg_ens=nanmean(freeLIVESTEMC,4);
freeLIVESTEMC_avg_ens_2019=squeeze(nanmean(freeLIVESTEMC_avg_ens(:,:,97:108),3));
freeDEADSTEMC_avg_ens=nanmean(freeDEADSTEMC,4);
freeDEADSTEMC_avg_ens_2019=squeeze(nanmean(freeDEADSTEMC_avg_ens(:,:,97:108),3));

freeFROOTC_avg_ens=nanmean(freeFROOTC,4);
freeFROOTC_avg_ens_2019=squeeze(nanmean(freeFROOTC_avg_ens(:,:,97:108),3));
freeLIVECROOTC_avg_ens=nanmean(freeLIVECROOTC,4);
freeLIVECROOTC_avg_ens_2019=squeeze(nanmean(freeLIVECROOTC_avg_ens(:,:,97:108),3));
freeDEADCROOTC_avg_ens=nanmean(freeDEADCROOTC,4);
freeDEADCROOTC_avg_ens_2019=squeeze(nanmean(freeDEADCROOTC_avg_ens(:,:,97:108),3));

freevegc_avg_ens_2019=freeLEAFC_avg_ens_2019+freeLIVESTEMC_avg_ens_2019+freeDEADSTEMC_avg_ens_2019+...
    freeFROOTC_avg_ens_2019+freeLIVECROOTC_avg_ens_2019+freeDEADCROOTC_avg_ens_2019;

%% Assimbothsepdisout
assimbothsepdisoutLEAFC_avg_ens=nanmean(assimbothsepdisoutLEAFC,4);
assimbothsepdisoutLEAFC_avg_ens_2019=squeeze(nanmean(assimbothsepdisoutLEAFC_avg_ens(:,:,97:108),3));
assimbothsepdisoutLIVESTEMC_avg_ens=nanmean(assimbothsepdisoutLIVESTEMC,4);
assimbothsepdisoutLIVESTEMC_avg_ens_2019=squeeze(nanmean(assimbothsepdisoutLIVESTEMC_avg_ens(:,:,97:108),3));
assimbothsepdisoutDEADSTEMC_avg_ens=nanmean(assimbothsepdisoutDEADSTEMC,4);
assimbothsepdisoutDEADSTEMC_avg_ens_2019=squeeze(nanmean(assimbothsepdisoutDEADSTEMC_avg_ens(:,:,97:108),3));

assimbothsepdisoutFROOTC_avg_ens=nanmean(assimbothsepdisoutFROOTC,4);
assimbothsepdisoutFROOTC_avg_ens_2019=squeeze(nanmean(assimbothsepdisoutFROOTC_avg_ens(:,:,97:108),3));
assimbothsepdisoutLIVECROOTC_avg_ens=nanmean(assimbothsepdisoutLIVECROOTC,4);
assimbothsepdisoutLIVECROOTC_avg_ens_2019=squeeze(nanmean(assimbothsepdisoutLIVECROOTC_avg_ens(:,:,97:108),3));
assimbothsepdisoutDEADCROOTC_avg_ens=nanmean(assimbothsepdisoutDEADCROOTC,4);
assimbothsepdisoutDEADCROOTC_avg_ens_2019=squeeze(nanmean(assimbothsepdisoutDEADCROOTC_avg_ens(:,:,97:108),3));

assimbothsepdisoutvegc_avg_ens_2019=assimbothsepdisoutLEAFC_avg_ens_2019+assimbothsepdisoutLIVESTEMC_avg_ens_2019+assimbothsepdisoutDEADSTEMC_avg_ens_2019+...
    assimbothsepdisoutFROOTC_avg_ens_2019+assimbothsepdisoutLIVECROOTC_avg_ens_2019+assimbothsepdisoutDEADCROOTC_avg_ens_2019;

%% The core ABoVE region
vartoplot = obstransbiomassinmodelarea(:,:,1);
%% Free
Y=freevegc_avg_ens_2019;
Y(isnan(vartoplot))=nan;

X=freeLEAFC_avg_ens_2019;
X(isnan(vartoplot))=nan;
abovefreeLEAFCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0220

X=freeLIVESTEMC_avg_ens_2019;
X(isnan(vartoplot))=nan;
abovefreeLIVESTEMCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0021

X=freeDEADSTEMC_avg_ens_2019;
X(isnan(vartoplot))=nan;
abovefreeDEADSTEMCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.7196

X=freeFROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
abovefreeFROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0331

X=freeLIVECROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
abovefreeLIVECROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%6.2152e-04

X=freeDEADCROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
abovefreeDEADCROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.2226

abovefreeLEAFCratio+abovefreeFROOTCratio+abovefreeLIVESTEMCratio+abovefreeLIVECROOTCratio+abovefreeDEADSTEMCratio+abovefreeDEADCROOTCratio%1

%% assimbothsepdisout
Y=assimbothsepdisoutvegc_avg_ens_2019;
Y(isnan(vartoplot))=nan;

X=assimbothsepdisoutLEAFC_avg_ens_2019;
X(isnan(vartoplot))=nan;
aboveassimbothsepdisoutLEAFCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0175

X=assimbothsepdisoutLIVESTEMC_avg_ens_2019;
X(isnan(vartoplot))=nan;
aboveassimbothsepdisoutLIVESTEMCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0018

X=assimbothsepdisoutDEADSTEMC_avg_ens_2019;
X(isnan(vartoplot))=nan;
aboveassimbothsepdisoutDEADSTEMCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.6814

X=assimbothsepdisoutFROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
aboveassimbothsepdisoutFROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0323

X=assimbothsepdisoutLIVECROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
aboveassimbothsepdisoutLIVECROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%4.9393e-04

X=assimbothsepdisoutDEADCROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
aboveassimbothsepdisoutDEADCROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.2665

aboveassimbothsepdisoutLEAFCratio+aboveassimbothsepdisoutFROOTCratio+aboveassimbothsepdisoutLIVESTEMCratio+aboveassimbothsepdisoutLIVECROOTCratio+...
    aboveassimbothsepdisoutDEADSTEMCratio+aboveassimbothsepdisoutDEADCROOTCratio%1

%% NEBT
vartoplot = dominantpft;
vartoplot(isnan(obstransbiomassinmodelarea(:,:,1)))=nan;
vartoplot(vartoplot~=3)=nan;

%% Free
Y=freevegc_avg_ens_2019;
Y(isnan(vartoplot))=nan;

X=freeLEAFC_avg_ens_2019;
X(isnan(vartoplot))=nan;
nebtfreeLEAFCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0205

X=freeLIVESTEMC_avg_ens_2019;
X(isnan(vartoplot))=nan;
nebtfreeLIVESTEMCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0021

X=freeDEADSTEMC_avg_ens_2019;
X(isnan(vartoplot))=nan;
nebtfreeDEADSTEMCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.7217

X=freeFROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
nebtfreeFROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0309

X=freeLIVECROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
nebtfreeLIVECROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%6.2391e-04

X=freeDEADCROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
nebtfreeDEADCROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.2242

nebtfreeLEAFCratio+nebtfreeFROOTCratio+nebtfreeLIVESTEMCratio+nebtfreeLIVECROOTCratio+nebtfreeDEADSTEMCratio+nebtfreeDEADCROOTCratio%1

%% assimbothsepdisout
Y=assimbothsepdisoutvegc_avg_ens_2019;
Y(isnan(vartoplot))=nan;

X=assimbothsepdisoutLEAFC_avg_ens_2019;
X(isnan(vartoplot))=nan;
nebtassimbothsepdisoutLEAFCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0159

X=assimbothsepdisoutLIVESTEMC_avg_ens_2019;
X(isnan(vartoplot))=nan;
nebtassimbothsepdisoutLIVESTEMCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0017

X=assimbothsepdisoutDEADSTEMC_avg_ens_2019;
X(isnan(vartoplot))=nan;
nebtassimbothsepdisoutDEADSTEMCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.6761

X=assimbothsepdisoutFROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
nebtassimbothsepdisoutFROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0263

X=assimbothsepdisoutLIVECROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
nebtassimbothsepdisoutLIVECROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%5.1191e-04

X=assimbothsepdisoutDEADCROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
nebtassimbothsepdisoutDEADCROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.2794

nebtassimbothsepdisoutLEAFCratio+nebtassimbothsepdisoutFROOTCratio+nebtassimbothsepdisoutLIVESTEMCratio+nebtassimbothsepdisoutLIVECROOTCratio+...
    nebtassimbothsepdisoutDEADSTEMCratio+nebtassimbothsepdisoutDEADCROOTCratio%1

%% BDBS
vartoplot = dominantpft;
vartoplot(isnan(obstransbiomassinmodelarea(:,:,1)))=nan;
vartoplot(vartoplot~=12)=nan;

%% Free
Y=freevegc_avg_ens_2019;
Y(isnan(vartoplot))=nan;

X=freeLEAFC_avg_ens_2019;
X(isnan(vartoplot))=nan;
bdbsfreeLEAFCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0288

X=freeLIVESTEMC_avg_ens_2019;
X(isnan(vartoplot))=nan;
bdbsfreeLIVESTEMCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0020

X=freeDEADSTEMC_avg_ens_2019;
X(isnan(vartoplot))=nan;
bdbsfreeDEADSTEMCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.7109

X=freeFROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
bdbsfreeFROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0432

X=freeLIVECROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
bdbsfreeLIVECROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%6.0819e-04

X=freeDEADCROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
bdbsfreeDEADCROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.2145

bdbsfreeLEAFCratio+bdbsfreeFROOTCratio+bdbsfreeLIVESTEMCratio+bdbsfreeLIVECROOTCratio+bdbsfreeDEADSTEMCratio+bdbsfreeDEADCROOTCratio%1

%% assimbothsepdisout
Y=assimbothsepdisoutvegc_avg_ens_2019;
Y(isnan(vartoplot))=nan;

X=assimbothsepdisoutLEAFC_avg_ens_2019;
X(isnan(vartoplot))=nan;
bdbsassimbothsepdisoutLEAFCratio=nansum(X.*landarea)/nansum(Y.*landarea)% 0.0267

X=assimbothsepdisoutLIVESTEMC_avg_ens_2019;
X(isnan(vartoplot))=nan;
bdbsassimbothsepdisoutLIVESTEMCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0032

X=assimbothsepdisoutDEADSTEMC_avg_ens_2019;
X(isnan(vartoplot))=nan;
bdbsassimbothsepdisoutDEADSTEMCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.6838

X=assimbothsepdisoutFROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
bdbsassimbothsepdisoutFROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0723

X=assimbothsepdisoutLIVECROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
bdbsassimbothsepdisoutLIVECROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%9.5263e-04

X=assimbothsepdisoutDEADCROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
bdbsassimbothsepdisoutDEADCROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.2130

bdbsassimbothsepdisoutLEAFCratio+bdbsassimbothsepdisoutFROOTCratio+bdbsassimbothsepdisoutLIVESTEMCratio+bdbsassimbothsepdisoutLIVECROOTCratio+...
    bdbsassimbothsepdisoutDEADSTEMCratio+bdbsassimbothsepdisoutDEADCROOTCratio%1

%% NETT
vartoplot = dominantpft;
vartoplot(isnan(obstransbiomassinmodelarea(:,:,1)))=nan;
vartoplot(vartoplot~=2)=nan;
%% Free
Y=freevegc_avg_ens_2019;
Y(isnan(vartoplot))=nan;

X=freeLEAFC_avg_ens_2019;
X(isnan(vartoplot))=nan;
nettfreeLEAFCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0204

X=freeLIVESTEMC_avg_ens_2019;
X(isnan(vartoplot))=nan;
nettfreeLIVESTEMCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0022

X=freeDEADSTEMC_avg_ens_2019;
X(isnan(vartoplot))=nan;
nettfreeDEADSTEMCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.7189

X=freeFROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
nettfreeFROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0309

X=freeLIVECROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
nettfreeLIVECROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%6.4773e-04

X=freeDEADCROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
nettfreeDEADCROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.2270

nettfreeLEAFCratio+nettfreeFROOTCratio+nettfreeLIVESTEMCratio+nettfreeLIVECROOTCratio+nettfreeDEADSTEMCratio+nettfreeDEADCROOTCratio%1

%% assimbothsepdisout
Y=assimbothsepdisoutvegc_avg_ens_2019;
Y(isnan(vartoplot))=nan;

X=assimbothsepdisoutLEAFC_avg_ens_2019;
X(isnan(vartoplot))=nan;
nettassimbothsepdisoutLEAFCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0150

X=assimbothsepdisoutLIVESTEMC_avg_ens_2019;
X(isnan(vartoplot))=nan;
nettassimbothsepdisoutLIVESTEMCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0022

X=assimbothsepdisoutDEADSTEMC_avg_ens_2019;
X(isnan(vartoplot))=nan;
nettassimbothsepdisoutDEADSTEMCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.6456

X=assimbothsepdisoutFROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
nettassimbothsepdisoutFROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0239

X=assimbothsepdisoutLIVECROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
nettassimbothsepdisoutLIVECROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%6.3155e-04

X=assimbothsepdisoutDEADCROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
nettassimbothsepdisoutDEADCROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.3128

nettassimbothsepdisoutLEAFCratio+nettassimbothsepdisoutFROOTCratio+nettassimbothsepdisoutLIVESTEMCratio+nettassimbothsepdisoutLIVECROOTCratio+...
    nettassimbothsepdisoutDEADSTEMCratio+nettassimbothsepdisoutDEADCROOTCratio%1

%% C3AG
vartoplot = dominantpft;
vartoplot(isnan(obstransbiomassinmodelarea(:,:,1)))=nan;
vartoplot(vartoplot~=13)=nan;
%% Free
Y=freevegc_avg_ens_2019;
Y(isnan(vartoplot))=nan;

X=freeLEAFC_avg_ens_2019;
X(isnan(vartoplot))=nan;
c3agfreeLEAFCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0324

X=freeLIVESTEMC_avg_ens_2019;
X(isnan(vartoplot))=nan;
c3agfreeLIVESTEMCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0020

X=freeDEADSTEMC_avg_ens_2019;
X(isnan(vartoplot))=nan;
c3agfreeDEADSTEMCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.7039

X=freeFROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
c3agfreeFROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0487

X=freeLIVECROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
c3agfreeLIVECROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%5.9028e-04

X=freeDEADCROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
c3agfreeDEADCROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.2124

c3agfreeLEAFCratio+c3agfreeFROOTCratio+c3agfreeLIVESTEMCratio+c3agfreeLIVECROOTCratio+c3agfreeDEADSTEMCratio+c3agfreeDEADCROOTCratio%1

%% assimbothsepdisout
Y=assimbothsepdisoutvegc_avg_ens_2019;
Y(isnan(vartoplot))=nan;

X=assimbothsepdisoutLEAFC_avg_ens_2019;
X(isnan(vartoplot))=nan;
c3agassimbothsepdisoutLEAFCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0277

X=assimbothsepdisoutLIVESTEMC_avg_ens_2019;
X(isnan(vartoplot))=nan;
c3agassimbothsepdisoutLIVESTEMCratio=nansum(X.*landarea)/nansum(Y.*landarea)%7.6530e-04

X=assimbothsepdisoutDEADSTEMC_avg_ens_2019;
X(isnan(vartoplot))=nan;
c3agassimbothsepdisoutDEADSTEMCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.6996

X=assimbothsepdisoutFROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
c3agassimbothsepdisoutFROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.0582

X=assimbothsepdisoutLIVECROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
c3agassimbothsepdisoutLIVECROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%2.2957e-04

X=assimbothsepdisoutDEADCROOTC_avg_ens_2019;
X(isnan(vartoplot))=nan;
c3agassimbothsepdisoutDEADCROOTCratio=nansum(X.*landarea)/nansum(Y.*landarea)%0.2135

c3agassimbothsepdisoutLEAFCratio+c3agassimbothsepdisoutFROOTCratio+c3agassimbothsepdisoutLIVESTEMCratio+c3agassimbothsepdisoutLIVECROOTCratio+...
    c3agassimbothsepdisoutDEADSTEMCratio+c3agassimbothsepdisoutDEADCROOTCratio%1

%% Final figure
figure()
x=[1.15 2.15 3.15 4.15 5.15];
A=bar(x,[   aboveassimbothsepdisoutDEADCROOTCratio aboveassimbothsepdisoutLIVECROOTCratio aboveassimbothsepdisoutFROOTCratio...
    aboveassimbothsepdisoutDEADSTEMCratio aboveassimbothsepdisoutLIVESTEMCratio aboveassimbothsepdisoutLEAFCratio;...
    
    nebtassimbothsepdisoutDEADCROOTCratio nebtassimbothsepdisoutLIVECROOTCratio nebtassimbothsepdisoutFROOTCratio...
    nebtassimbothsepdisoutDEADSTEMCratio nebtassimbothsepdisoutLIVESTEMCratio nebtassimbothsepdisoutLEAFCratio;...
    
    nettassimbothsepdisoutDEADCROOTCratio nettassimbothsepdisoutLIVECROOTCratio nettassimbothsepdisoutFROOTCratio...
    nettassimbothsepdisoutDEADSTEMCratio nettassimbothsepdisoutLIVESTEMCratio nettassimbothsepdisoutLEAFCratio;...
    
    bdbsassimbothsepdisoutDEADCROOTCratio bdbsassimbothsepdisoutLIVECROOTCratio bdbsassimbothsepdisoutFROOTCratio...
    bdbsassimbothsepdisoutDEADSTEMCratio bdbsassimbothsepdisoutLIVESTEMCratio bdbsassimbothsepdisoutLEAFCratio;...
   
    c3agassimbothsepdisoutDEADCROOTCratio c3agassimbothsepdisoutLIVECROOTCratio c3agassimbothsepdisoutFROOTCratio...
    c3agassimbothsepdisoutDEADSTEMCratio c3agassimbothsepdisoutLIVESTEMCratio c3agassimbothsepdisoutLEAFCratio],...    
    'stacked'); hold on;
A(1).BarWidth=0.25;

A(1).FaceColor = 'flat';
%A(1).LineWidth = 2;
A(1).CData=ones(5,3).*[0.96 0.96 0.];
%A(1).EdgeColor=[0.96 0.96 0.];

A(3).FaceColor = 'flat';
%A(3).LineWidth = 2;
A(3).CData=ones(5,3).*[0.9290 0.6940 0.1250];
%A(3).EdgeColor=[0.9290 0.6940 0.1250];

A(4).FaceColor = 'flat';
%A(4).LineWidth = 2;
A(4).CData=ones(5,3).*[0.1 0.76 0.76];
%A(4).EdgeColor=[0.1 0.76 0.76];

A(5).FaceColor = 'flat';
%A(5).LineWidth = 2;
A(5).CData=ones(5,3).*[0.16 0.96 0.];
%A(5).EdgeColor=[0.16 0.96 0.];

A(6).FaceColor = 'flat';
%A(6).LineWidth = 2;
A(6).CData=ones(5,3).*[0.6 0.76 0.];
%A(6).EdgeColor=[0.6 0.76 0.];

x=[0.85 1.85 2.85 3.85 4.85];
F=bar(x,[abovefreeDEADCROOTCratio abovefreeLIVECROOTCratio abovefreeFROOTCratio...
    abovefreeDEADSTEMCratio abovefreeLIVESTEMCratio abovefreeLEAFCratio;...
    
    nebtfreeDEADCROOTCratio nebtfreeLIVECROOTCratio nebtfreeFROOTCratio...
    nebtfreeDEADSTEMCratio nebtfreeLIVESTEMCratio nebtfreeLEAFCratio;...
    
    nettfreeDEADCROOTCratio nettfreeLIVECROOTCratio nettfreeFROOTCratio...
    nettfreeDEADSTEMCratio nettfreeLIVESTEMCratio nettfreeLEAFCratio;...
    
    bdbsfreeDEADCROOTCratio bdbsfreeLIVECROOTCratio bdbsfreeFROOTCratio...
    bdbsfreeDEADSTEMCratio bdbsfreeLIVESTEMCratio bdbsfreeLEAFCratio;...
   
    c3agfreeDEADCROOTCratio c3agfreeLIVECROOTCratio c3agfreeFROOTCratio...
    c3agfreeDEADSTEMCratio c3agfreeLIVESTEMCratio c3agfreeLEAFCratio],...    
    'stacked'); hold on;
F(1).BarWidth=0.25;

F(1).FaceColor = 'flat';
%F(1).LineWidth = 2;
F(1).CData=ones(5,3).*[0.96 0.96 0.];
%F(1).EdgeColor=[0.96 0.96 0.];

F(3).FaceColor = 'flat';
%F(3).LineWidth = 2;
F(3).CData=ones(5,3).*[0.9290 0.6940 0.1250];
%F(3).EdgeColor=[0.9290 0.6940 0.1250];

F(4).FaceColor = 'flat';
%F(4).LineWidth = 2;
F(4).CData=ones(5,3).*[0.1 0.76 0.76];
%F(4).EdgeColor=[0.1 0.76 0.76];

F(5).FaceColor = 'flat';
%F(5).LineWidth = 2;
F(5).CData=ones(5,3).*[0.16 0.96 0.];
%F(5).EdgeColor=[0.16 0.96 0.];

F(6).FaceColor = 'flat';
%F(6).LineWidth = 2;
F(6).CData=ones(5,3).*[0.6 0.76 0.];
%F(6).EdgeColor=[0.6 0.76 0.];

F(1).FaceAlpha=0.4;
F(2).FaceAlpha=0.4;
F(3).FaceAlpha=0.4;
F(4).FaceAlpha=0.4;
F(5).FaceAlpha=0.4;
F(6).FaceAlpha=0.4;
%%
xticks=[1 2 3 4 5];
xticklabels={'ABoVE(core)';'NEBT';'NETT';'BDBS';'C3AG'};
set(gca,'Xlim',[0.4 6.5],'Ylim',[0 1],'XTick',xticks,'XTickLabel',xticklabels,'FontSize',28);
set(gca,'Position',[0.09 0.1 0.88 0.86]);

xlabel('Plant Functional Type','FontSize',30);
ylabel('Ratio of each vegetation pool','FontSize',30);
%title('Biomass in 2014','FontSize',30,'FontWeight','Bold');
set(gca,'Position',[0.08 0.12 0.9 0.82])

h1=legend('DEADCROOTC','LIVECROOTC','FROOTC','DEADSTEMC','LIVESTEMC','LEAFC');
set(h1,'FontSize',22);
set(h1,'box','off');

set(gcf,'Position',[2000 119 1218 775])

box off