function Pdotline(data,linemap,dotmap)
num = size(data,1);
y = nanmean(data);
errory = nanstd(data) / sqrt(num);
hold on;

if size(dotmap,1)==1
    dotmapall = repmat(dotmap,size(data,1),1);
else
    dotmapall = dotmap;
end

for ci = 1:size(data,1)
%     plot(1:size(data,2), data(ci,:), '-', 'LineWidth', 0.5,'Color',dotmapall(ci,:));
    scatter(1:size(data,2), data(ci,:),10,...
        'MarkerEdgeColor', dotmapall(ci,:),'MarkerFaceColor', dotmapall(ci,:),...
        'MarkerEdgeAlpha', 0.4,'MarkerFaceAlpha', 0.4);
end

scatter(1:size(data,2), y, 300, 'filled', 'MarkerFaceColor', linemap,'MarkerEdgeColor',linemap,'MarkerEdgeAlpha', 1,'MarkerFaceAlpha', 1);
errorbar(1:size(data,2),y, errory,'LineWidth',1,'Color','k','LineStyle','no');

end