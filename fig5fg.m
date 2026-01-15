%% fig5
clear;close all;
addpath(genpath('/data/'));
addpath(genpath('/code/'));
load('fig5fg.mat');
%% fig5.f right
clusterp = find(Beta_FAdataclust_ori == 1);
data1 = NS_Beta{1};
data2 = S_Beta{1};
dataNS = [nanmean(data1)+nanstd(data1)/sqrt(size(data1,1));nanmean(data1)-nanstd(data1)/sqrt(size(data1,1))];
dataS = [nanmean(data2)+nanstd(data2)/sqrt(size(data2,1));nanmean(data2)-nanstd(data2)/sqrt(size(data2,1))];
figure
subplot(1,2,1);hold on;
rectangle('Position', [clusterp(1), -2, clusterp(end)-clusterp(1), 4],...
    'EdgeColor', 'none', 'FaceColor', addcolorplus(4));
plot(1:size(data1,2), nanmean(data1),'Color',addcolorplus(94),'LineWidth', 2);
fill([1:size(dataNS,2) size(dataNS,2):-1:1], [dataNS(1,:), fliplr(dataNS(2,:))], ...
    addcolorplus(94), 'EdgeAlpha', 0, 'FaceAlpha', 0.15);
plot(1:size(data2,2), nanmean(data2),'Color',addcolorplus(49),'LineWidth', 2);
fill([1:size(dataS,2) size(dataS,2):-1:1], [dataS(1,:), fliplr(dataS(2,:))], ...
    addcolorplus(49), 'EdgeAlpha', 0, 'FaceAlpha', 0.15);
xlim([1 130]);
ylim([-1.4 1.4]);
set(gca,'XTick',[1 31 61 91 121 150],'FontSize',10);
set(gca,'XTickLabel',[-0.3 0 0.3 0.6 0.9 1.2],'FontSize',10);
set(gca,'YTick',-1:0.5:1,'FontSize',10);
xlabel('Times (s)','FontSize',12);
ylabel('Beta power','FontSize',12);
hold on;plot([31 31],[-2 2],'k--','LineWidth',2);
legend({'Non-ES','','ES'},'FontSize',10,'Location','best','box','off');
title('TF results for FA','FontSize',12);
set(gca,'FontName','Arial');
%% fig5.g
subplot(1,4,3);hold on;
pcolor(FAT_PAC');shading interp;
clust_ori_new=FSplotbefore(PAC_FAdataclust_ori,PAC_FAp_sort,PAC_FAp_sort);
clust_ori_new2=FSplotbefore(PAC_FAdataclust_ori2,PAC_FAp_sort2,PAC_FAp_sort2);
contour(clust_ori_new',[-0.18 0.23],'k','LineWidth',2);
contour(clust_ori_new2',[-0.18 0.23],'k','LineWidth',2);
plotquick_pac;
colorbar;

subplot(1,4,4);hold on;
Pdotbar([NSdatas1,Sdatas1],addcolorplus(5),[addcolorplus(94);addcolorplus(49)]);
set(gca,'FontSize',10,'XTick',[1 2],'XTickLabel',{'Non-ES','ES'});
xlim([0.5 2.5]);ylim([-3 3.5]);
xtickangle(0);
xlabel({'Condition'},'FontSize',12);
ylabel({'PACz'},'FontSize',12);
set(gcf,'position',[0,0,1800 400]);
%%
set(gcf,'Renderer','painters');
print(gcf, '-djpeg', ['/results/' 'figure5fg.jpg'], '-r300');
disp('Figure 5fg has been successfully generated.');