%% fig4.d
addpath(genpath('/data/'));
addpath(genpath('/code/'));
load('fig4d.mat');
figure;
%% linear regression:AH score and nu
subplot(2,2,1);hold on;
X = CHAT_score_ALL(:,1); 
Y =  allnu; 
[mdl_clean,outidk] = fitlm_clean(X,Y);
idkin = ~ismember(1:length(X),outidk);
map = addcolorplus(2);
xRange = linspace(min(X(idkin)), max(X(idkin)), 100);
[yFit, yCI] = predict(mdl_clean, xRange');

scatter(X(idkin), Y(idkin),'ok','MarkerFaceColor','k','MarkerEdgeColor','k','LineWidth', 2);
plot(xRange, yFit, '-k', 'LineWidth', 1);
fill([xRange fliplr(xRange)], [yCI(:, 1)' fliplr(yCI(:, 2)')],map, 'EdgeAlpha', 0, 'FaceAlpha', 0.15);

xlim([0 max(X)]);
ylabel('Prior weighting','FontName','Arial','FontSize',25);
xlabel('AH score','FontName','Arial','FontSize',25);
set(gca,'FontSize',10);
set(gca,'FontName','Arial');
%% linear regression:CH rate and nu
subplot(2,2,2);hold on;
X = CH_all(:,2); 
Y =  allnu;
[mdl_clean,outidk] = fitlm_clean(X,Y);
idkin = ~ismember(1:length(X),outidk);
map = addcolorplus(2);
xRange = linspace(min(X(idkin)), max(X(idkin)), 100);
[yFit, yCI] = predict(mdl_clean, xRange');

scatter(X(idkin), Y(idkin),'ok','MarkerFaceColor','k','MarkerEdgeColor','k','LineWidth', 2);
plot(xRange, yFit, '-k', 'LineWidth', 1);
fill([xRange fliplr(xRange)], [yCI(:, 1)' fliplr(yCI(:, 2)')],map, 'EdgeAlpha', 0, 'FaceAlpha', 0.15);

xlim([0 max(X)]);
ylabel('Prior weighting','FontName','Arial','FontSize',25);
xlabel('FA rate','FontName','Arial','FontSize',25);
set(gca,'FontSize',10);
set(gca,'FontName','Arial');
%% linear regression:AH score and allbeta
subplot(2,2,3);hold on;
X = CHAT_score_ALL(:,1); 
Y =  allbeta; 
[mdl_clean,outidk] = fitlm_clean(X,Y);
idkin = ~ismember(1:length(X),outidk);
map = addcolorplus(2);
xRange = linspace(min(X(idkin)), max(X(idkin)), 100);
[yFit, yCI] = predict(mdl_clean, xRange');

scatter(X(idkin), Y(idkin),'ok','MarkerFaceColor','k','MarkerEdgeColor','k','LineWidth', 2);
plot(xRange, yFit, '-k', 'LineWidth', 1);
fill([xRange fliplr(xRange)], [yCI(:, 1)' fliplr(yCI(:, 2)')],map, 'EdgeAlpha', 0, 'FaceAlpha', 0.15);

xlim([0 max(X)]);
ylabel('Decision noise','FontName','Arial','FontSize',25);
xlabel('AH score','FontName','Arial','FontSize',25);
set(gca,'FontSize',10);
set(gca,'FontName','Arial');
%% linear regression:CH rate and allbeta
subplot(2,2,4);hold on;
X = CH_all(:,2); 
Y =  allbeta; 
[mdl_clean,outidk] = fitlm_clean(X,Y);
idkin = ~ismember(1:length(X),outidk);
map = addcolorplus(2);
xRange = linspace(min(X(idkin)), max(X(idkin)), 100);
[yFit, yCI] = predict(mdl_clean, xRange');

scatter(X(idkin), Y(idkin),'ok','MarkerFaceColor','k','MarkerEdgeColor','k','LineWidth', 2);
plot(xRange, yFit, '-k', 'LineWidth', 1);
fill([xRange fliplr(xRange)], [yCI(:, 1)' fliplr(yCI(:, 2)')],map, 'EdgeAlpha', 0, 'FaceAlpha', 0.15);

xlim([0 max(X)]);
ylabel('Decision noise','FontName','Arial','FontSize',25);
xlabel('FA rate','FontName','Arial','FontSize',25);
set(gca,'FontSize',10);
set(gca,'FontName','Arial');
set(gcf,'position',[0,0,600 400]);
%%
disp('Figure 4d has been successfully generated.');