load('fig4c.mat');
color_matrix = [addcolorplus(179);addcolorplus(160);addcolorplus(3)];
ylimnum=[0 0.7;-0.85 0.65;0 1.2];
pall = [];
tall = [];
for uiii=1:3
    figure;
    hold on;
    x= [1 2 3];
    y=[mean(squeeze(u_chose(uiii,3,:))),nanmean(squeeze(u_chose(uiii,1,:))),...
        mean(squeeze(u_chose(uiii,2,:)))];
    errory=[std(squeeze(u_chose(uiii,3,:)))/sqrt(21),nanstd(squeeze(u_chose(uiii,1,:)))/sqrt(21),...
        std(squeeze(u_chose(uiii,2,:)))/sqrt(21)];
    
%     [h,p,ci,stats]=ttest(squeeze(u_chose(uiii,1,:)),squeeze(u_chose(uiii,3,:)), 'Tail', 'right')
%     pall(uiii) = p;
%     tall(uiii) = stats.tstat;
    for i = 1:3
        h = bar(x(i),y(i),0.8,'stacked');
        set(h(1),'facecolor',color_matrix(i,:))
    end
    for errori = 1:size(y,2)
        if y(errori)>0
            errorbar(errori, y(errori), [], errory(errori),'.k','LineWidth',2,'CapSize',25);
        else
            errorbar(errori, y(errori), errory(errori),[], '.k','LineWidth',2,'CapSize',25);
        end
    end
    
    xlabel('Condition','FontSize',30,'FontWeight','bold');
    ylabel('Prior Belief','FontSize',30,'FontWeight','bold');
    set(gca,'FontSize',25,'XTick',x,'XTickLabel',{'Hit','FA','CR'});
    set(gca, 'Linewidth', 3);
    ylim(ylimnum(uiii,:))
    set(gcf,'position',[0,0,500 300]);
end
