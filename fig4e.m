clear;clc;
titlename = 'AAC: Gamma(30-150Hz)'; 
load('fig4e_AAC.mat');
% 
colorall = [addcolorplus(73);addcolorplus(130)];

pdatamean1 = squeeze(mean(covCorrS(:,1,:)))';
pdataste1 = squeeze(std(covCorrS(:,1,:)))'/sqrt(size(covCorrS,1));
cluster_now_plot1 = cluster_now(1,:);
pdatamean2 = squeeze(mean(covCorrS(:,3,:)))';
pdataste2 = squeeze(std(covCorrS(:,3,:)))'/sqrt(size(covCorrS,1));
cluster_now_plot2 = cluster_now(3,:);

figure; 
subplot(1,2,1);hold on;
rectangle('Position', [83, -0.05, 5, 0.2],...
    'EdgeColor', 'none', 'FaceColor', [0.7, 0.7, 0.7]);  %
rectangle('Position', [93, -0.05, 14, 0.2],...
    'EdgeColor', 'none', 'FaceColor', [0.7, 0.7, 0.7]);  %
xnow = 1:length(pdatamean1);
gap=0.1;
plot(xnow,pdatamean2+gap,'Color',colorall(2,:),'LineWidth',4);
fill([xnow fliplr(xnow)], [pdatamean2+pdataste2+gap fliplr(pdatamean2-pdataste2+gap)],...
    colorall(2,:), 'EdgeAlpha', 0, 'FaceAlpha', 0.15);
if sum(cluster_now_plot2)~=0
    for qqi = 1:length(unique(cluster_now_plot2))-1
        x1 = find(cluster_now_plot2 == qqi);
        y1 = 0.048*ones(1,length(x1));
        plot(x1,y1,'k-','lineWidth',3);
    end
end
plot(xnow,pdatamean1,'Color',colorall(1,:),'LineWidth',4);
fill([xnow fliplr(xnow)], [pdatamean1+pdataste1 fliplr(pdatamean1-pdataste1)],...
    colorall(1,:), 'EdgeAlpha', 0, 'FaceAlpha', 0.15);
if sum(cluster_now_plot1)~=0
    for qqi = 1:length(unique(cluster_now_plot1))-1
        x1 = find(cluster_now_plot1 == qqi);
        y1 = -0.02*ones(1,length(x1));
        plot(x1,y1,'Color',colorall(1,:),'lineWidth',3);
    end
end
xlim([1 length(pdatamean1)]);
ylim([-0.05 0.15])
set(gca,'XTick',[1 31 61 91 121],'FontSize',15);
set(gca,'XTickLabel',[-0.3 0 0.3 0.6 0.9],'FontSize',15);
set(gca,'YTick',[-0.03 0 0.03 0.07 0.1 0.13],'FontSize',15);
set(gca,'YTickLabel',[-0.03 0 0.03 -0.03 0 0.03],'FontSize',15);
hold on;plot([31 31],[-0.05 0.16],'k--','LineWidth',2);
hold on;plot([57.63630 57.63630],[-0.05 0.16],'b--','LineWidth',2);
legend({'X3','','','','X1'},'location','best');
title(titlename,'FontSize',25);
xlabel('Time(s)','FontName','arial','FontSize',25);
ylabel('Coefficient','FontName','arial','FontSize',25);
set(gca,'FontName','Times New Roman','FontWeight','bold');
%%
subplot(1,2,2);hold on;
titlename = 'IFG: Beta(16-30Hz)'; 
load('fig4e_Beta.mat');

colorall = [addcolorplus(73);addcolorplus(130)];
pdatamean3 = squeeze(mean(covCorrS(:,1,:)))';
pdataste3 = squeeze(std(covCorrS(:,1,:)))'/sqrt(size(covCorrS,1));
cluster_now_plot3 = cluster_now(1,:);
pdatamean4 = squeeze(mean(covCorrS(:,3,:)))';
pdataste4 = squeeze(std(covCorrS(:,3,:)))'/sqrt(size(covCorrS,1));
cluster_now_plot4 = cluster_now(3,:);
xnow = 1:length(pdatamean4);
gap=0.06;
rectangle('Position', [10, -0.04, 42, 0.41],...
    'EdgeColor', 'none', 'FaceColor', [0.7, 0.7, 0.7]);
plot(xnow,pdatamean4+gap,'Color',colorall(2,:),'LineWidth',4);
fill([xnow fliplr(xnow)], [pdatamean4+pdataste4+gap fliplr(pdatamean4-pdataste4+gap)],...
    colorall(2,:), 'EdgeAlpha', 0, 'FaceAlpha', 0.15);
if sum(cluster_now_plot4)~=0
    for qqi = 1:length(unique(cluster_now_plot4))-1
        x1 = find(cluster_now_plot4 == qqi);
        y1 = 0.048*ones(1,length(x1));
        plot(x1,y1,'Color',colorall(2,:),'lineWidth',3);
    end
end
plot(xnow,pdatamean3,'Color',colorall(1,:),'LineWidth',4);
fill([xnow fliplr(xnow)], [pdatamean3+pdataste3 fliplr(pdatamean3-pdataste3)],...
    colorall(1,:), 'EdgeAlpha', 0, 'FaceAlpha', 0.15);
if sum(cluster_now_plot3)~=0
    for qqi = 1:length(unique(cluster_now_plot3))-1
        x1 = find(cluster_now_plot3 == qqi);
        y1 = -0.01*ones(1,length(x1));
        plot(x1,y1,'Color',colorall(1,:),'lineWidth',3);
    end
end
xlim([1 length(pdatamean1)]);
ylim([-0.04 0.11])
set(gca,'XTick',[1 31 61 91 121],'FontSize',15);
set(gca,'XTickLabel',[-0.3 0 0.3 0.6 0.9],'FontSize',15);
set(gca,'YTick',[-0.02 0 0.02 0.04 0.06 0.08],'FontSize',15);
set(gca,'YTickLabel',[-0.02 0 0.02 -0.02 0 0.02],'FontSize',15);
plot([31 31],[-0.05 0.16],'k--','LineWidth',2);
legend({'X3','','','','','X1'});
title(titlename,'FontSize',25);
xlabel('Time(s)','FontName','arial','FontSize',25);
ylabel('Coefficient','FontName','arial','FontSize',25);
set(gca,'FontName','Times New Roman','FontWeight','bold');
set(gcf,'position',[0,0,1100 320]);