%% fig3.h
addpath(genpath('/data/'));
addpath(genpath('/code/'));
load('fig3h.mat');
FCidk = find(clust_FC);
FHidk = find(clust_FH);
%% Phase–slope index contrast results
figure;hold on;
colorall = [addcolorplus(160);addcolorplus(1);addcolorplus(179);addcolorplus(3)];
plot(mean(psi_Hit50),'Color',colorall(3,:),'LineWidth', 2);
fill([1:size(psi_FA,2) size(psi_FA,2):-1:1], [plotHit50(:,2)', fliplr(plotHit50(:,3)')], ...
    colorall(3,:), 'EdgeAlpha', 0, 'FaceAlpha', 0.15);
plot(mean(psi_FA),'Color',colorall(1,:),'LineWidth', 2);
fill([1:size(psi_FA,2) size(psi_FA,2):-1:1], [plotFA(:,2)', fliplr(plotFA(:,3)')], ...
    colorall(1,:), 'EdgeAlpha', 0, 'FaceAlpha', 0.15);
plot(mean(psi_CR),'Color',colorall(4,:),'LineWidth', 2);
fill([1:size(psi_FA,2) size(psi_FA,2):-1:1], [plotCR(:,2)', fliplr(plotCR(:,3)')], ...
    colorall(4,:), 'EdgeAlpha', 0, 'FaceAlpha', 0.15);

plot(FCidk,0.065*ones(1,length(FCidk)),'k-','lineWidth',2);
strFC = '***';
text(8.2,0.069,strFC,'FontSize',10,'FontName','Times New Roman');
plot(FHidk,0.075*ones(1,length(FHidk)),'k-','lineWidth',2);
strFH = '***';
text(8.2,0.079,strFH,'FontSize',10,'FontName','Times New Roman');

ylim([-0.02 0.085]);
xlim([1 size(psi_FA,2)]);
set(gca,'XTick',3:4:15,'XTickLabel',20:3:29,'FontSize',20);
set(gca, 'YTick',-0.2:0.02:0.08 ,'FontSize',20);
xlabel('Frequency (Hz)','FontSize',25);
ylabel('Phase–slope index','FontSize',25);
legend({'Hit','','FA','','CR'},'box','off','FontSize',20,'location','best');
set(gca,'FontName','Times New Roman');
set(gcf,'position',[0,0,1200 400]);
%%
disp('Figure 3h has been successfully generated.');