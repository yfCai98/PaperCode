function [Rraw PR] = corrper(X,Y,n)
X=reshape(X,[],1);
Y=reshape(Y,[],1);
Rraw = corr(X, Y, 'Type', 'Pearson');
% Rraw = corr(X, Y, 'Type', 'Spearman');
for pi = 1:n
X=X(randperm(length(X)));    
Rsave(pi) = corr(X, Y, 'Type', 'Pearson');
% Rsave(pi) = corr(X, Y, 'Type', 'Spearman');
end
[~,R_sort]=min(abs(flip(sort(Rsave))-Rraw));
PR = R_sort/n;  
end