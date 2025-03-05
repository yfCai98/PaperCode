function [xx yy] = plotfeak_PAC(Tsave,clust_ori_new,colornum) 
ifidk = find(clust_ori_new~=0);
if ~isempty(ifidk)
[xnum,ynum]=size(Tsave);
a1 = Tsave;
a1(~logical(clust_ori_new))=0;
[xx yy]=find(a1==max(max(a1)));
hold on;
plot([xx xx],[1 ynum],'--','LineWidth',2,'Color',colornum);
plot([1 xnum],[yy yy],'--','LineWidth',2,'Color',colornum);
else
    xx =[];
    yy =[];
end
end