function clust_ori_new=FSplotbefore(clust_ori,p_sort,clust_size)

p_sig=find(p_sort<0.05 | p_sort==0.05);
clust_ori_new = clust_ori;
for i=1:length(clust_size)
    if ismember(i,p_sig)
        clust_ori_new(clust_ori==i)=1;
    else
        clust_ori_new(clust_ori==i)=0;
    end
end
end