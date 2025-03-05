%% fig4.c
addpath(genpath('/data/'));
addpath(genpath('/code/'));
load('fig4c.mat');
%%  prior beliefs for three conditions
barmap = addcolorplus(5);
dotmap = [addcolorplus(179);addcolorplus(160);addcolorplus(3)];
ylimnum=[0 0.7;-0.85 0.65;0 1.2];
figure;
x= [1 2 3];
for uiii=1:3
    subplot(3,1,4-uiii)
    hold on;
    u_now = squeeze(u_chose(uiii,:,:))';
    Pdotbar(u_now,barmap,dotmap)
    
%     [h,p,ci,stats]=ttest(u_now(:,2),u_now(:,3), 'Tail', 'right');
%     pall(uiii) = p*2; %Bonferroni correction
%     tall(uiii) = stats.tstat;
    
    set(gca,'FontSize',10,'XTick',x,'XTickLabel',{'Hit','FA','CR'});
    ylabel('Prior Belief','FontSize',15);
    if uiii==1
    xlabel('Condition','FontSize',15);
    end   
    ylim(ylimnum(uiii,:))
    set(gca,'FontName','Arial');
end
set(gcf,'position',[0,0,400 600]);
%%
disp('Figure 4c has been successfully generated.');