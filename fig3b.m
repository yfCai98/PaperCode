%% fig3.b
addpath(genpath('/data/'));
addpath(genpath('/code/'));
load('fig3b.mat');
%% Time-frequency results for all hit
figure
subplot(2,1,1);
hold on
Hitclust_ori_new=FSplotbefore(Hitclust_ori,Hitp_sort,Hitclust_size);
pcolor(Hittvalue);shading interp;
contour(Hitclust_ori_new,[-0.18 0.23],'k','LineWidth',2);
caxis([-4, 4]);
title('All Hit','FontSize',20);
plotquick
map1 = addcolorplus(293);
map1 = flip(map1, 1);
colormap(map1);
%% gamma contrast oscillations for all hit and miss
colorall = [addcolorplus(17);addcolorplus(240)];
subplot(4,1,3)
hold on
if ~isempty(find(p_HM<0.05))
    for li = 1:length(find(p_HM<0.05))
        sitenow = find(clust_HM==li);
        rectangle('Position', [sitenow(1), -0.1, sitenow(end)-sitenow(1), 1.1],...
            'EdgeColor', 'none', 'FaceColor', [0.7, 0.7, 0.7]);
    end
end

plot(1:length(Hitall_new), nanmean(Hitall_new),'Color',colorall(1,:),'LineWidth', 1);
fill([1:size(plotHitall,1) size(plotHitall,1):-1:1], [plotHitall(:,2)', fliplr(plotHitall(:,3)')], ...
    colorall(1,:), 'EdgeAlpha', 0, 'FaceAlpha', 0.15);

plot(1:length(Missall_new), nanmean(Missall_new),'Color',colorall(2,:),'LineWidth', 1);
fill([1:size(plotMissall,1) size(plotMissall,1):-1:1], [plotMissall(:,2)', fliplr(plotMissall(:,3)')], ...
   colorall(2,:), 'EdgeAlpha', 0, 'FaceAlpha', 0.15);
plotquick2
xlim([1 length(Missall_new)]);
ylim([-0.1 1]);
legend({'All Hit','','All Miss',''},'FontSize',10,'Location','best','box','off');
set(gcf,'position',[0,0,400 680]);
%%
disp('Figure 3b has been successfully generated.');