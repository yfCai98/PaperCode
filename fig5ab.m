clear;close all;
addpath(genpath('/data/'));
addpath(genpath('/code/'));
load('fig5a.mat');
figure;hold on; 
plotsize = 2;
plot_elecs_on_3dbrain_cyf(IFG_corro_tkr,plotsize,addcolorplus(98),1);
plot_elecs_on_3dbrain_cyf(ESsite_tkr,plotsize,addcolorplus(1),0);
plot_elecs_on_3dbrain_cyf(AAC_corro_tkr_no,plotsize,addcolorplus(2),0);
plot_elecs_on_3dbrain_cyf2(AAC_corro_tkr,plotsize,addcolorplus(278),Gamma_res,0);

light('Parent',gca,'Position',[-1 0 0]);
view(gca,[-90 0]);
set(gcf,'position',[0,0,1200 700]);

print(gcf, '-djpeg', ['/results/' 'figure5a.jpg'], '-r300');
disp('Figure 5a has been successfully generated.');
%%
clear;close all;
addpath(genpath('/data/'));
addpath(genpath('/code/'));
load('fig5b.mat');
figure;hold on; 
hold on;plot(datademon,'k');
line([6000 6000],[-200 400],'Color',addcolorplus(49),'LineStyle','--','Linewidth',2);
ylim([-200 400]);
xlim([1 12000]);
set(gca,'Visible','off');
set(gcf,'position',[0,0,600 300]);

print(gcf, '-djpeg', ['/results/' 'figure5b.jpg'], '-r300');
disp('Figure 5b has been successfully generated.');