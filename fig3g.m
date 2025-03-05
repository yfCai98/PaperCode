%% fig3.g
addpath(genpath('/data/'));
addpath(genpath('/code/'));
load('fig3g.mat');
%% phase distribution for all conditions
colorall = [addcolorplus(160);addcolorplus(179);addcolorplus(3)];
figure;
hold on;
scatter(1:6, mean(phase_Hit50,2), 600, 'filled', 'MarkerFaceColor', colorall(2,:),'MarkerEdgeColor',colorall(2,:),'MarkerEdgeAlpha', 0.4,'MarkerFaceAlpha', 0.4);
for ci = 1:6
    scatter(ci*ones(77,1) + randn(77,1)*0.1, phase_Hit50(ci,:),18, 'MarkerEdgeColor', colorall(2,:),'MarkerEdgeAlpha', 1,'MarkerFaceColor',colorall(2,:), 'MarkerFaceAlpha', 1);
end
scatter(8:13, mean(phase_FA,2), 600, 'filled', 'MarkerFaceColor', colorall(1,:),'MarkerEdgeColor',colorall(1,:),'MarkerEdgeAlpha', 0.4,'MarkerFaceAlpha', 0.4);
for cii = 1:6
    scatter((cii+7)*ones(77,1) + randn(77,1)*0.1, phase_FA(cii,:),18, 'MarkerEdgeColor', colorall(1,:),'MarkerEdgeAlpha', 0.6,'MarkerFaceColor',colorall(1,:), 'MarkerFaceAlpha', 0.6);
end
scatter(15:20, mean(phase_CR,2), 600, 'filled', 'MarkerFaceColor', colorall(3,:),'MarkerEdgeColor',colorall(3,:),'MarkerEdgeAlpha', 0.4,'MarkerFaceAlpha', 0.4);
for ciii = 1:6
    scatter((ciii+14)*ones(77,1) + randn(77,1)*0.1, phase_CR(cii,:),18, 'MarkerEdgeColor', colorall(3,:),'MarkerEdgeAlpha', 0.6,'MarkerFaceColor',colorall(3,:), 'MarkerFaceAlpha', 0.6);
end

errorbar(1:6,mean(phase_Hit50,2),std(phase_Hit50,[],2)/sqrt(size(phase_FA,2)),'-','LineWidth',1,'Color','k');
errorbar(8:13,mean(phase_FA,2),std(phase_FA,[],2)/sqrt(size(phase_FA,2)),'-','LineWidth',1,'Color','k');
errorbar(15:20,mean(phase_CR,2),std(phase_CR,[],2)/sqrt(size(phase_FA,2)),'-','LineWidth',1,'Color','k');

ylim([0.89 1.12]);
xlim([0 21])
set(gca, 'YTick', 0.9:0.1:1.1,'FontSize',20);
xlabel('Phase angles at 18 - 30 Hz','FontSize',25);
ylabel({'Normalized gamma' 'amplitudes'},'FontSize',25);
legend({'Hit','','','','','','','FA','',...
    '','','','','','','CR'},'box','off','FontSize',20,'location','best');
set(gca, 'XTick', [0.5 6.5 7.5 13.5 14.5 20.5],'XTickLabel', {'-\pi','\pi','-\pi', '\pi', '-\pi', '\pi'},'FontSize',20);
set(gca,'FontName','Arial');
set(gcf,'position',[0,0,1200 400]);
%%
disp('Figure 3g has been successfully generated.');