clear;clc;
load('figfg.mat')
%%
namenow = {'','No Stimulus','','Stimulus'};
titlename = {'FA: Beta'};
colorall = [addcolorplus(94);addcolorplus(49)];    

figure;hold on;
rectangle('Position', [10, -2, 42, 4],...
    'EdgeColor', 'none', 'FaceColor', [0.7, 0.7, 0.7]);
sitenow = find(clustnow==1);
plot(sitenow,1.6*ones(1,length(sitenow)),'k-','lineWidth',3);
plot(1:length(FA_new_NS), nanmean(FA_new_NS),'Color',colorall(1,:),'LineWidth', 2);
fill([1:size(plotdataFA_NS,1) size(plotdataFA_NS,1):-1:1], [plotdataFA_NS(:,2)', fliplr(plotdataFA_NS(:,3)')], ...
    colorall(1,:), 'EdgeAlpha', 0, 'FaceAlpha', 0.15);
plot(1:length(FA_new_S), nanmean(FA_new_S),'--','Color',colorall(2,:),'LineWidth', 2);
fill([1:size(plotdataFA_S,1) size(plotdataFA_S,1):-1:1], [plotdataFA_S(:,2)', fliplr(plotdataFA_S(:,3)')], ...
    colorall(2,:), 'EdgeAlpha', 0, 'FaceAlpha', 0.15);
xlim([1 size(FA_new_NS,2)]);
ylim([-2 2]);
xlabel('Times(s)','FontSize',25);

set(gca,'XTick',[1 31 61 91 121 150],'FontSize',15);
set(gca,'XTickLabel',[-0.3 0 0.3 0.6 0.9 1.2],'FontSize',15);
set(gca,'YTick',[-2 -1 0 1 2],'FontSize',15);
hold on;plot([31 31],[-2 2],'k--','LineWidth',2);
legend(namenow,'FontSize',10,'Location','best','box','off');
title(titlename,'FontSize',25);
set(gca,'FontName','Arial','FontWeight','bold');
box on;

set(gcf,'position',[0,0,600 400]);
%% 
color_matrix= [addcolorplus(94);addcolorplus(49)];
NSbeta = nanmean(covFA_bin_NS); 
NSbetastd = nanstd(covFA_bin_NS)/sqrt(length(covFA_bin_NS));
Sbeta =  nanmean(covFA_bin_S); 
Sbetastd = nanstd(covFA_bin_S)/sqrt(length(covFA_bin_S));

figure
hold on
y=[NSbeta,Sbeta];
errory = [Sbetastd,NSbetastd];
h = bar(y,'FaceColor',addcolorplus(4));
for errori = 1:size(y,2)
if y(errori)>0
errorbar(errori, y(errori), [], errory(errori),'.k','LineWidth',1.5,'CapSize',25);
else    
errorbar(errori, y(errori), errory(errori),[], '.k','LineWidth',1.5,'CapSize',25);
end 
end
scatter(ones(length(covFA_bin_NS),1) + randn(length(covFA_bin_NS),1)*0.13, covFA_bin_NS, 'MarkerEdgeColor', color_matrix(1,:),'MarkerEdgeAlpha', 0.3,'MarkerFaceColor', color_matrix(1,:), 'MarkerFaceAlpha', 0.3, 'LineWidth', 2);
scatter(2*ones(length(covFA_bin_S),1) + randn(length(covFA_bin_S),1)*0.13, covFA_bin_S, 'MarkerEdgeColor', color_matrix(2,:),'MarkerEdgeAlpha', 0.3,'MarkerFaceColor', color_matrix(2,:), 'MarkerFaceAlpha', 0.3, 'LineWidth', 2);

set(gca,'FontSize',20,'XTick',1:2,'XTickLabel',{'No-Stim','Stim'});
xlim([0 3]);
xlabel('Condition','FontSize',25);
ylabel('Beta power','FontSize',25);
set(gca, 'Linewidth', 0.5);
title(titlename,'FontSize',25);
set(gca,'FontName','Arial','FontWeight','bold');

set(gcf,'position',[0,0,400 400]);
%%
FAchange = [0.1333    0.0167    0.0667         0    0.0417    0.0167   -0.0333    0.0500];
% FAchange = Behavior2_nos(3,:)-Behavior2_sti(3,:);

subunique = unique(suball_NS);
diffFA = nan(1,length(subunique));
for cii = 1:length(subunique)
    subnow = subunique(cii);
    NSnow = covFA_bin_NS(suball_NS == subnow);
    Snow = covFA_bin_S(suball_S == subnow);
    diffFA(cii) = nanmean(NSnow) - nanmean(Snow);
end

FAchange(~ismember(1:8,subunique))=[];
nanidk = find(isnan(diffFA));
diffFA(nanidk) = [];
FAchange(nanidk) = [];

[Rraw PR] = corrper(diffFA,FAchange,10000);
mdl = fitlm(diffFA,FAchange)
xRange = linspace(min(diffFA), max(diffFA), 1000);
[yFit, yCI] = predict(mdl, xRange');

[coeff, S] = polyfit(diffFA, FAchange, 1);
x_fit = linspace(min(diffFA), max(diffFA), 1000);
[fit_y_ci, delta] = polyval(coeff, x_fit, S); 

map = addcolorplus(2);
figure;hold on;
scatter(diffFA, FAchange,'ok','MarkerFaceColor','k','MarkerEdgeColor','k','LineWidth', 4);
fill([xRange fliplr(xRange)], [yCI(:, 1)' fliplr(yCI(:, 2)')],map, 'EdgeAlpha', 0, 'FaceAlpha', 0.15);
plot(x_fit, fit_y_ci, '-k', 'LineWidth', 1.5);
ylabel('Decrease of FA Rate','FontSize',25);
xlabel('Decrease of Beta','FontSize',25);
ylim([-0.15 0.2]);
xlim([-2.2 1.7]);
set(gca,'FontSize',20,'XTick',-2:0.5:1.5);
set(gcf,'position',[0,0,600 400]);