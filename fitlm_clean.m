function [mdl_clean,outidk] = fitlm_clean(X,Y)
mdl = fitlm(X, Y);
residuals = mdl.Residuals.Raw;
z_scores = abs(zscore(residuals));  % z-score
threshold = 3;  % z-score3
outliers = z_scores > threshold;
X_clean = X(~outliers);
Y_clean = Y(~outliers);
mdl_clean = fitlm(X_clean, Y_clean);
if sum(outliers)~=0
outidk = find(outliers);
else
outidk = [];
end
end