TFfreidk_plot = 2:2:150;

set(gca,'XTick',[1 31 61 91 121 150],'FontSize',15);
set(gca,'XTickLabel',[-0.3 0 0.3 0.6 0.9 1.2],'FontSize',15);
set(gca,'YTick',5:10:75,'FontSize',15);
set(gca,'YTickLabel',TFfreidk_plot(5:10:75),'FontSize',15);  
ylabel('Frequency(Hz)','FontSize',20);
xlabel('Time(s)','FontSize',20);
plot([31 31],[1 75],'k--','LineWidth',2);
set(gca,'FontName','Times New Roman','FontWeight','bold');
axis xy

