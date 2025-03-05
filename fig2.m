addpath(genpath('/data/'));
addpath(genpath('/code/'));
load('fig2.mat');
figure
%% fig2.b
subplot(2,4,1);hold on;
color_matrix = [addcolorplus(9);addcolorplus(5);addcolorplus(2);addcolorplus(1)];
for i = 1:12
    b = bar(i:i+3,[degree_list_new(i,:);0,0,0,0;0,0,0,0;0,0,0,0],'stacked'); 
    set(b(1),'facecolor',color_matrix(1,:))
    set(b(2),'facecolor',color_matrix(2,:))
    set(b(3),'facecolor',color_matrix(3,:))
    set(b(4),'facecolor',color_matrix(4,:))
end
xlim([0 13]);
set(gca,'FontSize',12,'XTick',1:12);
xtickangle(0);
ylabel({'Num of trials'},'FontSize',15);
xlabel({'Block'},'FontSize',15);
legend({'No tone','25% Threshold','50% Threshold','75% Threshold'},'FontSize',10,'Location','best');
set(gca,'FontName','Arial');
%% fig2.c
num = size(alldegree,1);
map_now =[addcolorplus(62);addcolorplus(256);addcolorplus(252)];
ynamne = {'ACC rate','Hit rate','FA num'};
subplot(2,4,2);
for c =1:2
hold on
errorbar(1:12,mean(alldata{c}),std(alldata{c})/sqrt(num),'o','Markersize',7,...
    'MarkerFaceColor',map_now(c,:),'MarkerEdgeColor',map_now(c,:),'LineWidth',1,'Color','k');
end  
ylim([0 1]);
set(gca,'FontSize',12,'YTick',0:0.2:1);
ylabel('Probability','FontSize',15);
yyaxis right;
set(gca, 'YColor', 'k');
fatrial = alldata{3}.*repmat([2 8 11 12 13 14 14 14 14 14 14 14],num,1);
errorbar(1:12,mean(fatrial),std(fatrial)/sqrt(num),'o','Markersize',7,...
    'MarkerFaceColor',map_now(3,:),'MarkerEdgeColor',map_now(3,:),'LineWidth',1,'Color','k');
ylim([0 8]);
legend(ynamne,'FontSize',10,'box','off','location','best');
xlabel('Block','FontSize',15);
ylabel('Trial num','FontSize',15);
xlim([0 13]);
set(gca,'FontName','Arial');
%% fig2.d
barmap = addcolorplus(5);
dotmap = addcolorplus(2);
subplot(2,4,3);
Plinebar(alldegree,barmap,dotmap);
set(gca,'FontSize',12,'XTick',1:4,'XTickLabel',{'No tone','25%','50%','75%'});
xtickangle(0);
set(gca,'FontSize',12,'YTick',0:0.2:1);
set(gca, 'Box', 'off');
ylabel({'Signal choice'},'FontSize',15);
xlabel({'Intensity of tone'},'FontSize',15);
xlim([0.5 4.5])
ylim([0 1])
set(gca,'FontName','Arial');
%% fig2.e
subplot(2,4,4);
allnewconfidencenum = squeeze(round(mean(allnewconfidence,3),2));
imagesc(allnewconfidencenum,'CDataMapping','scaled');
for xii = 1:3
    for yii = 1:4
        text(yii-0.18,xii,num2str(allnewconfidencenum(xii,yii),'%.2f'),'FontSize',10);
    end
end
caxis([2.8, 3.8]);
% colorbar
set(gca,'FontSize',12,'XTick',[1 2 3 4],'XTickLabel',{'No tone','25%','50%','75%'});
xtickangle(0);
set(gca,'FontSize',12,'YTick',[1 2 3],'YTickLabel',{'Yes','No','All'});
ylabel('Chosice','FontSize',15);
xlabel('Intensity of tone','FontSize',15);
colormap(addcolorplus(276));
set(gca,'FontName','Arial');
%% fig2.f
barmap = addcolorplus(5);
dotmap = addcolorplus(62);
allacc = allconacc(:,:,2);
subplot(2,4,5);
allacc(find(sum(isnan(allacc),2)),:)=[];
Plinebar(allacc,barmap,dotmap)
set(gca,'FontSize',12,'XTick',1:4,'XTickLabel',{'1','2','3','4'});
ylabel('ACC','FontSize',15);
xlabel('Confidence degree','FontSize',15 );
xlim([0 5]);
ylim([0 1]);

set(gca, 'Box', 'off');
set(gca,'FontName','Arial');
%% fig2.g
barmap = addcolorplus(5);
dotmap = addcolorplus(252);
subplot(2,4,6);
CHnum = squeeze(allCH_con(:,:,2));
% Pdotbar(CHnum,barmap,dotmap);
Plinebar(CHnum,barmap,dotmap);
set(gca,'FontSize',12,'XTick',1:4,'XTickLabel',{'1','2','3','4'});
ylabel('Trials of FA','FontSize',15);
xlabel('Confidence degree','FontSize',15 );
ylim([0 55]);

set(gca, 'Box', 'off');
set(gca,'FontName','Arial');
%% fig2.h and i
H_score = CHAT_score_ALL(:,1);
Y = H_score;
X1 = CH_all(:,2);
X2 = dprime;

mdl1 = fitlm(X1, Y);
mdl2 = fitlm(X2, Y);
xRange1 = linspace(0, 0.6, 1000);
xRange2 = linspace(0.5, 1, 1000);
[yFit1, yCI1] = predict(mdl1, xRange1');
[yFit2, yCI2] = predict(mdl2, xRange2');

map = addcolorplus(2);
subplot(2,4,7);hold on;
scatter(X1, Y,'ok','MarkerFaceColor','k','MarkerEdgeColor','k','LineWidth', 2);
plot(xRange1, yFit1, '-k', 'LineWidth', 2.5);
fill([xRange1 fliplr(xRange1)], [yCI1(:, 1)' fliplr(yCI1(:, 2)')],map, 'EdgeAlpha', 0, 'FaceAlpha', 0.15);
set(gca,'FontSize',12,'YTick',0:2:8);
set(gca,'FontSize',12,'XTick',0:0.2:0.6);
ylim([0 8]);
xlim([0 0.6]);
ylabel('AH score','FontSize',15);
xlabel('FA rate','FontSize',15);
set(gca,'FontName','Arial');

subplot(2,4,8);hold on;
scatter(X2, Y,'ok','MarkerFaceColor','k','MarkerEdgeColor','k','LineWidth', 2);
plot(xRange2, yFit2, '-k', 'LineWidth', 2.5);
fill([xRange2 fliplr(xRange2)], [yCI2(:, 1)' fliplr(yCI2(:, 2)')],map, 'EdgeAlpha', 0, 'FaceAlpha', 0.15);
set(gca,'FontSize',12,'YTick',0:2:8);
set(gca,'FontSize',12,'XTick',0.5:0.1:1);
ylim([0 8]);
xlim([0.5 1]);
xlabel('D-prime','FontSize',15);
ylabel('AH score','FontSize',15);
set(gca,'FontName','Arial');

set(gcf,'position',[0,0,2200 600]);
%%
disp('Figure 2 has been successfully generated.');