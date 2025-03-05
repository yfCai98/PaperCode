%% fig4.b
addpath(genpath('/data/'));
addpath(genpath('/code/'));
load('fig4b.mat');
%% Mean trajectories of perceptual beliefs
figure
ylabname = {'μ1','μ2','μ3'};
for f = 1:3
    subplot(3,1,4-f)
    hold on
    data_plot = uallblk{f};
    data_plot_mean = mean(data_plot);
    data_plot_std = std(data_plot)/sqrt(size(data_plot,1));
    upper = (data_plot_mean+data_plot_std)';
    lower = (data_plot_mean-data_plot_std)';
    plot(1:size(data_plot,2), mean(data_plot), 'LineWidth', 4,'Color',addcolorplus(2));
    fill([1:size(data_plot,2) fliplr(1:size(data_plot,2))], [(upper)', fliplr((lower)')], ...
        addcolorplus(2), 'EdgeAlpha', 0, 'FaceAlpha', 0.15);
    xlim([1 12]);
    set(gca,'FontSize',10,'XTick',2:2:12);
    xtickangle(0);
    ylim([min(lower)-0.15,max(upper)+0.05]);
    ylabel(ylabname{f},'FontSize',15);
    if f==1
    xlabel('Block','FontSize',15);
    end   
    set(gca,'FontName','Arial');
end
set(gcf,'position',[0,0,400 600]);
%%
disp('Figure 4b has been successfully generated.');