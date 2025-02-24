function Plinebar(data,barmap,dotmap)
num = size(data,1);
y = nanmean(data);
errory = nanstd(data) / sqrt(num);
hold on;
h = bar(y,'FaceColor',barmap);
for errori = 1:size(y,2)
    if y(errori)>0
        errorbar(errori, y(errori), [], errory(errori),'.k','LineWidth',1.5,'CapSize',15);
    else
        errorbar(errori, y(errori), errory(errori),[], '.k','LineWidth',1.5,'CapSize',15);
    end
end

if size(dotmap,1)==1
    dotmapall = repmat(dotmap,size(data,1),1);
else
    dotmapall = dotmap;
end

for ci = 1:size(data,1)
    plot(1:size(data,2), data(ci,:), '-', 'LineWidth', 0.7,'Color',dotmapall(ci,:));
    scatter(1:size(data,2), data(ci,:),15,...
        'MarkerEdgeColor', dotmapall(ci,:),'MarkerFaceColor', dotmapall(ci,:),...
        'MarkerEdgeAlpha', 0.5,'MarkerFaceAlpha', 0.5);
end

end