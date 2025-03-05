%% fig3.a
addpath(genpath('/data/'));
addpath(genpath('/code/'));
load('fig3a.mat');
close all
figure
hold on 
plotsize = 2;

plotcolor = addcolorplus(98); 
plot_elecs_on_3dbrain_cyf(elec_tkr_coors_IFG,plotsize,plotcolor,1)

plotcolor = addcolorplus(2); 
plot_elecs_on_3dbrain_cyf(elec_tkr_coorsall,plotsize,plotcolor,0)
plot_elecs_on_3dbrain_cyf2(elec_tkr_coors,plotsize,addcolorplus(278),mappingHit,0)
set(gcf,'position',[0,0,1200 700]);
%%
disp('Figure 3a has been successfully generated.');