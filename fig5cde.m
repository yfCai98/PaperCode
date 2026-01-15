%% fig5
clear;close all;
addpath(genpath('/data/'));
addpath(genpath('/code/'));
load('fig5cde.mat')
map_now =[addcolorplus(62);addcolorplus(256);addcolorplus(160)];
mapnow2 = [addcolorplus(94);addcolorplus(49)];
%% fig5.a
figure;subplot(1,3,1);hold on;
SignalChose_no = squeeze(SignalChose(1,:,:));
SignalChose_s = squeeze(SignalChose(2,:,:));
errorbar(1:4,mean(SignalChose_no,2)',std(SignalChose_no')/sqrt(num),'o-','Markersize',15,...
    'MarkerFaceColor',addcolorplus(94),'MarkerEdgeColor',addcolorplus(94),'LineWidth',2,'Color','k');
errorbar(1:4,mean(SignalChose_s,2)',std(SignalChose_s')/sqrt(num),'o-','Markersize',15,...
    'MarkerFaceColor',addcolorplus(49),'MarkerEdgeColor',addcolorplus(49),'LineWidth',2,'Color','k');
for ci = 1:size(SignalChose_no,1)
    scatter((ci-0.3)*ones(num,1) + randn(num,1)*0.01, SignalChose_no(ci,:),15, 'MarkerEdgeColor', addcolorplus(94),'MarkerEdgeAlpha', 0.5,'MarkerFaceColor', addcolorplus(94), 'MarkerFaceAlpha', 0.5);
end
for ci = 1:size(SignalChose_s,1)
    scatter((ci+0.3)*ones(num,1) + randn(num,1)*0.01, SignalChose_s(ci,:),15, 'MarkerEdgeColor', addcolorplus(49),'MarkerEdgeAlpha', 0.5,'MarkerFaceColor', addcolorplus(49), 'MarkerFaceAlpha', 0.5);
end
legend({'Non-ES','ES'},'FontSize',10,'Location','best','box','off');
set(gca,'FontSize',10,'XTick',1:4,'XTickLabel',{'0db','25%','50%','75%'});
ylabel('Signal choice','FontName','arial','FontSize',12);
xlabel('Signal db','FontName','arial','FontSize',12);
set(gca,'FontName','Arial');
xlim([0 5]);
% stimOrder = str2num([num2str(ESblock(:,1)) num2str(ESblock(:,2))]);
% [SC_anova, SC_model] = ESsupbehav_stat4SC_LME(SignalChose, stimOrder);
%% fig5.b
subplot(1,3,2);hold on;
Behavior2_nos = squeeze(Behavior_cov(1,:,:));
Behavior2_sti = squeeze(Behavior_cov(2,:,:));
xp = [1 2;4 5;7 8];
for pbi =1:3
    meanplotdata = [mean(Behavior2_nos(pbi,:)) mean(Behavior2_sti(pbi,:))];
    stdplotdata = [std(Behavior2_nos(pbi,:)) std(Behavior2_sti(pbi,:))]/sqrt(num);
    for hi = 1:length(meanplotdata)
        h = bar(xp(pbi,hi),meanplotdata(hi),'FaceColor',mapnow2(hi,:));
        for errori = 1:size(meanplotdata,2)
            if meanplotdata(errori)>0
                errorbar(xp(pbi,hi), meanplotdata(hi), [], stdplotdata(hi),'.k','LineWidth',1.5,'CapSize',10);
            else
                errorbar(xp(pbi,hi), meanplotdata(hi), stdplotdata(hi),[], '.k','LineWidth',1.5,'CapSize',10);
            end
        end
    end
    
    x_a = xp(pbi,1) * ones(num,1) + 0.06 * randn(num,1);
    x_b = xp(pbi,2) * ones(num,1) + 0.06 * randn(num,1);
    scatter(x_a,Behavior2_nos(pbi,:)','MarkerEdgeColor',map_now(pbi,:));
    scatter(x_b,Behavior2_sti(pbi,:)','MarkerEdgeColor',map_now(pbi,:),'MarkerFaceColor',map_now(pbi,:));
    for ii = 1:length(x_a)
        plot([x_a(ii), x_b(ii)], [Behavior2_nos(pbi,ii),Behavior2_sti(pbi,ii)], '-k','LineWidth',1.5);
    end
end
set(gca,'FontSize',10,'XTick',[1.5 4.5 7.5],'XTickLabel',{'Acc','Hit','FA'});
ylabel('Confident rate','FontSize',12);
xlim([0 9]);
set(gca,'FontName','Arial');
% [msdata,tdata,pdata] = ESstat4order_LME(Behavior_cov,ESblock);
%% fig5.c
subplot(1,3,3);hold on;
Behavior2_nos = squeeze(Behavior_cov(1,:,:));
Behavior2_sti = squeeze(Behavior_cov(2,:,:));
FAchange = Behavior2_nos(3,:)-Behavior2_sti(3,:);
H_score = [7,0,5,3,4,1,2,0,3,0,0,0,3,4,3,7,6,0]';
mdl = fitlm(H_score,FAchange);
xRange = linspace(0, 8, 1000);
[yFit, yCI] = predict(mdl, xRange');
scatter(H_score, FAchange,'ok','MarkerFaceColor','k','MarkerEdgeColor','k','LineWidth', 4);
plot(xRange, yFit, '-k', 'LineWidth', 2);
fill([xRange fliplr(xRange)], [yCI(:, 1)' fliplr(yCI(:, 2)')],addcolorplus(2), 'EdgeAlpha', 0, 'FaceAlpha', 0.15);
set(gca,'FontSize',10,'XTick',1:9);
set(gca,'FontSize',10,'YTick',-0.1:0.1:0.2);
ylabel('Decrease of FA rate','FontSize',12);
xlabel('AH score','FontSize',12);
set(gca,'FontName','Arial');
xlim([0 8]);
set(gcf,'position',[0,0,1200 300]);
%%
set(gcf,'Renderer','painters');
print(gcf, '-djpeg', ['/results/' 'figure5cde.jpg'], '-r300');
disp('Figure 5cde has been successfully generated.');