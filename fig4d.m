clear;clc;
load('fig4d.mat');

X = CHAT_score_ALL(:,1); % H_score  or CH_all(:,2)
Y =  allnu; % allnu allbeta allomega  allseita

[mdl_clean,outidk] = fitlm_clean(X,Y);
idkin = ~ismember(1:length(X),outidk);
map = addcolorplus(2);
xRange = linspace(min(X(idkin)), max(X(idkin)), 100);
[yFit, yCI] = predict(mdl_clean, xRange');

figure;
scatter(X(idkin), Y(idkin),'ok','MarkerFaceColor','k','MarkerEdgeColor','k','LineWidth', 5);
hold on;
plot(xRange, yFit, '-k', 'LineWidth', 2);
fill([xRange fliplr(xRange)], [yCI(:, 1)' fliplr(yCI(:, 2)')],map, 'EdgeAlpha', 0, 'FaceAlpha', 0.15);

xlim([0 max(X)]);
set(gca,'Linewidth',2);
set(gca,'FontSize',20,'FontWeight','bold');
set(gca,'FontName','Times New Roman','FontWeight','bold');
set(gcf,'position',[0,0,600 400]);