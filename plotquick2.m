set(gca,'XTick',[1 31 61 91 121 150],'FontSize',15);
set(gca,'XTickLabel',[-0.3 0 0.3 0.6 0.9 1.2],'FontSize',15);
set(gca,'YTick',[-0.6 0 0.6],'FontSize',15);
xlabel('Time(s)','FontSize',20);
ylabel('Power','FontSize',20);
plot([31 31],[-5,5],'k--','LineWidth',2);
set(gca,'FontName','Times New Roman','FontWeight','bold');
box on;
