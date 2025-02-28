%% fig3.c
load('fig3c.mat')
%% Time-frequency contrast results
figure
subplot(2,2,1);
hold on
FCclust_ori_new=FSplotbefore(FCclust_ori,FCp_sort,FCclust_size);
pcolor(FCtvalue);shading interp;
contour(FCclust_ori_new,[-0.18 0.23],'k','LineWidth',2);
caxis([-4, 4]);
title('FA - CR','FontSize',25);
plotquick

subplot(2,2,2);
hold on
FHclust_ori_new=FSplotbefore(FHclust_ori,FHp_sort,FHclust_size);
pcolor(FHtvalue);shading interp;
contour(FHclust_ori_new,[-0.18 0.23],'k','LineWidth',2);
caxis([-4, 4]);
title('FA - Hit','FontSize',25);
plotquick
map1 = addcolorplus(293);
map1 = flip(map1, 1);
colormap(map1);
%% gamma contrast oscillations 
setgap = 0.25;
maxvalue = max([nanmean(FA_new),nanmean(CR_new) nanmean(Hit_new50)])+setgap;
minvalue = min([nanmean(FA_new),nanmean(CR_new) nanmean(Hit_new50)])-setgap;
colorall = [addcolorplus(160);addcolorplus(2);addcolorplus(179);addcolorplus(2)];

subplot(4,2,5)
hold on
if ~isempty(find(p_FC<0.05))
       for li = 1:length(find(p_FC<0.05))
        sitenow = find(clust_FC==li);
        rectangle('Position', [sitenow(1), minvalue, sitenow(end)-sitenow(1), maxvalue-minvalue],...
           'EdgeColor', 'none', 'FaceColor', [0.7, 0.7, 0.7]);
    end 
end
plot(1:length(FA_new), nanmean(FA_new),'Color',colorall(1,:),'LineWidth', 2);
fill([1:size(plotdataFA,1) size(plotdataFA,1):-1:1], [plotdataFA(:,2)', fliplr(plotdataFA(:,3)')], ...
    colorall(1,:), 'EdgeAlpha', 0, 'FaceAlpha', 0.15);
plot(1:length(CR_new), nanmean(CR_new),'Color',colorall(2,:),'LineWidth', 2);
fill([1:size(plotdataCR,1) size(plotdataCR,1):-1:1], [plotdataCR(:,2)', fliplr(plotdataCR(:,3)')], ...
    colorall(2,:), 'EdgeAlpha', 0, 'FaceAlpha', 0.15);
plotquick2
xlim([1 size(FA_new,2)]);
ylim([minvalue maxvalue]);

subplot(4,2,6)
hold on
if ~isempty(find(p_FH<0.05))
       for li = 1:length(find(p_FH<0.05))
        sitenow = find(clust_FH==li);
        rectangle('Position', [sitenow(1), minvalue, sitenow(end)-sitenow(1), maxvalue-minvalue],...
           'EdgeColor', 'none', 'FaceColor', [0.7, 0.7, 0.7]);
    end 
end
plot(1:length(Hit_new50), nanmean(Hit_new50),'Color',colorall(3,:),'LineWidth', 2);
fill([1:size(plotdataHit50,1) size(plotdataHit50,1):-1:1], [plotdataHit50(:,2)', fliplr(plotdataHit50(:,3)')], ...
    colorall(3,:), 'EdgeAlpha', 0, 'FaceAlpha', 0.15);
plot(1:length(FA_new), nanmean(FA_new),'Color',colorall(1,:),'LineWidth', 2);
fill([1:size(plotdataFA,1) size(plotdataFA,1):-1:1], [plotdataFA(:,2)', fliplr(plotdataFA(:,3)')], ...
    colorall(1,:), 'EdgeAlpha', 0, 'FaceAlpha', 0.15);
xlim([1 size(Hit_new50,2)]);
ylim([minvalue maxvalue]);
plotquick2
set(gcf,'position',[0,0,800 680]);