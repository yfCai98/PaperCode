function Pdotbar(data,barmap,dotmap)
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
    dotmapall = repmat(dotmap,size(data,2),1);
else
    dotmapall = dotmap;
end

for ci = 1:size(data,2)
    scatter(ci*ones(num,1) + randn(num,1)*0.1, data(:,ci), 'MarkerEdgeColor', dotmapall(ci,:),'MarkerEdgeAlpha', 0.6,'MarkerFaceColor', dotmapall(ci,:), 'MarkerFaceAlpha', 0.6, 'LineWidth', 1);
end

end