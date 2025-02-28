%% fig3.f
load('fig3f.mat');
flow = 2:30;
fup = 20:5:150;
%% Phase-amplitude coupling contrast results
figure
subplot(1,2,1);
hold on
FCclust_ori_new=FSplotbefore(FCclust_ori,FCp_sort,FCclust_size);
pcolor(FCtvalue');
shading interp
contour(FCclust_ori_new',[-0.18 0.23],'k','LineWidth',2);
[x y]=plotfeak_PAC(FCtvalue,FCclust_ori_new,[[0 0 0]]);
peaklow = flow(x);
peakup = fup(y);
caxis([-3, 3]);
set(gca,'YTick',1:4:length(fup),'FontSize',15);
set(gca,'YTickLabel',fup(1:4:length(fup)),'FontSize',15);
set(gca,'XTick',1:4:length(flow),'FontSize',15);
set(gca,'XTickLabel',flow(1:4:length(flow)),'FontSize',15);
xlabel('Frequency for phase(Hz)','FontSize',25);
ylabel('Frequency for power(Hz)','FontSize',25);
if ~isempty(peaklow)
title(['FA - CR: ' num2str(peaklow) '-' num2str(peakup) ' Hz(Peak)'],'FontSize',25);
else
title('FA - CR: No cluster','FontSize',25);
end
axis xy
colorbar
set(gca,'FontName','Times New Roman','FontWeight','bold');

subplot(1,2,2);
hold on
FHclust_ori_new=FSplotbefore(FHclust_ori,FHp_sort,FHclust_size);
pcolor(FHtvalue');
shading interp
contour(FHclust_ori_new',[-0.18 0.23],'k','LineWidth',2);
[x y]=plotfeak_PAC(FHtvalue,FHclust_ori_new,[[0 0 0]]);
peaklow = flow(x);
peakup = fup(y);
caxis([-3, 3]);
set(gca,'YTick',1:4:length(fup),'FontSize',15);
set(gca,'YTickLabel',fup(1:4:length(fup)),'FontSize',15);
set(gca,'XTick',1:4:length(flow),'FontSize',15);
set(gca,'XTickLabel',flow(1:4:length(flow)),'FontSize',15);
xlabel('Frequency for phase(Hz)','FontSize',25);
ylabel('Frequency for power(Hz)','FontSize',25);
if ~isempty(peaklow)
title(['FA - Hit: ' num2str(peaklow) '-' num2str(peakup) ' Hz(Peak)'],'FontSize',25);
else
title('FA - Hit: No cluster','FontSize',25);
end
axis xy
colorbar
set(gca,'FontName','Times New Roman','FontWeight','bold');

map1 = addcolorplus(293);
map1 = flip(map1, 1);
colormap(map1);
set(gcf,'position',[0,0,1000 400]);