clear;clc;
load('fig3g.mat');

colorall = [addcolorplus(160);addcolorplus(179);addcolorplus(3)];
figure;
hold on;

scatter(1:6, mean(phase_Hit50,2), 600, 'filled', 'MarkerFaceColor', colorall(2,:),'MarkerEdgeColor',colorall(2,:));
scatter(8:13, mean(phase_FA,2), 600, 'filled', 'MarkerFaceColor', colorall(1,:),'MarkerEdgeColor',colorall(1,:));
scatter(15:20, mean(phase_CR,2), 600, 'filled', 'MarkerFaceColor', colorall(3,:),'MarkerEdgeColor',colorall(3,:));

errorbar(1:6,mean(phase_Hit50,2),std(phase_Hit50,[],2)/sqrt(size(phase_FA,2)),'LineWidth',0.2,'Color','k', 'LineStyle', 'none');
errorbar(8:13,mean(phase_FA,2),std(phase_FA,[],2)/sqrt(size(phase_FA,2)),'LineWidth',0.2,'Color','k', 'LineStyle', 'none');
errorbar(15:20,mean(phase_CR,2),std(phase_CR,[],2)/sqrt(size(phase_FA,2)),'LineWidth',0.2,'Color','k', 'LineStyle', 'none');

ylim([0.98 1.02]);
xlim([0 21])
set(gca, 'YTick', [0.98 1 1.02],'FontSize',20);
xlabel('Phase angles at 18 - 30 Hz','FontSize',25);
ylabel({'Normalized gamma' 'amplitudes'},'FontSize',25);
legend({'Hit','FA','CR'},'box','off','FontSize',20,'location','best');
set(gca, 'XTick', [0.5 6.5 7.5 13.5 14.5 20.5],'XTickLabel', {'-\pi','\pi','-\pi', '\pi', '-\pi', '\pi'},'FontSize',20);
set(gca,'FontName','Arial');
set(gcf,'position',[0,0,1200 400]);
